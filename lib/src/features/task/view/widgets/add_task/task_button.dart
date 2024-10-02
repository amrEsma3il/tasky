import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utilits/widgets/cutom_button.dart';
import '../../../data/models/task_model.dart';
import '../../../logic/add_task/add_task_cubit/add_task_cubit.dart';
import '../../../logic/add_task/image_cubit.dart';
import '../../../logic/add_task/priority_cubit/priority_cubit.dart';
import '../../../logic/add_task/upload_image_cubit/upload_image_cubit.dart';
import '../../../logic/task_cubit/task_cubit.dart';
import '../../../logic/update_cubit/edit_task_cubit.dart';

class AddTaskButton extends StatelessWidget {
  final Task? task;
  final int? index;

  const AddTaskButton({super.key, this.task, this.index});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      width: Get.width,
      onPressed: () async {
        final addTaskCubit = AddTaskCubit.get(context);

        if (task == null) {
          await UploadImageCubit.get(context).uploadImageAndCreateTask(
            context,
            ImagePickedCubit.imageFile,
            title: addTaskCubit.titleController.text,
            dueDate: addTaskCubit.dueDateController.text,
            priority: PriorityCubit.priority,
            desc: addTaskCubit.discController.text,
          );
        } else {
          UpdateTaskCubit.get(context).updateTask(
            context,
            task: Task(
              id: task!.id,
              title: addTaskCubit.titleController.text,
              desc: addTaskCubit.discController.text,
              image: task!.image,
              priority: PriorityCubit.priority,
              status: task!.status,
              user: task!.user,
              createdAt: task!.createdAt,
              updatedAt: task!.updatedAt,
            ),
            index: index!,
          );
        }
        if (!context.mounted) return;
        TaskCubit.get(context).onRefresh();
      },
      text: "Add task",
    );
  }
}
