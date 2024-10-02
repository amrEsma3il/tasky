import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/colors.dart';

class TaskDescription extends StatelessWidget {
  final String taskDesc;
  const TaskDescription({super.key, required this.taskDesc});

  @override
  Widget build(BuildContext context) {
    return Text(
      taskDesc,
      softWrap: true,
      style: TextStyle(
        height: 1.5,
        color: AppColor.gray,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
