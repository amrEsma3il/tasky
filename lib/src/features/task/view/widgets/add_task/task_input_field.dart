import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../data/models/task_model.dart';
import '../../../logic/add_task/add_task_cubit/add_task_cubit.dart';
import 'input_field_with_label.dart';

class TaskInputFields extends StatelessWidget {
  final Task? task;

  const TaskInputFields({super.key, this.task});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputFieldWithLabel(
          validator: (val) => val == null || val.isEmpty ? "title required" : null,
          controller: AddTaskCubit.get(context).titleController,
          label: "Task title",
          hint: "Enter title here...",
          width: Get.width,
          paddingBottom: 8.h,
          paddingLeft: 14.w,
        ),
        SizedBox(height: 16.h),
        InputFieldWithLabel(
          validator: (val) => val == null || val.isEmpty ? "desc required" : null,
          controller: AddTaskCubit.get(context).discController,
          label: "Task Description",
          hint: "Enter description here...",
          width: Get.width,
          paddingBottom: 8.h,
          paddingLeft: 14.w,
          maxLines: 8,
          height: 170.h,
        ),
      ],
    );
  }
}
