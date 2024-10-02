import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../logic/login_cubit/login_cubit.dart';
import '../../../logic/password_cubit/password_cubit.dart';
import '../country_code_field.dart';
import 'pass_input_field.dart';

class LoginFormFields extends StatelessWidget {
  const LoginFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
   padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 0),      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 22.h),
          PhoneInputField(
            width: 326.w,
            controller: LoginCubit.get(context).phoneNoController,
            onChanged: LoginCubit.get(context).onChanged,
          ),
          SizedBox(height: 15.h),
          BlocBuilder<PasswordCubit, bool>(
            builder: (context, state) {
              return PasswordInputField(
                controller: LoginCubit.get(context).passwordController,
                isPasswordVisible: state,
                onToggleVisibility: () {
                  PasswordCubit.get(context).showPassword();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
