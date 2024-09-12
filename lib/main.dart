import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'service_locator.dart' as di;
import 'src/config/routing/app_routingconfig/app_router_configuration.dart';
import 'src/features/onboarding/logic/onboarding_cubit/onboarding_cubit.dart';
import 'src/features/splash/logic/splash_cubit/splash_cubit.dart';


void main()async {
   WidgetsFlutterBinding.ensureInitialized();
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
          providers:  [

BlocProvider(create: (context)=>SplashCubit()),
BlocProvider(create: (context)=>OnboardingCubit())


          ],
          child: GetMaterialApp(
            locale: const Locale('en'),
            debugShowCheckedModeBanner: false,
            getPages: routes,
          ),
        );
      },
    );
  }
}