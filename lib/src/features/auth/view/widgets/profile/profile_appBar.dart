import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;
import '../../../../../core/constants/images.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          icon: Transform.rotate(
              angle: math.pi,
              child: Image.asset(
                AppImages.arrowLeft,
                color: Colors.black,
                width: 24.w,
                height: 24.h,
              )),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        SizedBox(width: 1.5.w),
        Text(
          'Profile',
          style: TextStyle(
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
