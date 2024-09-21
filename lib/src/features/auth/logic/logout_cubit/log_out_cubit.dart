// ignore_for_file: public_member_api_docs, sort_constructors_first
// logout_cubit.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:tasky/src/features/auth/data/repo/auth_repo.dart';

import '../../../../config/routing/app_routes_info/app_routes_name.dart';
import '../../../../core/errors/network_exceptions.dart';
import 'log_out_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  final AuthRepo authRepo;
final SharedPreferences sharedPreferences;
  LogoutCubit(
    this.authRepo, this.sharedPreferences,
  ) : super(LogoutInitial());


static LogoutCubit get(BuildContext context)=>BlocProvider.of(context);
  Future<void> logOut() async {

      emit(LogoutInitial()); 


      var dataState=await authRepo.logOut();

      dataState.when(success: (data) {
sharedPreferences.setString("token_info","");
          emit(LogoutSuccess(message: data));
         Future.delayed(const Duration(seconds: 1)); 
         Get.offAllNamed(AppRouteName.login);
    
      }, failure: (networkExceptions) {
             emit(LogoutFailure(NetworkExceptions.getErrorMessage(networkExceptions)));
      },);
      // Emit success state on successful logout
  
  // Emit failure state if an error occurs
    
  }
}
