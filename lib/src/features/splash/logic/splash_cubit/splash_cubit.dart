import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../service_locator.dart' as di;

import '../../../../config/routing/app_routes_info/app_routes_name.dart';
class SplashCubit extends Cubit<int> {
  SplashCubit() : super(5);
// static SplashCubit get(BuildContext context)=> BlocProvider.of<SplashCubit>(context);

late Timer time;

 splashTimerEvent(){
time=Timer(Duration(seconds: state), (){
 bool? secondTime= di.serviceLocator<SharedPreferences>().getBool("auth");
  if (secondTime==true
) {
    Get.offAllNamed(AppRouteName.login);
  } else {
    Get.offAllNamed(AppRouteName.onboarding);
  }


});


 }
   
}