

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/theme/text_styles/styles.dart';
import '../../constants/colors.dart';



// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  int? maxLines;
 final Color textColor;
  String? hintText;
  double? width,height,paddingBottom,paddingTop,radius;
  final bool? obscureText;
  void Function(String)? onChanged;
  void Function()? onTap;
  String? Function(String?)? validator;
  Widget? suffiWidget;
   Widget? prefixWidget;
   bool ? hideKeyboard;
 TextEditingController controller;
 TextInputType keyBoardType;
   CustomTextField({
    this.obscureText,
    this.radius,
    super.key,
    this.hintText,
    this.textColor=Colors.black,
    this.paddingTop=15,
    this.maxLines=1,
   required this.controller,
     this.keyBoardType=TextInputType.text,
    this.prefixWidget,
    this.height,
      this.paddingBottom=5,
    this.width,
   this. onChanged,
   this.validator,
   this.onTap,

   this.suffiWidget,
   this.hideKeyboard

  });

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: width,
      height: height,
           decoration: BoxDecoration(
            
          
            borderRadius: BorderRadius.circular(radius??10.r),
        border: Border.all(width:1,color: AppColor.softGray)),
      
      child: TextFormField(
        obscureText: obscureText??false,
        style: TextStyle(color: textColor),
        maxLines: maxLines!,
        controller: controller
        ,
        keyboardType: keyBoardType,
        
    
       textDirection: TextDirection.ltr,
           scrollPadding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).viewInsets.bottom),
        showCursor: hideKeyboard,
         readOnly: hideKeyboard??false,
       onChanged:onChanged ,
       onTap: onTap,
       validator: validator,
       
       
        textAlign: TextAlign.left,
       decoration: InputDecoration(
        constraints: BoxConstraints(maxHeight: height!,maxWidth: width!),
        
        contentPadding:  EdgeInsets.fromLTRB(10, paddingTop!, 5, paddingBottom!),
         hintText: hintText,
         hintStyle:  TextStyles.font13GrayRegular.copyWith(color: AppColor.gray,
          fontSize: 16,fontFamily: "regular",),
         suffixIcon:  suffiWidget,
         prefixIcon: prefixWidget,
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
      )),
    );
  }
}