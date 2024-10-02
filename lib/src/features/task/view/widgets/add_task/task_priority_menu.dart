import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/colors.dart';
import '../../../logic/add_task/add_task_cubit/add_task_cubit.dart';
import '../../../logic/add_task/priority_cubit/priority_cubit.dart';
import '../../../logic/add_task/priority_cubit/priority_state.dart';
class TaskPriorityMenu extends StatelessWidget {
  const TaskPriorityMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PriorityCubit, PriorityState>(
      builder: (context, state) {
        return state.isOpen
            ? Positioned(
                width: Get.width - 28,
                child: CompositedTransformFollower(
                  link: AddTaskCubit.get(context).layerLink,
                  offset: Offset(1, 62.h),
                  showWhenUnlinked: false,
                  child: Container(
                    height: 120.h, // Fixed height for the scrollable menu
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
                      ],
                    ),
                    child: Scrollbar(
                                                         trackVisibility: true,

                      thumbVisibility: true, // Always show the scrollbar
                      radius: Radius.circular(4.r), // Customize the radius
                      thickness: 13.w, // Customize the width of the scrollbar
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            PriorityCubit.priorityList.length,
                            (index) {
                              return GestureDetector(
                                onTap: () {
                                  PriorityCubit.get(context)
                                      .setPriority(PriorityCubit.priorityList[index]);
                                },
                                child: Container(
                                  width: Get.width,
                                  padding: EdgeInsets.only(
                                    bottom: 10.h,
                                    top: 10.h,
                                    left: 12.w,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: index == PriorityCubit.priorityList.length - 1
                                          ? BorderSide.none
                                          : BorderSide(
                                              width: 0.5,
                                              color: AppColor.movee,
                                            ),
                                    ),
                                  ),
                                  child: Text(
                                    "${PriorityCubit.priorityList[index]} Priority",
                                    style: TextStyle(
                                      color: AppColor.movee,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "DmSans",
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : const SizedBox();
      },
    );
  }
}
