import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/colors.dart';
import '../../../logic/experience_level_cubit/experience_level_cubit.dart';
import '../../../logic/experience_level_cubit/experience_level_state.dart';
import '../../../logic/register_cubit/register_cubit.dart';

class ExperienceLevelMenu extends StatelessWidget {
  const ExperienceLevelMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return 
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
              ;
  }
}