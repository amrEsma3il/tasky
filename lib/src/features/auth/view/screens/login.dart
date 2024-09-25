import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tasky/src/features/splash/logic/splash_cubit/splash_cubit.dart';
import '../../../../../service_locator.dart' as di;
import '../../../../config/routing/app_routes_info/app_routes_name.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/images.dart';
import '../../../../core/utilits/functions/toast_message.dart';
import '../../../../core/utilits/widgets/custom_text_field.dart';
import '../../../../core/utilits/widgets/cutom_button.dart';
import '../../../onboarding/logic/onboarding_cubit/onboarding_cubit.dart';
import '../../../task/logic/task_cubit/task_cubit.dart';
import '../../logic/login_cubit/login_cubit.dart';
import '../../logic/login_cubit/login_state.dart';
import '../../logic/password_cubit/password_cubit.dart';
import '../widgets/country_code_field.dart';
import '../widgets/text_with_link_component.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: LoginCubit.formstate,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: Get.width,
                ),
                Image.asset(
                       colorBlendMode: BlendMode.modulate,
          color: Colors.white,
                  fit: BoxFit.cover,
                  AppImages.onboardingBg,
                  width: Get.width,
                  height: 438.h,
                ),
                SizedBox(
                  width: Get.width,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(28.w, 0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Login",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              // height: 1.34,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w700,
                              fontFamily: "DmSans"),
                        ),
                        SizedBox(
                          height: 22.h,
                        ),
                         PhoneInputField(width: 326.w,
                          controller: LoginCubit.get(context).phoneNoController,onChanged: LoginCubit.get(context).onChanged,),
                        SizedBox(
                          height: 15.h,
                        ),
                        BlocBuilder<PasswordCubit, bool>(
                          builder: (context, state) {
                            return CustomTextField(
                              onChanged: (p0) {
                                
                              },
                              controller: LoginCubit.get(context).passwordController,
                              height: 50.h,
                              width: 326.w,
                              obscureText: !state ,
                              hintText: "Password...",
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return "must enter password";
                                }
                                return null;
                              },
                              suffiWidget: Padding(
                                padding: EdgeInsets.only(top: 3.h),
                                child: IconButton(
                                  onPressed: () {
                                    PasswordCubit.get(context)
                                        .showPassword();
                                  },
                                  icon: Icon(
                                    state
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: AppColor.gray,
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 38.h,
                ),
                CustomButton(
                  width: 326.w,
                  onPressed: () async{
                  await  di.serviceLocator<LoginCubit>().login(
                        phone: LoginCubit.get(context).phoneNoController
                            .value
                            .countryCode.split("").last.toString()+  LoginCubit.get(context).phoneNoController
                            .value
                            .nsn,
                        password: LoginCubit.get(context).passwordController.text);
                         if(!context.mounted)return;
                          TaskCubit.get(context).fetchTodos();
                  },
                  text: "Sign In",
                ),
                SizedBox(height: 20.h,),
                TextWithLink(txt: "Didn't have any account? ",link:'Sign Up here' ,onTap: () {
                  Get.offNamed(AppRouteName.register);
                },),
                   SizedBox(height: 13.h,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}