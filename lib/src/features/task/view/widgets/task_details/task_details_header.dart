import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math'as math;
import '../../../../../core/constants/images.dart';

class TaskDetailsHeader extends StatelessWidget {
  const TaskDetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              icon: Transform.rotate(
                angle: math.pi,
                child: Image.asset(
                  AppImages.arrowLeft,
                  color: Colors.black,
                  width: 24.w,
                  height: 24.h,
                ),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            SizedBox(width: 1.5.w),
            Text(
              'Task Details',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        IconButton(
          icon: Icon(Icons.more_vert, size: 17.w, color: Colors.black),
          onPressed: () {
            // Handle menu action
          },
        ),
      ],
    );
  }
}
