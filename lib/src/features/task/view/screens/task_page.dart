// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/utilits/functions/toast_message.dart';

import '../../logic/delete_cubit/delete_task_cubit.dart';
import '../../logic/delete_cubit/delete_task_state.dart';
import '../../logic/task_cubit/task_cubit.dart';
import '../widgets/task_home/floating_action_button.dart';
import '../widgets/task_home/task_bar.dart';
import '../widgets/task_home/task_filter_chips.dart';
import '../widgets/task_home/task_listview.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const TaskPageAppBar(),
      body: BlocListener<DeleteTaskCubit, DeleteTaskState>(
        listener: (context, state) {
          if (state is DeleteTaskSuccess) {
            showToast(state.message, AppColor.movee);
            TaskCubit.get(context).onRefresh();
          } else if (state is DeleteTaskFailure) {
            showToast(state.error, AppColor.movee);
          }
        },
        child: Container(
          width: Get.width,
          height: Get.height,
          color: Colors.white,
          child: Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "My Tasks",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColor.gray,
                            fontFamily: "DMSans"),
                      ),
                    ),
                  ),
                  const TaskFilterChips(),
                  SizedBox(height: 20.h),
                  const TaskList(),
                ],
              ),
              const TaskFloatingActionButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
