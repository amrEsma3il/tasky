

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/data_state/api_result.dart';
import '../../../../core/errors/network_exceptions.dart';
import '../../logic/change_status_cubit/change_status_cubit.dart';
import '../data_sources/task_remote_data_source.dart';
import '../models/task_model.dart';

class TaskRepo {
  final TaskRemoteDataSource taskRemoteDataSource;

  TaskRepo({ required this.taskRemoteDataSource});

  static List<Map<String,dynamic>> statusList(BuildContext context)=>[
   {
    'status_name':'All',
  
   },
      {
    'status_name':'Inprogress',
    
   },
      {
    'status_name':'Waiting',
   
   }
   ,   {
    'status_name':'Finished',
   
   }
  ];

 Future<DataState<List<Task?>>> getTodos({required int page})async{

  try {
  List<Task?> todos=await taskRemoteDataSource.getTodos(page: page);


 return  DataState.success(todos);
  } catch (e) {
    if (e is Exception) {
        //  log(error: );
    }
 
       return DataState.failure(NetworkExceptions.getDioException(e));
  }
  }

  createTask(){


  }

  editeTask(){

  }

  deleteTask(){
    
  }
}