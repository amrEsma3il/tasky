import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/colors.dart';
import '../../../data/repo/task_repo.dart';
import '../../../logic/change_status_cubit/change_status_cubit.dart';
import '../../../logic/task_cubit/task_cubit.dart';
class TaskFilterChips extends StatelessWidget {
  const TaskFilterChips({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 13.w),
      child: Row(
        children: List.generate(
          TaskRepo.statusList(context).length,
          (index) {
            List<Map<String, dynamic>> statusList =
                TaskRepo.statusList(context);
            return BlocBuilder<ChangeStatusCubit, int>(
              builder: (context, state) {
                return Container(
                  margin: EdgeInsets.only(
                      right: index == TaskRepo.statusList(context).length - 1
                          ? 0
                          : 7.w),
                  child: FilterChip(
                    padding: EdgeInsets.symmetric(
                        horizontal: Get.width > 420 ? 8.2.w : 5.01.w),
                    side: const BorderSide(width: 0),
                    label: Text(
                      statusList[index]['status_name'],
                      style: TextStyle(
                          fontSize: Get.width > 420 ? 17.sp : 16.sp,
                          fontWeight: state == index
                              ? FontWeight.w700
                              : FontWeight.w400,
                          color: state == index
                              ? Colors.white
                              : AppColor.gray),
                    ),
                    onSelected: (isSelected) {
                      ChangeStatusCubit.get(context).changeStatus(index);
                      TaskCubit.get(context).filterTasksByStatus(
                          (statusList[index]['status_name'] as String)
                              .toLowerCase(),
                          true);
                    },
                    backgroundColor: state == index
                        ? AppColor.movee
                        : AppColor.softMovee,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
