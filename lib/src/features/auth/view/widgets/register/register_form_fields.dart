import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/utilits/widgets/custom_text_field.dart';
import '../../../logic/password_cubit/password_cubit.dart';
import '../../../logic/register_cubit/register_cubit.dart';
import '../country_code_field.dart';
import 'experience_level_component.dart';

class RegisterFormFields extends StatelessWidget {
  const RegisterFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [ 
        CustomTextField(
                                  onChanged: (p0) {},
                                  controller:
                                      RegisterCubit.get(context).nameController,
                                  height: 50.h,
                                  width: Get.width,
                                  hintText: "Name...",
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return "must enter name";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                PhoneInputField(width: Get.width,
                                  controller: RegisterCubit.get(context)
                                      .phoneNoController,
                                  onChanged:
                                      RegisterCubit.get(context).onChanged,
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                CustomTextField(
                                  onChanged: (p0) {},
                                  controller: RegisterCubit.get(context)
                                      .yearsExceprinceController,
                                  height: 50.h,
                                  width: Get.width,
                                  hintText: "Years of experience...",
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return "must enter years";
                                    }else if(val is double){
 return "must be normal number 0-9";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),


                               const Flexible(child: ExperienceLevelComponent()),

                                //
                                SizedBox(
                                  height: 15.h,
                                ),
                                CustomTextField(
                                  onChanged: (p0) {},
                                  controller: RegisterCubit.get(context)
                                      .addressController,
                                  height: 50.h,
                                  width: Get.width,
                                  hintText: "Address...",
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return "must enter address";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                BlocBuilder<PasswordCubit, bool>(
                                  builder: (context, state) {
                                    return CustomTextField(
                                      onChanged: (p0) {},
                                      controller: RegisterCubit.get(context)
                                          .passwordController,
                                      height: 50.h,
                                      width: Get.width,
                                      obscureText: !state,
                                      hintText: "Password...",
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
                                            PasswordCubit.get(context)
                                                .showPassword();
                                          },
                                          icon: Icon(size: 18.w,
                                            state
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            color: AppColor.gray,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                )
                              ],
    );
  }
}
