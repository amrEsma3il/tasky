


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/utilits/widgets/custom_text_field.dart';
import '../../../logic/login_cubit/login_cubit.dart';
import '../../../logic/password_cubit/password_cubit.dart';

class PasswordFieldComponent extends StatelessWidget {
  const PasswordFieldComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasswordCubit, bool>(
      builder: (context, state) {
        return CustomTextField(
          controller: LoginCubit.get(context).passwordController,
          obscureText: !state,
          hintText: "Password...",
          height: 50.h,
          width: 326.w,
          validator: (val) {
            if (val == null || val.isEmpty) {
              return "must enter password";
            }
            return null;
          },
          suffiWidget: Padding(
            padding: EdgeInsets.only(top: 3.h),
            child: IconButton(
              onPressed: () {
                PasswordCubit.get(context).showPassword();
              },
              icon: Icon(
                state ? Icons.visibility : Icons.visibility_off,
                color: AppColor.gray,
              ),
            ),
          ),
        );
      },
    );
  }
}
