import 'dart:developer';

import '../../../../core/data_state/api_result.dart';
import '../../../../core/errors/network_exceptions.dart';
import '../data_sources/task_remote_data_source.dart';
import '../models/task_model.dart';

class TaskRepo {
  final TaskRemoteDataSource taskRemoteDataSource;

  TaskRepo({ required this.taskRemoteDataSource});

 Future<DataState<List<Task?>>> getTodos({required int page})async{

  try {
  List<Task?> todos=await taskRemoteDataSource.getTodos(page: page);


 return  DataState.success(todos);
  } catch (e) {
    log(e.toString());
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