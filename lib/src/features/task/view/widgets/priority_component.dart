
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors.dart';

class PriorityComponent extends StatelessWidget {
  final String priority;
  const PriorityComponent({super.key, required this.priority});

  @override
  Widget build(BuildContext context) {
    Color? priorityColor;
    switch (priority) {
      case "heigh":
      case "Heigh":
        priorityColor = AppColor.orange;
        break;

      case "medium":
      case "Medium":
        priorityColor = AppColor.movee;
        break;
      case "Low":
      case "low":
        priorityColor = AppColor.blueColor;

        break;
      default:
    }
    return Row(
      children: [
        Icon(
          Icons.flag_outlined,
          color: priorityColor,
        ),
        SizedBox(
          width: 3.w,
        ),
        Text(
          priority,
          style: TextStyle(
              color: priorityColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}

