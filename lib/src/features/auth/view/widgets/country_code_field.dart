import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phone_form_field/phone_form_field.dart';

import '../../../../config/theme/text_styles/styles.dart';
import '../../../../core/constants/colors.dart';

class PhoneInputField extends StatelessWidget {
  const PhoneInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
     height: 50.h,width: 326.w,
      decoration: BoxDecoration(
            
          
            borderRadius: BorderRadius.circular(10.r),
        border: Border.all(width:1,color: AppColor.softGray)),
      child: PhoneFormField( decoration: InputDecoration(
        constraints: BoxConstraints(maxHeight: 50.h,maxWidth: 326.w),
        
        contentPadding:   EdgeInsets.fromLTRB(30.w, 14.5.h, 5.w, 3.h),// padding is 30 when error ..normal 14
         hintText: "123 456-7890",
         hintStyle:  TextStyles.font13GrayRegular.copyWith(color: AppColor.grey,
          fontSize: 16,fontFamily: "regular",),
     
             border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
      //    focusedBorder: OutlineInputBorder(
      //       borderSide: const BorderSide(color:AppColor.softGray, width: 1.0),
      //       borderRadius: BorderRadius.circular(30)
      //  ) ,
      //        enabledBorder:  OutlineInputBorder(
      //       borderSide: const BorderSide(color:AppColor.softGray, width: 1.0),
      //       borderRadius: BorderRadius.circular(30)
      //  ),
      ),
  initialValue: PhoneNumber.parse('+20'), // or use the controller
  validator: PhoneValidator.compose([
    // list of validators to use
    PhoneValidator.required(context,errorText: "You must enter a value"),
    PhoneValidator.validMobile(context ),
    // ..
  ]),
  countrySelectorNavigator: const CountrySelectorNavigator.page(),
  onChanged: (phoneNumber) => print('changed into $phoneNumber'),
  enabled: true,
  isCountrySelectionEnabled: true,
  isCountryButtonPersistent: true,
  countryButtonStyle: const CountryButtonStyle(
    showDialCode: true,
    showIsoCode: true,
    showFlag: true,
    flagSize: 16
  ),

  // + all parameters of TextField
  // + all parameters of FormField
  // ...
),
    );
  }
}
