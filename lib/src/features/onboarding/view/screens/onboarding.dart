import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../service_locator.dart' as di;
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/images.dart';
import '../../../../core/utilits/widgets/cutom_button.dart';
import '../../logic/onboarding_cubit/onboarding_cubit.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: Get.width,
            ),
            Image.asset(fit: BoxFit.cover,
              AppImages.onboardingBg,
              width: Get.width,
              height: 438.h,
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(width: Get.width,
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    """Task Management &\nTo-Do List""",
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      height: 1.34,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: "DmSans"),
                  ),
                  SizedBox(
                    height: 22.h,
                  ),
                  Text(
                    """This productive tool is designed to help\nyou better manage your task\nproject-wise conveniently!""",textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColor.textColor1,
                      height: 1.6,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: "DmSans"),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 38.h,
            ),
            CustomButton(
              onPressed: () {
                di.serviceLocator<OnboardingCubit>().navigateEvent();
              },
              text: "Let’s Start",
              icon: AppImages.arrowLeft,
            )
          ],
        ),
      ),
    );
  }
}
