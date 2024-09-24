import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
// import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'service_locator.dart' as di;
import 'src/config/routing/app_routingconfig/app_router_configuration.dart';
import 'src/features/auth/logic/experience_level_cubit/experience_level_cubit.dart';
import 'src/features/auth/logic/login_cubit/login_cubit.dart';
import 'src/features/auth/logic/padding_cubit/pading_cubit.dart';
import 'src/features/auth/logic/password_cubit/password_cubit.dart';
import 'src/features/auth/logic/logout_cubit/log_out_cubit.dart';
import 'src/features/auth/logic/profile_cubit/profile_cubit.dart';
import 'src/features/auth/logic/register_cubit/register_cubit.dart';
import 'src/features/onboarding/logic/onboarding_cubit/onboarding_cubit.dart';
import 'src/features/splash/logic/splash_cubit/splash_cubit.dart';
import 'src/features/task/data/models/task_model.dart';
import 'src/features/task/logic/add_task/add_task_cubit/add_task_cubit.dart';
import 'src/features/task/logic/add_task/image_cubit.dart';
import 'src/features/task/logic/add_task/image_task_cubit.dart';
import 'src/features/task/logic/add_task/priority_cubit/priority_cubit.dart';
import 'src/features/task/logic/add_task/upload_image_cubit/upload_image_cubit.dart';
import 'src/features/task/logic/change_status_cubit/change_status_cubit.dart';
import 'src/features/task/logic/delete_cubit/delete_task_cubit.dart';
import 'src/features/task/logic/task_cubit/task_cubit.dart';
import 'src/features/task/logic/task_datails_cubit/task_datails_cubit.dart';
import 'src/features/task/logic/update_cubit/edit_task_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter()); // Register the Todo adapter
  await Hive.openBox('todos');
  await di.init();
  runApp(const Tasky());
}

class Tasky extends StatelessWidget {
  const Tasky({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(375, 752),
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => di.serviceLocator<SplashCubit>()),
            BlocProvider(
                create: (context) => di.serviceLocator<OnboardingCubit>()),
            BlocProvider(
                create: (context) => di.serviceLocator<TaskDatailsCubit>()),
            BlocProvider(
              create: (context) => di.serviceLocator<LoginCubit>(),
            ),
            BlocProvider(
                create: (context) => di.serviceLocator<PaddingCubit>()),
            BlocProvider(
              create: (context) => di.serviceLocator<PasswordCubit>(),
            ),
            BlocProvider(
              create: (context) => di.serviceLocator<TaskCubit>(),
            ),
            BlocProvider(
              create: (context) => ChangeStatusCubit(),
            ),
            BlocProvider(
              create: (context) => di.serviceLocator<ImagePickedCubit>(),
            ),
            BlocProvider(
              create: (context) => di.serviceLocator<AddTaskCubit>(),
            ) //PriorityCubit
            ,
            BlocProvider(
              create: (context) => di.serviceLocator<PriorityCubit>(),
            ) //

            ,
            BlocProvider(
              create: (context) => di.serviceLocator<UploadImageCubit>(),
            ) //
            ,
            BlocProvider(
              create: (context) => di.serviceLocator<LogoutCubit>(),
            ),
             BlocProvider(
              create: (context) => di.serviceLocator<UpdateTaskCubit>(),
            ),
             BlocProvider(
              create: (context) => di.serviceLocator<DeleteTaskCubit>(),
            ),
             BlocProvider(
              create: (context) => di.serviceLocator<ImageNameCubit>(),
            ),
              BlocProvider(
              create: (context) => di.serviceLocator<ProfileCubit>(),
              
            ),
              BlocProvider(
              create: (context) => di.serviceLocator<ExperienceCubit>(),
              
            ),
              BlocProvider(
              create: (context) => di.serviceLocator<RegisterCubit>(),
              
            )
          ],
          child: GetMaterialApp(
            locale: const Locale('en'),
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              // Apply the Roboto font to all text in the app.
              fontFamily: 'DmSans',
            ),
            getPages: routes,
          ),
        );
      },
    );
  }
}
