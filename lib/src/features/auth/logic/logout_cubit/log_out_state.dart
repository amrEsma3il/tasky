// logout_state.dart
abstract class LogoutState {}

class LogoutInitial extends LogoutState {}

class LogoutSuccess extends LogoutState {
  final String message;

  LogoutSuccess({required this.message});
}

class LogoutFailure extends LogoutState {
  final String error;

  LogoutFailure(this.error);
}
