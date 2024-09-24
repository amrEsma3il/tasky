import '../../data/models/profile_model.dart';

abstract class ProfileState {}

// Initial State
class ProfileInitial extends ProfileState {}

// Loading State
class ProfileLoading extends ProfileState {}

// Success State
class ProfileSuccess extends ProfileState {
  final ProfileModel userProfile;

  ProfileSuccess(this.userProfile);
}

// Failure State
class ProfileFailure extends ProfileState {
  final String error;

  ProfileFailure(this.error);
}
