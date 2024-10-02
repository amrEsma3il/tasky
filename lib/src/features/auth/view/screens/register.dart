import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/constants/images.dart';
import '../../logic/register_cubit/register_cubit.dart';
import '../widgets/register/experience_level_menu.dart';
import '../widgets/register/register_actions.dart';
import '../widgets/register/register_form_fields.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Form(
                key: RegisterCubit.formstate,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: Get.width,
                    ),
                    Image.asset(
                      colorBlendMode: BlendMode.modulate,
                      color: Colors.white,
                      fit: BoxFit.cover,
                      AppImages.registerBg,
                      width: Get.width,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 0),
                      child: Column(
                        children: [
                          SizedBox(
                            width: Get.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Login",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      // height: 1.34,
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "DmSans"),
                                ),
                                SizedBox(
                                  height: 22.h,
                                ),
                               const RegisterFormFields()],
                            ),
                          ),
                          SizedBox(
                            height: 38.h,
                          ),
                          const RegisterActions()],
                      ),
                    ),
                  ],
                ),
              ),const ExperienceLevelMenu()],
          ),
        ),
      ),
    );
  }
}