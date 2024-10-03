import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../../core/constants/colors.dart';
import '../../../data/models/task_model.dart';
import '../card_component.dart';
import 'task_qr_code.dart';

class TaskInfo extends StatelessWidget {
  final Task task;
  const TaskInfo({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: CardInfoComponent(
            widget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'End Date',
                  style: TextStyle(
                    color: AppColor.gray,
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  DateFormat('d MMMM, y').format(task.updatedAt),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            onTap: () {},
            iconWidget: Icon(
              size: 18.w,
              Icons.calendar_month_rounded,
              color: AppColor.movee,
            ),
          ),
        ),
        Flexible(
          child: CardInfoComponent(
            widget: Text(
              task.status,
              style: TextStyle(
                color: AppColor.movee,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            onTap: () {},
            iconWidget: Icon(
              Icons.arrow_drop_down,
              color: AppColor.movee,
              size: 36,
            ),
          ),
        ),
        Flexible(
          child: CardInfoComponent(
            widget: Row(
              children: [
                Icon(
                  Icons.flag_outlined,
                  color: AppColor.movee,
                  size: 30,
                ),
                SizedBox(width: 10.w),
                Text(
                  "${task.priority} Priority",
                  style: TextStyle(
                    color: AppColor.movee,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            onTap: () {},
            iconWidget: Icon(
              Icons.arrow_drop_down,
              color: AppColor.movee,
              size: 36,
            ),
          ),
        ),
        SizedBox(height: 12.h),
        TaskQrCode(taskId: task.id),
      ],
    );
  }
}
