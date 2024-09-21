// delete_task_cubit.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import '../../../../core/errors/network_exceptions.dart';
import '../../data/models/task_model.dart';
import '../../data/repo/task_repo.dart';
import 'delete_task_state.dart';

class DeleteTaskCubit extends Cubit<DeleteTaskState> {
  DeleteTaskCubit(this.taskRepo, this.hive) : super(DeleteTaskInitial());
final TaskRepo taskRepo;
final HiveInterface hive;
static DeleteTaskCubit get(BuildContext context)=>BlocProvider.of(context);
  Future<void> deleteTask(String id,int index) async {
   
      emit(DeleteTaskInitial()); 
      

var dataState =await taskRepo.deleteTask(id);
dataState.when(success: (data) {
       List<Task> cachedTodos =
              hive.box('todos').get('todos');

 if (index >= 0 && index < cachedTodos.length) {
    Task removedTask=    cachedTodos.removeAt(index);
        hive.box('todos').put('todos', cachedTodos); 
        emit(DeleteTaskSuccess(message: "Remove ${removedTask.title} Task Successfully")); // Emit success with updated list
      } else {
        emit(DeleteTaskFailure("Invalid index"));
      }
              


  
}, failure: (networkExceptions) {
        emit(DeleteTaskFailure(NetworkExceptions.getErrorMessage(networkExceptions)));
},);

  }
}
