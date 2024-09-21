


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/theme/text_styles/styles.dart';
import '../../../../../core/utilits/widgets/custom_text_field.dart';



class InputFieldWithLabel extends StatelessWidget {
final int? maxLines;
final String? Function(String?)? validator;
 final String label,hint;
 final double height,width;
 final Widget ? suffix,prefix;
 final double? paddingBottom,paddingLeft;
 final  TextEditingController controller;

   const InputFieldWithLabel({
    this.validator,
    this.maxLines=1,
    this.paddingLeft,
    super.key, required this.label, required this.hint,  this.height=50,this.width=343, this.prefix ,this.suffix, this.paddingBottom=5, required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
         label,
          style: TextStyles.font12GraySemiBold,
        ),
         SizedBox(
          height: 6.h,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 11),
          child: CustomTextField(
            validator: validator,
            prefixWidget: prefix,
            paddingLeft:paddingLeft??10 ,
            paddingBottom: paddingBottom,
            maxLines: maxLines,
            controller:controller,
            onTap: () {},
            suffiWidget: suffix,
            width: width.w,
            height: height.h,
            hintText:hint,
          ),
        ),
      ],
    );
  }
}



