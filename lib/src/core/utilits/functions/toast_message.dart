import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../constants/colors.dart';


showToast(String toastMsg, Color bg)=>Fluttertoast.showToast( 
                msg: toastMsg, 
                toastLength: Toast.LENGTH_LONG, 
                gravity: ToastGravity.BOTTOM, 
                timeInSecForIosWeb: 5, 
                backgroundColor: AppColor.movee.withOpacity(0.5), 
                textColor: Colors.white, 
                fontSize: 16.0);