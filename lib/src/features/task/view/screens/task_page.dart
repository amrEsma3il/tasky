// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import '../../../../core/constants/colors.dart';
import '../../data/models/task_model.dart';
import '../../data/repo/task_repo.dart';
import '../../logic/change_status_cubit/change_status_cubit.dart';
import '../../logic/task_cubit/task_cubit.dart';
import '../../logic/task_cubit/task_state.dart';
import '../widgets/task_card.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Logo",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24.sp,
                fontFamily: "DMSans")),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.person_outline)),
          IconButton(
            icon: Icon(
              Icons.logout,
              color: AppColor.movee,
            ),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        color: Colors.white,
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        textAlign: TextAlign.left,
                        "My Tasks",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColor.gray,
                            fontFamily: "DMSans"),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 13.w),
                  child: Row(
                    children: List.generate(
                      TaskRepo.statusList(context).length,
                      (index) {
                        List<Map<String, dynamic>> statusList =
                            TaskRepo.statusList(context);
                        return BlocBuilder<ChangeStatusCubit, int>(
                          builder: (context, state) {
                            return Container(margin: EdgeInsets.only(right:index== TaskRepo.statusList(context).length-1?0: 6.w),
                              child: FilterChip(
                                  side: const BorderSide(width: 0),
                                  label: Text(
                                    statusList[index]['status_name'],
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: state == index
                                            ? FontWeight.w700
                                            : FontWeight.w400,
                                        color: state == index
                                            ? Colors.white
                                            : AppColor.gray),
                                  ),
                                  onSelected: (isSelected) {
                                 
                                  ChangeStatusCubit.get(context).changeStatus(index);
                                  TaskCubit.get(context).filterTasksByStatus((statusList[index]['status_name'] as String).toLowerCase());
                                  },
                                  backgroundColor: state == index
                                      ? AppColor.movee
                                      : AppColor.softMovee),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Expanded(
                  child: BlocBuilder<TaskCubit, TaskState>(
                    builder: (context, state) {
                      if (state is TaskInitial || state is TaskLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is TodoFailure) {
                        return Center(child: Text(state.error));
                      } else if (state is TodoEmpty) {
                        return const Center(child: Text('No Todos'));
                      } else if (state is TaskLoaded) {
                        return RefreshIndicator(
                          onRefresh: TaskCubit.get(context).onRefresh,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: ListView.builder(
                              controller:
                                  TaskCubit.get(context).scrollController,
                              itemCount: state.hasReachedMax
                                  ? state.todos.length
                                  : state.todos.length + 1,
                              itemBuilder: (context, index) {
                                if (index >= state.todos.length) {
                                  if (state.pageLength < 20) {
                                    return Center(
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 4.h),
                                        child: Text(
                                          "Has No More Tasks",
                                          style: TextStyle(
                                              fontSize: 14.8.sp,
                                              color: AppColor.gray,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Center(
                                        child: CircularProgressIndicator(
                                      color: AppColor.movee,
                                    ));
                                  }
                                } else {
                                  final Task? todo = state.todos[index];
                                  return TaskCard(
                                    task: todo!,
                                  );
                                }
                              },
                            ),
                          ),
                        );
                      }

                      return const Center(child: Text('No Todos'));
                    },
                  ),
                ),
              ],
            ),

            Positioned(
              bottom: 100, // Adjust the spacing from the bottom as required
              right: 30, // Adjust the spacing from the right as required
              child: FloatingActionButton(
                shape: const CircleBorder(),
                heroTag: "qrcode",
                onPressed: () {
                  // Handle QR Code button press
                  print('QR Code FAB Pressed');
                }, // QR Code icon
                backgroundColor: AppColor.softMovee,
                child: Icon(
                  Icons.qr_code,
                  color: AppColor.movee,
                ), // Adjust color if needed
              ),
            ),
            // The Add FAB (main button)
            Positioned(
              bottom: 30, // Positioning at the bottom
              right: 30, // Positioning on the right side
              child: FloatingActionButton(
                  shape: const CircleBorder(),
                  heroTag: "addnote",
                  onPressed: () {
                    // Handle Add button press
                    print('Add Task FAB Pressed');
                  },
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ), // The plus icon
                  backgroundColor: AppColor.movee // Adjust color if needed
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
