import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/utilits/widgets/cutom_button.dart';
import '../../../data/models/user_model.dart';
import '../../../logic/experience_level_cubit/experience_level_cubit.dart';
import '../../../logic/register_cubit/register_cubit.dart';


class SubmitButtonComponent extends StatelessWidget {
  const SubmitButtonComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return   CustomButton(
                            width: Get.width,
                            onPressed: () async {
                              final registerCubit = RegisterCubit.get(context);
                              await RegisterCubit.get(context).registerUser(
                                  user: 
                                  UserModel(
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
                                          //
                                      experienceYears:registerCubit
                                          .yearsExceprinceController.text.isEmpty?2: int.parse(registerCubit
                                          .yearsExceprinceController.text),
                                      level: ExperienceCubit.experienceLevel));
                            },
                            text: "Sign Up",
                          );
  }
}
