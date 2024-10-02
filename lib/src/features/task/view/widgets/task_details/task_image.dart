import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/utilits/services/api/end_points.dart';

class TaskImage extends StatelessWidget {
  final String taskImageUrl;
  const TaskImage({super.key, required this.taskImageUrl});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "${EndPoints.baseUrl}${EndPoints.imagePath}$taskImageUrl",
      fit: BoxFit.fill,
      width: Get.width,
      height: 225.h,
    );
  }
}
