import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phone_form_field/phone_form_field.dart';
import '../../../../../service_locator.dart' as di;

import '../../../../config/theme/text_styles/styles.dart';
import '../../../../core/constants/colors.dart';
import '../../logic/login_cubit/login_cubit.dart';
import '../../logic/login_cubit/login_state.dart';
import '../../logic/login_cubit/padding_cubit/pading_cubit.dart';

class PhoneInputField extends StatelessWidget {
  const PhoneInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 326.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(width: 1, color: AppColor.softGray)),
      child: BlocBuilder<PaddingCubit, double>(
        builder: (context, state) {
          return PhoneFormField(
            controller:  LoginCubit.get(context).phoneNoController,
            decoration: InputDecoration(
              constraints: BoxConstraints(maxHeight: 50.h, maxWidth: 326.w),
              contentPadding: EdgeInsets.fromLTRB(35.w, state.h, 5.w,
                  3.h), // padding is 30 when error ..normal 14
              hintText: "123 456-7890",
              hintStyle: TextStyles.font13GrayRegular.copyWith(
                color: AppColor.grey,
                fontSize: 16,
                fontFamily: "regular",
              ),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
            ),
            validator: PhoneValidator.compose([
              PhoneValidator.required(context,
                  errorText: "You must enter a value"),
              PhoneValidator.validMobile(context),
              PhoneValidator.valid(context,
                  errorText: "invalid mobile phone number")
            ]),
            countrySelectorNavigator: const CountrySelectorNavigator.page(),
            
            onChanged: (phoneNumber) {
              print("changes");
               LoginCubit.get(context).phoneNoController.value=phoneNumber;
              print("phone num ${phoneNumber.nsn}");
              print("phone num from controller${  LoginCubit.get(context).phoneNoController.value.nsn}");
              if ((phoneNumber.isValid()) ||
                  (phoneNumber.nsn.trim().isNotEmpty)) {
                print("Phone number is valid");
              PaddingCubit.get(context).changePadding(14.4);
                // Add further logic for valid number
              } else {
              PaddingCubit.get(context).changePadding(31);
              }
              // if (phoneNumber.nsn.trim().isNotEmpty){
              //   print("Invalid mobile phone number");
              //   // Add logic for invalid number
              // }
            },
            enabled: true,
            isCountrySelectionEnabled: true,
            isCountryButtonPersistent: true,
            countryButtonStyle: const CountryButtonStyle(
                showDialCode: true,
                showIsoCode: false,
                showFlag: true,
                flagSize: 16),
          );
        },
      ),
    );
  }
}
