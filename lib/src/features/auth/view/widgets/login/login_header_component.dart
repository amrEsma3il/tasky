

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/images.dart';
class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          AppImages.onboardingBg,
          width: Get.width,
          height:Get.height>842?438.h :560.h,
          colorBlendMode: BlendMode.modulate,
          color: Colors.white,
          fit: BoxFit.cover,
        ),
        Padding(
   padding: EdgeInsets.fromLTRB(25.w, 0, 20.w, 0),          child: Text(
            "Login",
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
