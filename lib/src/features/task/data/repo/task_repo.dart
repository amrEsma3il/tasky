import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/data_state/api_result.dart';
import '../../../../core/errors/network_exceptions.dart';
import '../../../../core/utilits/services/network/network_info.dart';
import '../data_sources/task_remote_data_source.dart';
import '../models/add_task_model.dart';
import '../models/task_model.dart';

class TaskRepo {
  final TaskRemoteDataSource taskRemoteDataSource;
final NetworkInfo networkInfo;
final HiveInterface hive;
final SharedPreferences sharedPreferences;
  TaskRepo(this.networkInfo, this.hive, this.sharedPreferences, {required this.taskRemoteDataSource});

  static List<Map<String, dynamic>> statusList(BuildContext context) => [
        {
          'status_name': 'All',
        },
        {
          'status_name': 'Inprogress',
        },
        {
          'status_name': 'Waiting',
        },
        {
          'status_name': 'Finished',
        }
      ];

  Future<DataState<List<Task>>> getTodos({required int page}) async {

    if (await networkInfo.isConnected) {
        try {
      List<Task> todos = await taskRemoteDataSource.getTodos(page: page);

      return DataState.success(todos);
    } catch (e) {
      if (e is Exception) {
        //  log(error: );
      }

      return DataState.failure(NetworkExceptions.getDioException(e));
    }
    } else {
      String id =jsonDecode(sharedPreferences.getString("token_info") ?? "")["_id"];
         List<Task> cachedTodos =
              hive.box('todos').get('todos/$id', defaultValue: <Task>[]);

              return DataState.success(cachedTodos);
    }
  
  }

  Future<DataState<Task>> fetchOneTask(String id) async {


    if (await networkInfo.isConnected) {
         try {
      Task todo = await taskRemoteDataSource.fetchOneTask(id);

      return DataState.success(todo);
    } catch (e) {
      return DataState.failure(NetworkExceptions.getDioException(e));
    }
    } else {
           return const DataState.failure(NetworkExceptions.noInternetConnection());
    }
 
  }

  Future<DataState<String>> uploadImage(File image) async {



    if (await networkInfo.isConnected) {
        try {
      String imageName = await taskRemoteDataSource.uploadImage(image);
      return DataState.success(imageName);
    } catch (e) {
      return DataState.failure(NetworkExceptions.getDioException(e));
    }
    } else {
      return const DataState.failure(NetworkExceptions.noInternetConnection());
    }
  
  }

 Future<DataState<String>> createTask(AddTaskModel addTaskModel) async{


  if (await networkInfo.isConnected) {
     try {
      Task result = await taskRemoteDataSource.createTask( addTaskModel);
      return DataState.success("Add ${result.title} Task Successfuly");
    } catch (e) {
      return DataState.failure(NetworkExceptions.getDioException(e));
    }
  } else {
        return const DataState.failure(NetworkExceptions.noInternetConnection());
  }


  }

 Future<DataState<String>> editTask(Task task)async {
if (await networkInfo.isConnected) {
     try {
      Task result = await taskRemoteDataSource.editTask( task);
      return DataState.success("edit ${result.title} Task Successfuly");
    } catch (e) {
      return DataState.failure(NetworkExceptions.getDioException(e));
    }
} else {
  return const DataState.failure(NetworkExceptions.noInternetConnection());
}

 }

 Future<DataState<String>> deleteTask(String id) async {
if (await networkInfo.isConnected) {
    try {
      Task result = await taskRemoteDataSource.deleteTask( id);
      return DataState.success("delete ${result.title} Task Successfuly");
    } catch (e) {
      return DataState.failure(NetworkExceptions.getDioException(e));
    }
} else {
    return const DataState.failure(NetworkExceptions.noInternetConnection());
}
 
 }
}
