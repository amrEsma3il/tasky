import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../config/routing/app_routes_info/app_routes_name.dart';
import '../../../../../core/utilits/widgets/cutom_button.dart';
import '../../../data/models/user_model.dart';
import '../../../logic/experience_level_cubit/experience_level_cubit.dart';
import '../../../logic/register_cubit/register_cubit.dart';
import '../text_with_link_component.dart';

class RegisterActions extends StatelessWidget {
  const RegisterActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      
                          CustomButton(
                            width: Get.width,
                            onPressed: () async {
                              final registerCubit = RegisterCubit.get(context);
                              await RegisterCubit.get(context).registerUser(
                                  user: UserModel(
                                      address:
                                          registerCubit.addressController.text,
                                      displayName:
                                          registerCubit.nameController.text,
                                      phone: registerCubit.phoneNoController
                                              .value.countryCode
                                              .split("")
                                              .last
                                              .toString() +
                                          registerCubit
                                              .phoneNoController.value.nsn,
                                      password:
                                          registerCubit.passwordController.text,
                                      experienceYears:registerCubit
                                          .yearsExceprinceController.text.isEmpty?1: int.parse(registerCubit
                                          .yearsExceprinceController.text),
                                      level: ExperienceCubit.experienceLevel));
                            },
                            text: "Sign Up",
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          TextWithLink(
                            txt: "Already have any account? ",
                            link: 'Sign in',
                            onTap: () {
                              Get.offNamed(AppRouteName.login);
                            },
                          ),
                          SizedBox(
                            height: 13.h,
                          ),
                        
    ],);
  }
}