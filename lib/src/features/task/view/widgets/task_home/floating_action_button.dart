import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

import '../../../../../config/routing/app_routes_info/app_routes_name.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/errors/network_exceptions.dart';
import '../../../../../core/utilits/functions/toast_message.dart';
import '../../../logic/task_datails_cubit/task_datails_cubit.dart';

class TaskFloatingActionButtons extends StatelessWidget {
  const TaskFloatingActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 100, // Adjust the spacing from the bottom as required
          right: 30, // Adjust the spacing from the right as required
          child: FloatingActionButton(
            shape: const CircleBorder(),
            heroTag: "qrcode",
            onPressed: () async {
              FlutterBarcodeScanner.scanBarcode(
                      "#ff6666", "Cancel", true, ScanMode.QR)
                  .then(
                (value) {
                  TaskDatailsCubit.get(context).fetchOneTask(value);
                },
              ).catchError((err) {
                showToast(
                    NetworkExceptions.getErrorMessage(
                        NetworkExceptions.getDioException(err)),
                    AppColor.softMovee);
              });
            },
            backgroundColor: AppColor.softMovee,
            child: Icon(
              Icons.qr_code,
              color: AppColor.movee,
            ),
          ),
        ),
        Positioned(
          bottom: 30, // Adjust the spacing from the bottom as required
          right: 30, // Adjust the spacing from the right as required
          child: FloatingActionButton(
            shape: const CircleBorder(),
            heroTag: "addnote",
            onPressed: () {
              Get.toNamed(AppRouteName.addTask);
            },
            backgroundColor: AppColor.movee,
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
