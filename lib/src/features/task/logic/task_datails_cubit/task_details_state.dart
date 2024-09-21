import '../../data/models/task_model.dart';

abstract class TaskDetailsState {
  
} 


class InitState extends TaskDetailsState {
  
}

class FailureState extends TaskDetailsState {
  final String error;

  FailureState({required this.error});
  
}
class SuccessState extends TaskDetailsState {
  final Task task;

  SuccessState({required this.task});
  
}