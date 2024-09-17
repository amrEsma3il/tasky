import '../../data/models/task_model.dart';

abstract class TaskState {}

class TaskInitial extends TaskState {}

class TaskLoading extends TaskState {}

class TaskLoaded extends TaskState {
  final List<Task?> todos;
  final bool hasReachedMax;

  TaskLoaded({required this.todos, this.hasReachedMax = false});

  TaskLoaded copyWith({List<Task>? todos, bool? hasReachedMax}) {
    return TaskLoaded(
      todos: todos ?? this.todos,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}

class TodoFailure extends TaskState {
  final String error;

  TodoFailure(this.error);
}

class TodoEmpty extends TaskState {}
