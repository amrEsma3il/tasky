import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/colors.dart';
import '../../../data/models/task_model.dart';
import '../../../logic/task_cubit/task_cubit.dart';
import '../../../logic/task_cubit/task_state.dart';
import '../task_card.dart';
class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<TaskCubit, TaskState>(
        builder: (context, state) {
          if (state is TaskInitial || state is TaskLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TodoFailure) {
            return Center(child: Text(state.error));
          } else if (state is TodoEmpty) {
            return Center(
                child: Text(
              'No Todos',
              style: TextStyle(fontSize: 14.8.sp),
            ));
          } else if (state is TaskLoaded) {
            return RefreshIndicator(
              onRefresh: TaskCubit.get(context).onRefresh,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: ListView.builder(
                  controller: TaskCubit.get(context).scrollController,
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
                      final Task todo = state.todos[index];
                      return TaskCard(
                        task: todo,
                        index: index,
                      );
                    }
                  },
                ),
              ),
            );
          }

          return Center(
              child: Text(
            'No Todos',
            style: TextStyle(fontSize: 14.8.sp),
          ));
        },
      ),
    );
  }
}
