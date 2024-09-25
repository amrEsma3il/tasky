import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/utilits/functions/string_functions.dart';

class ProfileComponentInfo extends StatelessWidget {
  final String title, info;
  const ProfileComponentInfo({super.key, required this.title, required this.info});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 68.h,
      padding: EdgeInsets.fromLTRB(14.w, 6.h, 0, 8.5.h),
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
          color: AppColor.gray.withOpacity(0.12),
          borderRadius: BorderRadius.circular(10.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: AppColor.gray.withOpacity(0.9)),
          ),
          Text(
            capitalize(info.trim()),
            style: TextStyle(
              height: 1.8,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: AppColor.gray.withOpacity(0.85)),
          )
        ],
      ),
    );
  }
}
