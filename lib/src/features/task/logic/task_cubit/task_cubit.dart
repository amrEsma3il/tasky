import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'dart:async';

import '../../../../core/errors/network_exceptions.dart';
import '../../data/models/task_model.dart';
import '../../data/repo/task_repo.dart';
import 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
    final ScrollController scrollController = ScrollController();

  int page = 1;
  bool isFetching = false;
  final HiveInterface hive;
  final TaskRepo taskRepo;

  TaskCubit({required this.hive, required this.taskRepo})
      : super(TaskInitial()){
          scrollController.addListener(onScroll);
      }

     static TaskCubit get(BuildContext context)=>BlocProvider.of<TaskCubit>(context);

  Future<void> fetchTodos({bool isRefresh = false,String status="all"}) async {

     List<Task?> cachedTodos =
              hive.box('todos').get('todos', defaultValue: <Task>[]);

    if (state is TaskLoading) return;
    if (isRefresh) {
      page = 1;
      emit(TaskInitial());
    }

 if (cachedTodos.isEmpty) {
   emit(TaskLoading());
 }   

    var dataState = await taskRepo.getTodos(page: page);

    dataState.when(
      success: (todos) async {
        int pageLength=todos.length;
        if (todos.isEmpty && cachedTodos.isEmpty) {
          emit(TodoEmpty());
        } else {
         

          if (!isRefresh) {
            todos=cachedTodos+todos; // Add new todos to the previous list
          }
          await hive.box('todos').put('todos', todos); // Store todos in the box
          // Cache the data in Hive


          //filter tasks by status
          if (status!="all") {
            todos= todos.where((todo) => todo!.status.toLowerCase() == status).toList();

          }
            
          emit(TaskLoaded(todos: todos, hasReachedMax: todos.length < 20,pageLength:pageLength ));
        }
        page++;
      },
      failure: (networkExceptions) {
        emit(TodoFailure(NetworkExceptions.getErrorMessage(networkExceptions)));
      },
    );
  }

  Future<void> loadMoreTodos() async {
    if (isFetching) return;
    if (state is TaskLoaded && !(state as TaskLoaded).hasReachedMax) {
      isFetching = true;
      await fetchTodos();
      isFetching = false;
    }
  }

 void onScroll() {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      loadMoreTodos();
    }
  }

  Future<void> onRefresh() async {
    await fetchTodos(isRefresh: true);
  }

 filterTasksByStatus(String status){
  fetchTodos(status: status);
 
 }

}
