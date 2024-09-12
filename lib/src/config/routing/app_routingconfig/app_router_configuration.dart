import 'package:get/get.dart';


import '../../../features/auth/view/screens/login.dart';
import '../../../features/onboarding/view/screens/onboarding.dart';
import '../../../features/splash/view/screens/splash_screen.dart';
import '../app_routes_info/app_routes_name.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      page: () => const SplashScreen(),
      name: AppRouteName.splash,
      transition:Transition.noTransition 
    ),
 
        GetPage(
      page: () => const OnBoardingScreen(),
      name: AppRouteName.onboarding,
      transition:Transition.noTransition 
  ),
       GetPage(
      page: () => const Login(),
      name: AppRouteName.login,
      transition:Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 350) 
  ),

 
  
];
