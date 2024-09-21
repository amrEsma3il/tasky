import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/errors/network_exceptions.dart';
import '../../../../../core/utilits/functions/toast_message.dart';
import '../../../data/models/add_task_model.dart';
import '../../../data/repo/task_repo.dart';
import '../add_task_cubit/add_task_cubit.dart';
import 'upload_image_state.dart';

class UploadImageCubit extends Cubit<UploadImageState> {
  final TaskRepo taskRepo;
  UploadImageCubit(this.taskRepo) : super(InitState());
static UploadImageCubit get(BuildContext context)=>BlocProvider.of<UploadImageCubit>(context);
  static GlobalKey<FormState> formstate = GlobalKey<FormState>();

//TODO:move this logic in addtask cubit 
 Future<void> uploadImageAndCreateTask(BuildContext context, File? image,
      {required String title,
      required String dueDate,
      required String priority,
      required String desc}) async {
    if (image != null) {
      if (formstate.currentState!.validate()) {
        var dataState = await taskRepo.uploadImage(image);

        dataState.when(
          success: (data) {
            AddTaskCubit.get(context).addTask(
              
              AddTaskModel(

                desc: desc,
                dueDate: dueDate,
                title: title,
                image: data,
                priority: priority.toLowerCase()),context);
          },
          failure: (networkExceptions) {
            showToast(NetworkExceptions.getErrorMessage(networkExceptions),
                AppColor.movee);
          },
        );
      } else {
        showToast("at least one field not valid", AppColor.softMovee);
      }
    } else {
      showToast("Select Image From Gallarey", AppColor.softMovee);
    }
  }
}
