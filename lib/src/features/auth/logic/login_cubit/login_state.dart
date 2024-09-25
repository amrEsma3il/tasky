abstract class LoginState{}

class InitState extends LoginState{}
class LoadingState extends LoginState{}
class SuccessState extends LoginState{
final String successMessage;

  SuccessState({required this.successMessage});
}
class FailureState extends LoginState{
final String errorMessage;

  FailureState({required this.errorMessage});

}







