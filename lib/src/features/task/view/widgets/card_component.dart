
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/constants/colors.dart';

class CardInfoComponent extends StatelessWidget {
  final Widget widget;
  final bool? withBorder;
  final Widget iconWidget;
  final GlobalKey? gestureKey;
  final void Function()? onTap;
  final Color? bg;
  const CardInfoComponent(
      {super.key, required this.widget, required this.iconWidget, this.onTap, this.gestureKey, this.bg, this.withBorder});

  @override
  Widget build(BuildContext context) {

  bool  isBordered=withBorder??false;
    return GestureDetector(
      key:gestureKey ,
      onTap: onTap,

      child: Container(
        margin: EdgeInsets.only(bottom: 10.h),
        padding: EdgeInsets.fromLTRB(isBordered? 18.w:24.w, 10.h,isBordered? 24.w:20.w, 10.h),
        width: Get.width,
        height: 55.h,
        decoration: BoxDecoration(border:isBordered? Border.all(color: AppColor.gray.withOpacity(.4),width: 1):null,
            color:bg?? AppColor.softMovee, borderRadius: BorderRadius.circular(10.r)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [widget,iconWidget],
        ),
      ),
    );
  }
}
