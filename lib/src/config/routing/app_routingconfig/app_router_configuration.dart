import 'dart:convert';

import 'package:get/get.dart';


import '../../../features/auth/view/screens/login.dart';
import '../../../features/auth/view/screens/profile.dart';
import '../../../features/auth/view/screens/register.dart';
import '../../../features/task/data/models/task_model.dart';
import '../../../features/task/view/screens/add_update_task.dart';
import '../../../features/task/view/screens/task_details.dart';
import '../../../features/task/view/screens/task_page.dart';
import '../../../features/onboarding/view/screens/onboarding.dart';
import '../../../features/splash/view/screens/splash_screen.dart';
import '../app_routes_info/app_routes_name.dart';

List<GetPage<dynamic>>? routes = [//
  GetPage(
      page: () => const SplashScreen(),
      name: AppRouteName.splash,
      transition:Transition.noTransition 
    ),
      GetPage(
      page: () =>  TaskDetails(task:  Task.fromJson(jsonDecode(Get.parameters["task"]!)),),
      name: AppRouteName.taskDetails,
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


       GetPage(
      page: () => const Profile(),
      name: AppRouteName.profile,
      transition:Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 350) 
  ),

       GetPage(
      page: () => const Register(),
      name: AppRouteName.register,
      transition:Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 350) 
  ),


   GetPage(
      page: () =>  AddTask(task:Get.parameters["task"]!=null?  Task.fromJson(jsonDecode(Get.parameters["task"]!)):null,index:Get.parameters["index"]!=null?int.parse(Get.parameters["index"]!) :null,),
      name: AppRouteName.addTask,
      transition:Transition.noTransition 
  ),
     GetPage(
      page: () => const TaskPage(),
      name: AppRouteName.taskPage,
      transition:Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 400) 
  ),
  
];
