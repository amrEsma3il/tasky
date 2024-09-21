
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/constants/colors.dart';

class CardInfoComponent extends StatelessWidget {
  final Widget widget;
  final Widget iconWidget;
  final GlobalKey? gestureKey;
  final void Function()? onTap;
  const CardInfoComponent(
      {super.key, required this.widget, required this.iconWidget, this.onTap, this.gestureKey});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key:gestureKey ,
      onTap: onTap,

      child: Container(
        margin: EdgeInsets.only(bottom: 10.h),
        padding: EdgeInsets.fromLTRB(24.w, 10.h, 20.w, 10.h),
        width: Get.width,
        height: 55.h,
        decoration: BoxDecoration(
            color: AppColor.softMovee, borderRadius: BorderRadius.circular(10.r)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [widget,iconWidget],
        ),
      ),
    );
  }
}
