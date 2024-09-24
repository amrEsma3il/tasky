import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky/src/features/task/logic/task_datails_cubit/task_datails_cubit.dart';
import 'src/core/utilits/services/api/app_interceptors.dart';
import 'src/core/utilits/services/api/dio_consumer.dart';
import 'src/core/utilits/services/network/network_info.dart';
import 'src/features/auth/data/data_sources/remote_data_sources/auth_remote_data_source.dart';
import 'src/features/auth/data/repo/auth_repo.dart';
import 'src/features/auth/logic/experience_level_cubit/experience_level_cubit.dart';
import 'src/features/auth/logic/login_cubit/login_cubit.dart';
import 'src/features/auth/logic/padding_cubit/pading_cubit.dart';
import 'src/features/auth/logic/password_cubit/password_cubit.dart';
import 'src/features/auth/logic/logout_cubit/log_out_cubit.dart';
import 'src/features/auth/logic/profile_cubit/profile_cubit.dart';
import 'src/features/auth/logic/register_cubit/register_cubit.dart';
import 'src/features/onboarding/logic/onboarding_cubit/onboarding_cubit.dart';
import 'src/features/splash/logic/splash_cubit/splash_cubit.dart';
import 'src/features/task/data/data_sources/task_remote_data_source.dart';
import 'src/features/task/data/repo/task_repo.dart';
import 'src/features/task/logic/add_task/add_task_cubit/add_task_cubit.dart';
import 'src/features/task/logic/add_task/image_cubit.dart';
import 'src/features/task/logic/add_task/image_task_cubit.dart';
import 'src/features/task/logic/add_task/priority_cubit/priority_cubit.dart';
import 'src/features/task/logic/add_task/upload_image_cubit/upload_image_cubit.dart';
import 'src/features/task/logic/change_status_cubit/change_status_cubit.dart';
import 'src/features/task/logic/delete_cubit/delete_task_cubit.dart';
import 'src/features/task/logic/task_cubit/task_cubit.dart';
import 'src/features/task/logic/update_cubit/edit_task_cubit.dart';

final serviceLocator = GetIt.instance;
Future<void> init() async {
//Bloc

// add task 
  serviceLocator
      .registerFactory<AddTaskCubit>(() => AddTaskCubit(serviceLocator()));


  serviceLocator
      .registerFactory<DeleteTaskCubit>(() => DeleteTaskCubit(serviceLocator(),serviceLocator(),serviceLocator()));


  serviceLocator
      .registerFactory<UpdateTaskCubit>(() => UpdateTaskCubit(serviceLocator(),serviceLocator(),serviceLocator()));

  serviceLocator.registerFactory<PriorityCubit>(() => PriorityCubit());

  serviceLocator.registerFactory<ImagePickedCubit>(
      () => ImagePickedCubit(serviceLocator()));

       serviceLocator
      .registerFactory<ImageNameCubit>(() => ImageNameCubit());

  serviceLocator.registerFactory<UploadImageCubit>(
      () => UploadImageCubit(serviceLocator()));
//
  serviceLocator.registerFactory<OnboardingCubit>(() => OnboardingCubit());

  serviceLocator.registerFactory<TaskDatailsCubit>(
      () => TaskDatailsCubit(serviceLocator()));

  serviceLocator.registerFactory<ChangeStatusCubit>(() => ChangeStatusCubit());

   serviceLocator.registerFactory<ExperienceCubit>(() => ExperienceCubit());

  serviceLocator.registerFactory<SplashCubit>(() => SplashCubit());
  serviceLocator.registerFactory<LoginCubit>(
      () => LoginCubit(authRepo: serviceLocator()));

  serviceLocator.registerFactory<LogoutCubit>(
      () => LogoutCubit(serviceLocator(), serviceLocator())); //
  serviceLocator.registerFactory<RegisterCubit>(
      () => RegisterCubit(serviceLocator()));

        serviceLocator.registerFactory<ProfileCubit>(
      () => ProfileCubit(serviceLocator())); 

  serviceLocator.registerFactory<TaskCubit>(
      () => TaskCubit(hive: serviceLocator(), taskRepo: serviceLocator(),serviceLocator())); //

  serviceLocator.registerFactory<PaddingCubit>(() => PaddingCubit());

  serviceLocator.registerFactory<PasswordCubit>(() => PasswordCubit());

//Repos
  serviceLocator.registerLazySingleton(() => AuthRepo(
      authRemoteDataSource: serviceLocator(),
      sharedPreferences: serviceLocator(),serviceLocator()));

  serviceLocator.registerLazySingleton(
      () => TaskRepo(taskRemoteDataSource: serviceLocator(),serviceLocator(),serviceLocator(),serviceLocator()));

//
//DataSources

  serviceLocator.registerLazySingleton(() =>
      AuthRemoteDataSource(dioConsumer: serviceLocator(), serviceLocator()));

  serviceLocator.registerLazySingleton(
      () => TaskRemoteDataSource(dioConsumer: serviceLocator()));

  //External
serviceLocator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(serviceLocator()));

serviceLocator.registerLazySingleton(() => InternetConnectionChecker());
  serviceLocator.registerLazySingleton(() => DioConsumer(
      client: serviceLocator(),
      appIntercepters: serviceLocator(),
      logInterceptor: serviceLocator()));

  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);
  serviceLocator.registerLazySingleton(() => Hive);
  serviceLocator.registerLazySingleton(() => ImagePicker());

//
  serviceLocator.registerLazySingleton(() => Dio());

  serviceLocator.registerLazySingleton(() => LogInterceptor(
      responseBody: true,
      error: true,
      requestHeader: true,
      responseHeader: true,
      request: true,
      requestBody: true));
  serviceLocator.registerLazySingleton(() => AppIntercepters(
      client: serviceLocator(), sharedPreferences: serviceLocator()));
}
