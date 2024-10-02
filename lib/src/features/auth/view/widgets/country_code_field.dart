import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phone_form_field/phone_form_field.dart';

import '../../../../config/theme/text_styles/styles.dart';
import '../../../../core/constants/colors.dart';
import '../../logic/padding_cubit/pading_cubit.dart';

class PhoneInputField extends StatelessWidget {
  const PhoneInputField({super.key, this.controller, this.onChanged, required this.width});
final PhoneController? controller;
final double width;
final dynamic Function(PhoneNumber)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
          width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(width: 1, color:  AppColor.gray.withOpacity(.6))),
      child: BlocBuilder<PaddingCubit, double>(
        builder: (context, state) {
          return PhoneFormField(
            controller:  controller,
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
            
            onChanged: onChanged,
            enabled: true,
            isCountrySelectionEnabled: true,
            isCountryButtonPersistent: true,
            countryButtonStyle:  CountryButtonStyle(
                showDialCode: true,
                showIsoCode: false,
                showFlag: true,
                flagSize: 16.w),
          );
        },
      ),
    );
  }
}
