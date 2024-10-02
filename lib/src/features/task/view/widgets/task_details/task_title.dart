import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskTitle extends StatelessWidget {
  final String taskTitle;
  const TaskTitle({super.key, required this.taskTitle});

  @override
  Widget build(BuildContext context) {
    return Text(
      taskTitle,
      style: TextStyle(
        color: Colors.black,
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
