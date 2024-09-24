// delete_task_cubit.dart
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../config/routing/app_routes_info/app_routes_name.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/errors/network_exceptions.dart';
import '../../../../core/utilits/functions/toast_message.dart';
import '../../data/models/task_model.dart';
import '../../data/repo/task_repo.dart';
import '../add_task/add_task_cubit/add_task_cubit.dart';
import 'edit_task_state.dart';

class UpdateTaskCubit extends Cubit<UpdateTaskState> {
  UpdateTaskCubit(this.taskRepo, this.hive, this.sharedPreferences) : super(UpdateTaskInitial());
final TaskRepo taskRepo;
final HiveInterface hive;
final SharedPreferences sharedPreferences;
static UpdateTaskCubit get(BuildContext context)=>BlocProvider.of(context);

  Future<void> updateTask(BuildContext context,{required Task task,required int index}) async {
   String id =jsonDecode(sharedPreferences.getString("token_info") ?? "")["_id"];
      emit(UpdateTaskInitial()); 
      

var dataState =await taskRepo.editTask(task);
dataState.when(success: (data) {


  log("from edit task method success");
       List<Task> cachedTodos =
              hive.box('todos').get('todos/$id');
 if (index >= 0 && index < cachedTodos.length) {
        // Update the task at the given index
        cachedTodos[index] = task;

        // Save the updated list back to Hive
        hive.box('todos').put('todos/$id', cachedTodos);
         

          showToast(data, AppColor.softMovee);

       AddTaskCubit.get(context).clearTextInTextField(context);

          Future.delayed(const Duration(seconds: 2));

          Get.offNamed(AppRouteName.taskPage);


        // emit(UpdateTaskSuccess());
      } else {
        emit(UpdateTaskFailure("Task not found or invalid index."));
      }



  
}, failure: (networkExceptions) {
        showToast(NetworkExceptions.getErrorMessage(networkExceptions),AppColor.amber);
},);

  }
}
