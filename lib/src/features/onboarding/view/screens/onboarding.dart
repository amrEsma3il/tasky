import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../widgets/onboarding_button_component.dart';
import '../widgets/onboarding_image_component.dart';
import '../widgets/onboarding_title_component.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: Get.width),
              const OnboardingImageComponent(),
              SizedBox(height: 2.h),
              const OnboardingTitleComponent(),
              SizedBox(height: 38.h),
              const OnboardingButtonComponent(),
               SizedBox(height: 35.h),
            ],
          ),
        ),
      ),
    );
  }
}


