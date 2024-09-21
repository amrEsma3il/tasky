import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../config/routing/app_routes_info/app_routes_name.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/errors/network_exceptions.dart';
import '../../../../core/utilits/functions/toast_message.dart';
import '../../data/repo/task_repo.dart';
import 'task_details_state.dart';

class TaskDatailsCubit extends Cubit<TaskDetailsState> {
  final TaskRepo taskRepo;
  TaskDatailsCubit(this.taskRepo) : super(InitState());

static TaskDatailsCubit get(BuildContext context)=>BlocProvider.of<TaskDatailsCubit>(context);
  fetchOneTask(String id)async{
   
var dataState=await taskRepo.fetchOneTask(id);

dataState.when(success: (task) {

 
   Get.toNamed(AppRouteName.taskDetails,parameters: {"task":jsonEncode(task.toJson())});
    emit(SuccessState(task: task));
}, failure: (networkExceptions) {
 showToast( NetworkExceptions.getErrorMessage(networkExceptions),AppColor.softMovee);
},);
  }
}