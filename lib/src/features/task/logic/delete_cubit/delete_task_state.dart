// delete_task_state.dart
abstract class DeleteTaskState {}

class DeleteTaskInitial extends DeleteTaskState {}

class DeleteTaskSuccess extends DeleteTaskState {
  final String message;

  DeleteTaskSuccess({required this.message});
}

class DeleteTaskFailure extends DeleteTaskState {
  final String error;

  DeleteTaskFailure(this.error);
}
