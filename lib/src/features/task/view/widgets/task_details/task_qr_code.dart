import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class TaskQrCode extends StatelessWidget {
  final String taskId;
  const TaskQrCode({super.key, required this.taskId});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (Get.width / 11) * 9,
      height: (Get.width / 11) * 9,
      child: PrettyQrView.data(
        data: taskId,
        decoration: const PrettyQrDecoration(),
      ),
    );
  }
}
