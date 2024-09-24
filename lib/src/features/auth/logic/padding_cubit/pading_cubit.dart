import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaddingCubit extends Cubit<double> {
  PaddingCubit() : super(14.5);
static PaddingCubit get(BuildContext context)=>BlocProvider.of<PaddingCubit>(context);

  changePadding(double paddingTop) =>emit(paddingTop);
 
}