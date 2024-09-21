
abstract class UploadImageState {
  
} 


class InitState extends UploadImageState {
  
}

class FailureState extends UploadImageState {
  final String error;

  FailureState({required this.error});
  
}
class SuccessState extends UploadImageState {
  final String message;

  SuccessState({required this.message});
  
}