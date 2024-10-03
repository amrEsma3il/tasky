import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:phone_form_field/phone_form_field.dart';
import '../../../../config/routing/app_routes_info/app_routes_name.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/errors/network_exceptions.dart';
import '../../../../core/utilits/functions/toast_message.dart';
import '../../data/models/user_model.dart';
import '../../data/repo/auth_repo.dart';
import 'register_state.dart'; // Import your RegisterState here

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepo authRepo;
  RegisterCubit(this.authRepo) : super(RegisterInitial());

  static RegisterCubit get(BuildContext context) =>
      BlocProvider.of<RegisterCubit>(context);

  final LayerLink layerLink = LayerLink();
  static GlobalKey<FormState> formstate = GlobalKey<FormState>();

  PhoneController phoneNoController = PhoneController(
      initialValue:
          const PhoneNumber(isoCode: IsoCode.EG, nsn: "123 456-7890"));
  TextEditingController passwordController = TextEditingController();

  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController yearsExceprinceController = TextEditingController();

  registerUser({required UserModel user}) async {
    if (formstate.currentState!.validate()) {
        var dataState = await authRepo.register(user);

    dataState.when(
      success: (data) {

        
        showToast(data, AppColor.softMovee);

        clearTextInTextField();

        Future.delayed(const Duration(seconds: 2));

        Get.offNamed(AppRouteName.login);
      },
      failure: (networkExceptions) {

        // showToast(NetworkExceptions.getErrorMessage(networkExceptions), Colors.white24);
      },
    );
    } else{showToast("at least one field not valid", AppColor.softMovee);}
  
  }

  void clearTextInTextField() {
    phoneNoController.value = const PhoneNumber(nsn: "", isoCode: IsoCode.EG);

    passwordController.text = "";
    nameController.text = "";
    addressController.text = "";
    yearsExceprinceController.text = "";
  }

  onChanged(PhoneNumber phoneNumber) {
    phoneNoController.value = phoneNumber;
  }
}
