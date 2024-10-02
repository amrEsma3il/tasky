import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math'as math;
import '../../../../../core/constants/images.dart';
import '../../../data/models/task_model.dart';
import '../../../logic/add_task/add_task_cubit/add_task_cubit.dart';

class TaskHeader extends StatelessWidget {
  final Task? task;

  const TaskHeader({super.key, this.task});

  @override
  Widget build(BuildContext context) {
    return Row(
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
            ),
          ),
          onPressed: () {
            AddTaskCubit.get(context).clearTextInTextField(context);
            Navigator.pop(context);
          },
        ),
        SizedBox(width: 1.5.w),
        Text(
          task == null ? 'Add new task' : 'Edit task',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
