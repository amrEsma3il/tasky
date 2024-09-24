import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;

import '../../../../config/theme/text_styles/styles.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/images.dart';
import '../../../../core/utilits/functions/string_functions.dart';
import '../../../../core/utilits/widgets/cutom_button.dart';
import '../../data/models/task_model.dart';
import '../../logic/add_task/add_task_cubit/add_task_cubit.dart';
import '../../logic/add_task/image_cubit.dart';
import '../../logic/add_task/priority_cubit/priority_cubit.dart';
import '../../logic/add_task/priority_cubit/priority_state.dart';
import '../../logic/add_task/upload_image_cubit/upload_image_cubit.dart';
import '../../logic/task_cubit/task_cubit.dart';
import '../../logic/update_cubit/edit_task_cubit.dart';
import '../widgets/add_task/image_upload_widget.dart';
import '../widgets/add_task/input_field_with_label.dart';
import '../widgets/card_component.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key,  this.task, this.index});
final Task? task;
final int? index ;
  @override
  Widget build(BuildContext context) {
    //
if (task != null) {
  AddTaskCubit.get(context).titleController.text=task!.title;
   AddTaskCubit.get(context).discController.text=task!.desc;
    AddTaskCubit.get(context).dueDateController.text=DateFormat('d MMMM, y').format(task!.createdAt);
PriorityCubit.priority=capitalize(task!.priority);

PriorityCubit.get(context).setPriority(capitalize(task!.priority));
}

    //
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
              width: Get.width,
              padding: EdgeInsets.fromLTRB(12.w, 5.h, 12.w, 5.h),
              color: Colors.white,
              // height: Get.height,
              child: Stack(
                children: [
                  Form(
                    key: UploadImageCubit.formstate, 
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
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
                                  )), // Change icon color based on theme
                              onPressed: () {
                                AddTaskCubit.get(context).clearTextInTextField(context);
                                 Navigator.pop(context);},
                            ),
                            SizedBox(
                              width: 1.5.w,
                            ),
                            Text(
                              'Add new task',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700), // Text color
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                         ImagePickerWidget(imageTaskName: task?.image),
                        SizedBox(
                          height: 20.h,
                        ),
                        InputFieldWithLabel(
                          validator: (val) {
                            if (val==null || val.isEmpty) {
                              return "title required";
                            } else {
                              return null;
                            }
                          },
                          controller: AddTaskCubit.get(context).titleController,
                           
                          label: "Task title",
                          hint: "Enter title here...",
                          width: Get.width,
                          paddingBottom: 8.h,
                          paddingLeft: 14.w,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        InputFieldWithLabel(
                           validator: (val) {
                            if (val==null || val.isEmpty) {
                              return "desc required";
                            } else {
                              return null;
                            }
                          },
                          controller: AddTaskCubit.get(context).discController,
                          label: "Task Description",
                          hint: """Enter description here...""",
                          width: Get.width,
                          paddingBottom: 8.h,
                          paddingLeft: 14.w,
                          maxLines: 8,
                          height: 170.h,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Priority",
                              style: TextStyles.font12GraySemiBold,
                            ),
                            SizedBox(
                              height: 6.h,
                            ),
                            //TODO:logic here
                            BlocBuilder<PriorityCubit, PriorityState>(
                              builder: (context, state) {
                                return CompositedTransformTarget(
                                  link: AddTaskCubit.get(context).layerLink,
                                  child: CardInfoComponent(
                                    gestureKey:
                                        PriorityCubit.get(context).cardKey,
                                    widget: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.flag_outlined,
                                          color: AppColor.movee,
                                          size: 30,
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Text(
                                          "${state.priority} Priority",
                                          style: TextStyle(
                                              color: AppColor.movee,
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w700,
                                              fontFamily:
                                                  "DmSans"), // Text color
                                        ),
                                      ],
                                    ),
                                    onTap: () {
                                      PriorityCubit.get(context).toggleOpen();
                                    },
                                    iconWidget: Icon(
                                      state.isOpen
                                          ? Icons.arrow_drop_up
                                          : Icons.arrow_drop_down,
                                      color: AppColor.movee,
                                      size: 36,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        InputFieldWithLabel(
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
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        CustomButton(
                          width: Get.width,
                          onPressed: () async {
                            final addTaskCubit = AddTaskCubit.get(context);

                            if (task==null) {
                                await UploadImageCubit.get(context)
                                .uploadImageAndCreateTask(
                                    context, ImagePickedCubit.imageFile,
                                    title: addTaskCubit.titleController.text,
                                    dueDate:
                                        addTaskCubit.dueDateController.text,
                                    priority: PriorityCubit.priority,
                                    desc: addTaskCubit.discController.text);
                            } else {
                              UpdateTaskCubit.get(context).updateTask(context, task: Task(id: task!.id,title: addTaskCubit.titleController.text,  desc: addTaskCubit.discController.text, image: task!.image, priority: PriorityCubit.priority, status:  task!.status, user:  task!.user, createdAt: task!.createdAt, updatedAt:  task!.updatedAt), index: index!);
                            }
                          

                            if (!context.mounted) return;
                            // TaskCubit.get(context).page=1;
                            TaskCubit.get(context).onRefresh();
                          },
                          text: "Add task",
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                      ],
                    ),
                  ),
                  //TODO:logic here
                  BlocBuilder<PriorityCubit, PriorityState>(
                    builder: (context, state) {
                      return state.isOpen
                          ? Positioned(
                              width: Get.width-28,
                              child: CompositedTransformFollower(
                                link: AddTaskCubit.get(context).layerLink,
                                offset: Offset(1, 62.h),
                                showWhenUnlinked: false,
                                child: Container(
                                  // width: Get.width,
                                  height: 120.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.r),
                                      color: AppColor.softMovee,
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColor.gray.withOpacity(
                                              0.4), 
                                          blurRadius: 8, 
                                          offset: const Offset(2,
                                              4), 
                                        ),
                                         BoxShadow(
                                          color:Colors.black.withOpacity(
                                              0.5),
                                          blurRadius: 8, 
                                          offset: const Offset(2,
                                              4), 
                                        ),
                                        BoxShadow(
                                          color: AppColor.gray.withOpacity(
                                              0.4),
                                          blurRadius: 8, 
                                          offset: const Offset(2,
                                              4), 
                                        ),
                                        BoxShadow(
                                          color: AppColor.gray.withOpacity(
                                              0.4),
                                          blurRadius: 8, 
                                          offset: const Offset(2,
                                              4), 
                                        ),
                                      ]),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: List.generate(
                                      PriorityCubit.priorityList.length,
                                      (index) {
                                        return GestureDetector(
                                          onTap: () {
                                            PriorityCubit.get(context)
                                                .setPriority(PriorityCubit
                                                    .priorityList[index]);
                                          },
                                          child: Container(
                                            width: Get.width,
                                            padding: EdgeInsets.only(
                                                bottom: 10.h,
                                                top: 10.h,
                                                left: 12.w),
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    // top: BorderSide(
                                                    //     width: 1,
                                                    //     color: AppColor.movee),
                                                    bottom: index == 2
                                                        ? BorderSide.none
                                                        : BorderSide(
                                                            width: 0.5,
                                                            color: AppColor
                                                                .movee))),
                                            child: Text(
                                              "${PriorityCubit.priorityList[index]} Priority",
                                              style: TextStyle(
                                                  color: AppColor.movee,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily:
                                                      "DmSans"), // Text color
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ))
                          : const SizedBox();
                    },
                  )
                ],
              )),
        ),
      ),
    );
  }
}


