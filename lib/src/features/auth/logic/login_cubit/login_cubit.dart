import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:phone_form_field/phone_form_field.dart';
import 'package:tasky/src/core/utilits/functions/toast_message.dart';
import 'package:tasky/src/features/auth/data/models/login/token_model.dart';

import '../../../../config/routing/app_routes_info/app_routes_name.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/errors/network_exceptions.dart';
import '../../../task/logic/task_cubit/task_cubit.dart';
import '../../data/repo/auth_repo.dart';
import '../padding_cubit/pading_cubit.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authRepo;
  LoginCubit({required this.authRepo}) : super(InitState());
static LoginCubit get(BuildContext context)=>BlocProvider.of<LoginCubit>(context);
 static GlobalKey<FormState> formstate = GlobalKey<FormState>();
PhoneController phoneNoController=PhoneController(initialValue: const PhoneNumber(isoCode: IsoCode.EG, nsn: "123 456-7890"));
TextEditingController passwordController=TextEditingController();


Future login({required String phone,required String password,})async{
if (formstate.currentState!.validate()){
  // print("pass ${password}");
  var dataState=await authRepo.login(  phone: phone,
  password:password);
  dataState.when(success: (data) {
    // emit(SuccessState(successMessage: data));
         showToast(data, AppColor.softMovee);

         clearTextInTextField();

        Future.delayed(const Duration(seconds: 2));
      

        Get.offNamed(AppRouteName.taskPage);
    
  }, failure: (networkExceptions) {
     showToast(NetworkExceptions.getErrorMessage(networkExceptions), AppColor.softMovee);
       
  },);
}else{showToast("at least one field not valid", AppColor.softMovee);
}

}

 
  void clearTextInTextField() {
    phoneNoController.value = const PhoneNumber(nsn: "",isoCode: IsoCode.EG);

    passwordController.text = "";
  }



onChanged  ( PhoneNumber phoneNumber) {
             
             phoneNoController.value=phoneNumber;
           
        
            }
  
}