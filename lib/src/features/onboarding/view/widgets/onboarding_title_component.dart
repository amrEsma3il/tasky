import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/constants/colors.dart';

class OnboardingTitleComponent extends StatelessWidget {
  const OnboardingTitleComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
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
              fontFamily: "DmSans",
            ),
          ),
          SizedBox(height: 22.h),
          Text(
            """This productive tool is designed to help\nyou better manage your task\nproject-wise conveniently!""",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColor.textColor1,
              height: 1.6,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              fontFamily: "DmSans",
            ),
          ),
        ],
      ),
    );
  }
}