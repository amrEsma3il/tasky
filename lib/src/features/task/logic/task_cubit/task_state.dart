import '../../data/models/task_model.dart';

abstract class TaskState {}

class TaskInitial extends TaskState {}

class TaskLoading extends TaskState {}

class TaskLoaded extends TaskState {
  final List<Task> todos;
  final bool hasReachedMax;
  final int pageLength;

  TaskLoaded({required this.todos,required this.pageLength, this.hasReachedMax = false});

  TaskLoaded copyWith({List<Task>? todos, bool? hasReachedMax,int? pageLength}) {
    return TaskLoaded(
      todos: todos ?? this.todos,
      pageLength: pageLength??this.pageLength,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}

class TodoFailure extends TaskState {
  final String error;

  TodoFailure(this.error);
}

class TodoEmpty extends TaskState {}
// class TodoEmpty extends TaskState {}
