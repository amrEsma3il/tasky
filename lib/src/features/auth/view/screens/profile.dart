import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/images.dart';
import '../../../../core/utilits/functions/string_functions.dart';
import '../../logic/profile_cubit/profile_cubit.dart';
import '../../logic/profile_cubit/profile_state.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: Get.width,
          padding: EdgeInsets.fromLTRB(12.w, 5.h, 12.w, 5.h),
          color: Colors.white,
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is ProfileInitial || state is ProfileLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ProfileFailure) {
                return Center(child: Text(state.error));
              } else if (state is ProfileSuccess) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: Transform.rotate(
                              angle: math.pi,
                              child: Image.asset(
                                AppImages.arrowLeft,
                                color: Colors.black,
                                width: 24.w,
                                height: 24.h,
                              )), // Change icon color based on theme
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        SizedBox(
                          width: 1.5.w,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700), // Text color
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),

                    ProfileComponentInfo(
                      title: "NAME",
                      info: state.userProfile.displayName,
                    ),
                    ProfileComponentInfo(
                      title: "Phone",
                      info: state.userProfile.username,
                    ),
                    ProfileComponentInfo(
                      title: "Level",
                      info: state.userProfile.level,
                    ),
                    ProfileComponentInfo(
                      title: "Years of experience",
                      info: state.userProfile.experienceYears.toString(),
                    ),
                    ProfileComponentInfo(
                      title: "Location",
                      info: state.userProfile.address,
                    ),

                    // component
                  ],
                );
              }

              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}

class ProfileComponentInfo extends StatelessWidget {
  final String title, info;
  const ProfileComponentInfo(
      {super.key, required this.title, required this.info});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 68.h,
      padding: EdgeInsets.fromLTRB(14.w, 6.h, 0, 8.5.h),
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
          color: AppColor.gray.withOpacity(0.12),
          borderRadius: BorderRadius.circular(10.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: AppColor.gray.withOpacity(0.9)),
          ),
          Text(
            capitalize(info.trim()),
            style: TextStyle(
              height: 1.8,
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: AppColor.gray.withOpacity(0.85)),
          )
        ],
      ),
    );
  }
}