

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors.dart';

class StatusComponent extends StatelessWidget {
  final String status;
  const StatusComponent({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color? statusColor;
    switch (status) {
      case "waiting":
      case "Waiting":
        statusColor = AppColor.orange;
        break;

      case "Inprogress":
      case "inprogress":
        statusColor = AppColor.movee;
        break;

      case "Finished":
      case "finished":
        statusColor = AppColor.blueColor;

        break;
      default:
    }
    return Container(
      alignment: Alignment.center,
      
      width: 55.w,
      height: 22.h,
      decoration: BoxDecoration(color: statusColor!.withOpacity(0.12),
        borderRadius: BorderRadius.circular(5.r)),
      child: Text(
        
        status,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: statusColor, fontSize: 12.sp, fontWeight: FontWeight.w500),
      ),
    );
  }
}
