import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../core/data_state/api_result.dart';
import '../../../../core/errors/network_exceptions.dart';
import '../data_sources/task_remote_data_source.dart';
import '../models/add_task_model.dart';
import '../models/task_model.dart';

class TaskRepo {
  //TODO:internet conctivity stream cheak in all repos or endpoints
  final TaskRemoteDataSource taskRemoteDataSource;

  TaskRepo({required this.taskRemoteDataSource});

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
    try {
      List<Task> todos = await taskRemoteDataSource.getTodos(page: page);

      return DataState.success(todos);
    } catch (e) {
      if (e is Exception) {
        //  log(error: );
      }

      return DataState.failure(NetworkExceptions.getDioException(e));
    }
  }

  Future<DataState<Task>> fetchOneTask(String id) async {
    try {
      Task todo = await taskRemoteDataSource.fetchOneTask(id);

      return DataState.success(todo);
    } catch (e) {
      return DataState.failure(NetworkExceptions.getDioException(e));
    }
  }

  Future<DataState<String>> uploadImage(File image) async {
    try {
      String imageName = await taskRemoteDataSource.uploadImage(image);
      return DataState.success(imageName);
    } catch (e) {
      return DataState.failure(NetworkExceptions.getDioException(e));
    }
  }

 Future<DataState<String>> createTask(AddTaskModel addTaskModel) async{
 try {
      Task result = await taskRemoteDataSource.createTask( addTaskModel);
      return DataState.success("Add ${result.title} Task Successfuly");
    } catch (e) {
      return DataState.failure(NetworkExceptions.getDioException(e));
    }

  }

 Future<DataState<String>> editTask(Task task)async {

   try {
      Task result = await taskRemoteDataSource.editTask( task);
      return DataState.success("edit ${result.title} Task Successfuly");
    } catch (e) {
      return DataState.failure(NetworkExceptions.getDioException(e));
    }
 }

 Future<DataState<String>> deleteTask(String id) async {

   try {
      Task result = await taskRemoteDataSource.deleteTask( id);
      return DataState.success("delete ${result.title} Task Successfuly");
    } catch (e) {
      return DataState.failure(NetworkExceptions.getDioException(e));
    }
 }
}
