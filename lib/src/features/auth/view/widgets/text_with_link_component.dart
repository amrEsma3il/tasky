import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors.dart';

class TextWithLink extends StatelessWidget {

  final String txt,link;
  final void Function()? onTap;
  const TextWithLink({super.key, required this.txt, required this.link, this.onTap});

 
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style:  TextStyle(fontSize: 14.sp, color: Colors.black),
        children: <TextSpan>[
           TextSpan(text: txt),
          TextSpan(
            text: link,
            style:  TextStyle(
              color: AppColor.movee,
              fontWeight: FontWeight.bold, 
              decoration: TextDecoration.underline, 
            ),
            recognizer: TapGestureRecognizer()..onTap =onTap,
          ),
        ],
      ),
    );
  }
}