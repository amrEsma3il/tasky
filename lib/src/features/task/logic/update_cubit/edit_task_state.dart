// update_task_state.dart
abstract class UpdateTaskState {}

class UpdateTaskInitial extends UpdateTaskState {}

class UpdateTaskSuccess extends UpdateTaskState {
  final String message;

  UpdateTaskSuccess({required this.message});
}

class UpdateTaskFailure extends UpdateTaskState {
  final String error;

  UpdateTaskFailure(this.error);
}
