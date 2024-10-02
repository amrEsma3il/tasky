import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class ImageNameCubit extends Cubit<String?> {
  static String? imageName;

  static ImageNameCubit get(BuildContext context) => BlocProvider.of(context);

  ImageNameCubit() : super(null);

  Future<void> setImageName(String imageName) async {
  emit(imageName);
  }

  void clearImage() {
    emit(null); 
  }
}
