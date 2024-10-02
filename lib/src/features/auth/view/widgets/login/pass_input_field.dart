import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/utilits/widgets/custom_text_field.dart';

class PasswordInputField extends StatelessWidget {
  final TextEditingController controller;
  final bool isPasswordVisible;
  final VoidCallback onToggleVisibility;

  const PasswordInputField({
    required this.controller,
    required this.isPasswordVisible,
    required this.onToggleVisibility,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller,
      height: 50.h,
      width: 326.w,
      obscureText: !isPasswordVisible,
      hintText: "Password...",
      validator: (val) {
        if (val == null || val.isEmpty) {
          return "Must enter password";
        }
        return null;
      },
      suffiWidget: Padding(
        padding: EdgeInsets.only(top: 3.h),
        child: IconButton(
          onPressed: onToggleVisibility,
          icon: Icon(
            isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            size: 18.w,
            color: AppColor.gray,
          ),
        ),
      ),
    );
  }
}
