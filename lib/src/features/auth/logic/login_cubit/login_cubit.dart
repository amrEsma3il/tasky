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
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authRepo;
  LoginCubit({required this.authRepo}) : super(InitState());
static LoginCubit get(BuildContext context)=>BlocProvider.of<LoginCubit>(context);
 static GlobalKey<FormState> formstate = GlobalKey<FormState>();
PhoneController phoneNoController=PhoneController(initialValue: const PhoneNumber(isoCode: IsoCode.EG, nsn: "123 456-7890"));
TextEditingController passwordController=TextEditingController();


Future login({required String phone,required String password,})async{

// var headers = {
//   'Content-Type': 'application/json',
//   'Authorization': '••••••'
// };
// var response =await http.post(Uri.parse('https://todo.iraqsapp.com/auth/login'),
// body:{
//   "phone": "01009931326",
//   "password": "123456"
// }  );
// // request.body = json.encode({
// //   "phone": "01009931326",
// //   "password": "123456"
// // });
// // request.headers.addAll(headers);

// // http.StreamedResponse response = await request.send();

// if (response.statusCode == 200|| response.statusCode == 201) {
// TokenModel  data=TokenModel.fromJson(jsonDecode(response.body));
//   // print(await response.stream.bytesToString());
//   log("success");
//   log("id : ${data.id}");
//     log("access token : ${data.accessToken}");
//       log("refresh token : ${data.refreshToken}");
//   showToast("success login", AppColor.movee);
//   Future.delayed(Duration(seconds: 2));
//   Get.offNamed(AppRouteName.home);
// }
// else {
//   log(response.reasonPhrase.toString());
//     showToast("failure", AppColor.movee);

// }


  // log(phone);
if (formstate.currentState!.validate()){
  print("pass ${password}");
  var dataState=await authRepo.login(  phone: phone,
  password:password);
  dataState.when(success: (data) {
    // emit(SuccessState(successMessage: data));
         showToast(data, AppColor.softMovee);

         clearTextInTextField();

        Future.delayed(const Duration(seconds: 2));
      

        Get.offNamed(AppRouteName.taskPage)!.then((value) {
          
        },);
    
  }, failure: (networkExceptions) {
     showToast(NetworkExceptions.getErrorMessage(networkExceptions), AppColor.softMovee);
        // emit(FailureState(errorMessage: NetworkExceptions.getErrorMessage(networkExceptions)));
  },);
}else{showToast("at least one field not valid", AppColor.softMovee);
}

}

 
  void clearTextInTextField() {
    phoneNoController.value = const PhoneNumber(nsn: "",isoCode: IsoCode.EG);

    passwordController.text = "";
  }
  
}