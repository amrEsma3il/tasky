
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../logic/login_cubit/login_cubit.dart';
import '../country_code_field.dart';

class PhoneFieldComponent extends StatelessWidget {
  const PhoneFieldComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 22.h),
        PhoneInputField(
          width: 326.w,
          controller: LoginCubit.get(context).phoneNoController,
          onChanged: LoginCubit.get(context).onChanged,
        ),
        SizedBox(height: 15.h),
      ],
    );
  }
}
