import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../logic/login_cubit/login_cubit.dart';
import '../widgets/login/login_actions.dart';
import '../widgets/login/login_form_fields.dart';
import '../widgets/login/login_header_component.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: LoginCubit.formstate,
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                 SizedBox(
                      width: Get.width,
                    ),
                const LoginHeader(), 
                const LoginFormFields(), 
                const LoginActions(), 
              ],
            ),
          ),
        ),
      ),
    );
  }
}
