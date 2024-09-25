import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../config/routing/app_routes_info/app_routes_name.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/errors/network_exceptions.dart';
import '../../../../../core/utilits/functions/toast_message.dart';
import '../../../data/models/add_task_model.dart';
import '../../../data/repo/task_repo.dart';
import '../image_cubit.dart';
import '../priority_cubit/priority_cubit.dart';
import 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  final TaskRepo taskRepo;
  AddTaskCubit(this.taskRepo) : super(InitState());

  static AddTaskCubit get(BuildContext context) =>
      BlocProvider.of<AddTaskCubit>(context);

  final LayerLink layerLink = LayerLink();

  TextEditingController titleController = TextEditingController();
  TextEditingController discController = TextEditingController();

  TextEditingController dueDateController = TextEditingController();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColor.movee, // header background color
            colorScheme: ColorScheme.light(primary: AppColor.movee),
            buttonTheme: const ButtonThemeData(
                textTheme: ButtonTextTheme.primary // button text color
                ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      dueDateController.text = DateFormat('d MMMM, y').format(picked);
    }
  }

  addTask(AddTaskModel task,BuildContext context) async {

    log("from add task method");
      var dataState = await taskRepo.createTask(task);
      dataState.when(
        success: (data) {
              log("from add task method success");

          showToast(data, AppColor.softMovee);

          clearTextInTextField(context);

          Future.delayed(const Duration(seconds: 2));

          Get.offNamed(AppRouteName.taskPage);
        },
        failure: (networkExceptions) {
          showToast(NetworkExceptions.getErrorMessage(networkExceptions),
              AppColor.softMovee);
        },
      );
 
  }

  void clearTextInTextField(BuildContext context) {
    discController.text = '';
    titleController.text = "";
    dueDateController.text = "";
    ImagePickedCubit.imageFile = null;
    ImagePickedCubit.get(context).clearImage();
    PriorityCubit.priority = "Low";
  }
}
