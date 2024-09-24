import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../config/routing/app_routes_info/app_routes_name.dart';
import '../../../../core/errors/network_exceptions.dart';
import '../../data/repo/auth_repo.dart';
import 'profile_state.dart'; 

class ProfileCubit extends Cubit<ProfileState> {
  final AuthRepo authRepo;
  ProfileCubit(this.authRepo) : super(ProfileInitial());
static ProfileCubit get(BuildContext context)=>BlocProvider.of<ProfileCubit>(context);

fetchUserProfile() async {
  
  emit(ProfileLoading());
  var dataState=await authRepo.profile();
  dataState.when(success: (data) {

    Get.toNamed(AppRouteName.profile);
    emit(ProfileSuccess(data));
  }, failure: (networkExceptions) {
    
emit(ProfileFailure(NetworkExceptions.getErrorMessage(networkExceptions)));
  },);
  }

}
