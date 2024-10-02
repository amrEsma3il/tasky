
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../core/utilits/functions/string_functions.dart';
import '../../data/models/task_model.dart';
import '../../logic/add_task/add_task_cubit/add_task_cubit.dart';
import '../../logic/add_task/priority_cubit/priority_cubit.dart';
import '../../logic/add_task/upload_image_cubit/upload_image_cubit.dart';
import '../widgets/add_task/image_upload_widget.dart';
import '../widgets/add_task/task_button.dart';
import '../widgets/add_task/task_due_date.dart';
import '../widgets/add_task/task_header.dart';
import '../widgets/add_task/task_input_field.dart';
import '../widgets/add_task/task_priority_menu.dart';
import '../widgets/add_task/task_priority_selector.dart';

class AddTask extends StatelessWidget {
  final Task? task;
  final int? index;

  const AddTask({super.key, this.task, this.index});

  @override
  Widget build(BuildContext context) {
    if (task != null) {
      AddTaskCubit.get(context).titleController.text = task!.title;
      AddTaskCubit.get(context).discController.text = task!.desc;
      AddTaskCubit.get(context).dueDateController.text =
          DateFormat('d MMMM, y').format(task!.createdAt);
      PriorityCubit.priority = capitalize(task!.priority);
      PriorityCubit.get(context).setPriority(capitalize(task!.priority));
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: Get.width,
            padding: EdgeInsets.fromLTRB(12.w, 5.h, 12.w, 5.h),
            color: Colors.white,
            child: Stack(
              children: [
                Form(
                    key: UploadImageCubit.formstate, 
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TaskHeader(task: task),
                      const SizedBox(height: 16),
                      ImagePickerWidget(imageTaskName: task?.image),
                      const SizedBox(height: 20),
                      TaskInputFields(task: task),
                      const SizedBox(height: 16),
                      const TaskPrioritySelector(),
                      const SizedBox(height: 16),
                      const TaskDueDateField(),
                      const SizedBox(height: 25),
                      AddTaskButton(task: task, index: index),
                      const SizedBox(height: 25),
                    ],
                  ),
                ),
                const TaskPriorityMenu()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
