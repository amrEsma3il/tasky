

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/images.dart';

class LoginHeaderComponent extends StatelessWidget {
  const LoginHeaderComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          colorBlendMode: BlendMode.modulate,
          color: Colors.white,
          fit: BoxFit.cover,
          AppImages.onboardingBg,
          width: Get.width,
          height: 438.h,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(28.w, 0, 0, 0),
          child: Text(
            "Login",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
              fontFamily: "DmSans",
            ),
          ),
        ),
      ],
    );
  }
}
