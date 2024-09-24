abstract class RegisterState {}

// Initial State
class RegisterInitial extends RegisterState {}


// Success State
class RegisterSuccess extends RegisterState {
  final String message;

  RegisterSuccess(this.message);
}

// Failure State
class RegisterFailure extends RegisterState {
  final String error;

  RegisterFailure(this.error);
}
