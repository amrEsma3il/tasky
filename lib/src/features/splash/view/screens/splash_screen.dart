import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/images.dart';
import '../../logic/splash_cubit/splash_cubit.dart';
import '../../../../../service_locator.dart' as di ;

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    di.serviceLocator<SplashCubit>().splashTimerEvent();

    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColor.movee,
        ),
        child: Image.asset(AppImages.splash,width: 124.w,height: 45.h,),
      ),
    );
  }
}
