import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../config/routing/app_routes_info/app_routes_name.dart';
import '../../../../core/errors/network_exceptions.dart';
import '../../data/repo/auth_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authRepo;
  LoginCubit({required this.authRepo}) : super(InitState());
static LoginCubit get(BuildContext context)=>BlocProvider.of<LoginCubit>(context);
 static GlobalKey<FormState> formstate = GlobalKey<FormState>();
TextEditingController phoneNoController=TextEditingController();
TextEditingController passwordController=TextEditingController();


login({required String phone,required String password,})async{
if (formstate.currentState!.validate()){
  var dataState=await authRepo.login(phone: phone, password: password);
  dataState.when(success: (data) {
    emit(SuccessState(successMessage: data));
         clearTextInTextField();
        Future.delayed(const Duration(seconds: 1));
        Get.offNamed(AppRouteName.home);
    
  }, failure: (networkExceptions) {
    
        emit(FailureState(errorMessage: NetworkExceptions.getErrorMessage(networkExceptions)));
  },);
}


}

 
  void clearTextInTextField() {
    phoneNoController.text = "";

    passwordController.text = "";
  }
  
}