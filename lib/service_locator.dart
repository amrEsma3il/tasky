import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'src/core/utilits/services/api/app_interceptors.dart';
import 'src/core/utilits/services/api/dio_consumer.dart';
import 'src/features/auth/data/data_sources/remote_data_sources/auth_remote_data_source.dart';
import 'src/features/auth/data/repo/auth_repo.dart';
import 'src/features/auth/logic/login_cubit/login_cubit.dart';
import 'src/features/auth/logic/login_cubit/padding_cubit/pading_cubit.dart';
import 'src/features/auth/logic/login_cubit/password_cubit/password_cubit.dart';
import 'src/features/onboarding/logic/onboarding_cubit/onboarding_cubit.dart';
import 'src/features/splash/logic/splash_cubit/splash_cubit.dart';
import 'src/features/task/data/data_sources/task_remote_data_source.dart';
import 'src/features/task/data/repo/task_repo.dart';
import 'src/features/task/logic/change_status_cubit/change_status_cubit.dart';
import 'src/features/task/logic/task_cubit/task_cubit.dart';

final serviceLocator = GetIt.instance;
Future<void> init() async {
//Bloc 

  serviceLocator.registerFactory<OnboardingCubit>(() => OnboardingCubit());
    serviceLocator.registerFactory<ChangeStatusCubit>(() => ChangeStatusCubit());

  serviceLocator.registerFactory<SplashCubit>(() => SplashCubit());
  serviceLocator.registerFactory<LoginCubit>(
      () => LoginCubit(authRepo: serviceLocator()));

      serviceLocator.registerFactory<TaskCubit>(
      () => TaskCubit(hive: serviceLocator(),taskRepo: serviceLocator()));//
 
       serviceLocator.registerFactory<PaddingCubit>(
      () => PaddingCubit());
    
       serviceLocator.registerFactory<PasswordCubit>(
      () => PasswordCubit());

//Repos
  serviceLocator.registerLazySingleton(
      () => AuthRepo(authRemoteDataSource: serviceLocator(),sharedPreferences: serviceLocator()));

  serviceLocator.registerLazySingleton(
      () => TaskRepo(taskRemoteDataSource: serviceLocator()));

//
//DataSources

  serviceLocator.registerLazySingleton(
      () => AuthRemoteDataSource(dioConsumer: serviceLocator()));


  serviceLocator.registerLazySingleton(
      () => TaskRemoteDataSource(dioConsumer: serviceLocator()));
 
      
    
  //External
  
 serviceLocator.registerLazySingleton(
      () => DioConsumer(client: serviceLocator(),appIntercepters: serviceLocator(),logInterceptor: serviceLocator()));  

  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);
    serviceLocator.registerLazySingleton(() => Hive);

  serviceLocator.registerLazySingleton(() => Dio());

  serviceLocator.registerLazySingleton(() => LogInterceptor(
      responseBody: true,
      error: true,
      requestHeader: true,
      responseHeader: true,
      request: true,
      requestBody: true));
  serviceLocator
      .registerLazySingleton(() => AppIntercepters(client: serviceLocator(),sharedPreferences: serviceLocator()));
}
