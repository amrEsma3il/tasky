import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../data/models/task_model.dart';
import '../widgets/task_details/task_description.dart';
import '../widgets/task_details/task_details_header.dart';
import '../widgets/task_details/task_image.dart';
import '../widgets/task_details/task_info.dart';
import '../widgets/task_details/task_title.dart';

class TaskDetails extends StatelessWidget {
  final Task task;
  const TaskDetails({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: Get.width,
            padding: EdgeInsets.fromLTRB(12.w, 5.h, 12.w, 5.h),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TaskDetailsHeader(),
                SizedBox(height: 3.5.h),
                TaskImage(taskImageUrl: task.image),
                SizedBox(height: 14.h),
                TaskTitle(taskTitle: task.title),
                SizedBox(height: 5.h),
                TaskDescription(taskDesc: task.desc),
                SizedBox(height: 14.h),
                TaskInfo(task: task),
                SizedBox(height: 16.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
