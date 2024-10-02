import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/colors.dart';
import '../../../logic/add_task/add_task_cubit/add_task_cubit.dart';
import 'input_field_with_label.dart';

class TaskDueDateField extends StatelessWidget {
  const TaskDueDateField({super.key});

  @override
  Widget build(BuildContext context) {
    return  InputFieldWithLabel(
                           validator: (val) {
                            if (val==null || val.isEmpty) {
                              return "date required";
                            } else {
                              return null;
                            }
                          },
                          controller:
                              AddTaskCubit.get(context).dueDateController,
                          label: "Due date",
                          hint: """choose due date...""",
                          width: Get.width,
                          paddingBottom: 8.h,
                          paddingLeft: 14.w,
                          suffix: IconButton(
                              onPressed: () {
                                AddTaskCubit.get(context).selectDate(context);
                              },
                              icon: Padding(
                                padding: EdgeInsets.only(top: 5.h),
                                child: Icon(
                                  Icons.calendar_month_sharp,
                                  color: AppColor.movee,
                                  size: 24,
                                ),
                              )),
                        );
  }
}