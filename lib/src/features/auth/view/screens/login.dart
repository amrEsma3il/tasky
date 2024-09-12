import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../service_locator.dart'as di;
import '../../../../core/constants/images.dart';
import '../../../../core/utilits/widgets/custom_text_field.dart';
import '../../../../core/utilits/widgets/cutom_button.dart';
import '../../../onboarding/logic/onboarding_cubit/onboarding_cubit.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: Get.width,
            ),
            Image.asset(fit: BoxFit.cover,
              AppImages.onboardingBg,
              width: Get.width,
              height: 438.h,
            ),
            
            SizedBox(width: Get.width,
              
              child: Padding(
                padding:  EdgeInsets.fromLTRB(28.w,0,0,0),
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
                    CustomTextField(controller:TextEditingController() ,)
                 
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 38.h,
            ),
            CustomButton(
              onPressed: () {
                //TODO:add sign-in logic
                // di.serviceLocator<OnboardingCubit>().navigateEvent();
              },
              text: "Sign In",
         
            )
          ],
        ),
      ),
    );
  }
}