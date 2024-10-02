import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/utilits/functions/toast_message.dart';

class ImagePickedCubit extends Cubit<File?> {
  final ImagePicker imagePicker;
 static File? imageFile;
static ImagePickedCubit get(BuildContext context)=>BlocProvider.of(context);
  ImagePickedCubit(this.imagePicker) : super(null);

  Future<void> pickImage() async {
    try {
      final pickedFile =
          await imagePicker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        imageFile = File(pickedFile.path);
        log("image name =>   $imageFile");
        emit(imageFile); // Emit the selected image file
      } else {
        emit(null);
      }
    } on FileSystemException catch (e) {
      showToast(e.message, AppColor.softMovee);
      emit(null);
    } catch (e) {
      showToast(e.toString(), AppColor.softMovee);
      emit(null);
    }
  }

  clearImage(){
  emit(null);
}
}

