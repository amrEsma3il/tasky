import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeStatusCubit extends Cubit<int> {
  ChangeStatusCubit():super(0);

static ChangeStatusCubit get(BuildContext context)=>BlocProvider.of<ChangeStatusCubit>(context);
  changeStatus(int statusNo){
emit(statusNo);
  }
  
}