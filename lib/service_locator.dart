import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/core/utilits/services/api/api_consumer.dart';
import 'src/core/utilits/services/api/app_interceptors.dart';
import 'src/core/utilits/services/api/dio_consumer.dart';
import 'src/features/onboarding/logic/onboarding_cubit/onboarding_cubit.dart';
import 'src/features/splash/logic/splash_cubit/splash_cubit.dart';


final serviceLocator = GetIt.instance;
Future<void> init() async {
//Bloc
  serviceLocator.registerFactory<OnboardingCubit>(() =>OnboardingCubit() );
   serviceLocator.registerFactory<SplashCubit>(() =>SplashCubit() );

  //External
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);
  serviceLocator.registerLazySingleton(() => Dio());
  serviceLocator.registerLazySingleton<ApiConsumer>(
      () => DioConsumer(client: serviceLocator()));
  serviceLocator.registerLazySingleton(() => LogInterceptor(
      responseBody: true,
      error: true,
      requestHeader: true,
      responseHeader: true,
      request: true,
      requestBody: true));
  serviceLocator.registerLazySingleton(() => AppIntercepters(
      client: serviceLocator()));
}
