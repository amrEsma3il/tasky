abstract class AddTaskState {}

class InitState extends AddTaskState {}

class FailureState extends AddTaskState {
  final String error;

  FailureState({required this.error});
}

class SuccessState extends AddTaskState {
  final String message;

  SuccessState({required this.message});
}
