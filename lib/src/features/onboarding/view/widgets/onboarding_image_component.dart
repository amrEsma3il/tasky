import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/constants/images.dart';


class OnboardingImageComponent extends StatelessWidget {
  const OnboardingImageComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.onboardingBg,
      fit: BoxFit.cover,
      width: Get.width,
       height:Get.height>842?438.h :560.h,
    );
  }
}
