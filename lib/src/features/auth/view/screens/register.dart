import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../config/routing/app_routes_info/app_routes_name.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/images.dart';
import '../../../../core/utilits/widgets/custom_text_field.dart';
import '../../../../core/utilits/widgets/cutom_button.dart';
import '../../../task/view/widgets/card_component.dart';
import '../../data/models/user_model.dart';
import '../../logic/experience_level_cubit/experience_level_cubit.dart';
import '../../logic/experience_level_cubit/experience_level_state.dart';
import '../../logic/password_cubit/password_cubit.dart';
import '../../logic/register_cubit/register_cubit.dart';
import '../widgets/country_code_field.dart';
import '../widgets/text_with_link_component.dart';

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
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),

                                // add here experience level
                                BlocBuilder<ExperienceCubit, ExperienceState>(
                                  builder: (context, state) {
                                    return CompositedTransformTarget(
                                      link:
                                          RegisterCubit.get(context).layerLink,
                                      child: CardInfoComponent(
                                        withBorder: true,
                                        bg: Colors.transparent,
                                        gestureKey: ExperienceCubit.get(context)
                                            .cardKey,
                                        widget: Text(
                                          "${state.experienceLevel} Level",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w700,
                                              fontFamily:
                                                  "DmSans"), // Text color
                                        ),
                                        onTap: () {
                                          ExperienceCubit.get(context)
                                              .toggleOpen();
                                        },
                                        iconWidget: Icon(
                                          state.isOpen
                                              ? Icons.expand_less
                                              : Icons.expand_more,
                                          color: Colors.black54,
                                          size: 36,
                                        ),
                                      ),
                                    );
                                  },
                                ),

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
                                          icon: Icon(
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
                            ),
                          ),
                          SizedBox(
                            height: 38.h,
                          ),
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
                                      experienceYears: int.parse(registerCubit
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              BlocBuilder<ExperienceCubit, ExperienceState>(
                builder: (context, state) {
                  return state.isOpen
                      ? Positioned(
                          width: Get.width - 48.w,
                          child: CompositedTransformFollower(
                            link: RegisterCubit.get(context).layerLink,
                            offset: Offset(1, 62.h),
                            showWhenUnlinked: false,
                            child: Container(
                              // width: Get.width,
                              height: 160.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.r),
                                  color: AppColor.softMovee,
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColor.gray.withOpacity(0.4),
                                      blurRadius: 8,
                                      offset: const Offset(2, 4),
                                    ),
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      blurRadius: 8,
                                      offset: const Offset(2, 4),
                                    ),
                                    BoxShadow(
                                      color: AppColor.gray.withOpacity(0.4),
                                      blurRadius: 8,
                                      offset: const Offset(2, 4),
                                    ),
                                    BoxShadow(
                                      color: AppColor.gray.withOpacity(0.4),
                                      blurRadius: 8,
                                      offset: const Offset(2, 4),
                                    ),
                                  ]),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: List.generate(
                                  ExperienceCubit.experienceLevels.length,
                                  (index) {
                                    return GestureDetector(
                                      onTap: () {
                                        ExperienceCubit.get(context)
                                            .setExperienceLevel(ExperienceCubit
                                                .experienceLevels[index]);
                                      },
                                      child: Container(
                                        width: Get.width,
                                        padding: EdgeInsets.only(
                                            bottom: 10.h,
                                            top: 10.h,
                                            left: 12.w),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                // top: BorderSide(
                                                //     width: 1,
                                                //     color: AppColor.movee),
                                                bottom: index == 3
                                                    ? BorderSide.none
                                                    : BorderSide(
                                                        width: 0.5,
                                                        color:
                                                            AppColor.movee))),
                                        child: Text(
                                          "${ExperienceCubit.experienceLevels[index]} Level",
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                              fontFamily:
                                                  "DmSans"), // Text color
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ))
                      : const SizedBox();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}