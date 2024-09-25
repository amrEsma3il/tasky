import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final bool isLoading;
  final String? icon;
  final VoidCallback? onPressed;
  final Color? color;
  final double? borderRadius;
  final double padding;
    final double? width;  // Add optional width parameter
  final double? height; // Add optional height parameter

  const CustomButton({
    super.key,
    required this.text,
       this.width=331,  // Accept width from the user
    this.height=49, // Accept height from the user
     this.icon,
    required this.onPressed,
    this.color , // default color
    this.borderRadius ,
    this.padding = 0,  this.isLoading=false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width,height: height?.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color??AppColor.movee,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          padding: EdgeInsets.symmetric(vertical: padding, horizontal: 12.w),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [isLoading?const CircularProgressIndicator():
            Text(
              text,
              style:  TextStyle(
                color: Colors.white,
                fontSize: 19.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(width: 8), // Space between text and icon
          icon==null?const SizedBox():  Image.asset(icon!,width: 24.w,height: 24.h,),
          ],
        ),
      ),
    );
  }
}
