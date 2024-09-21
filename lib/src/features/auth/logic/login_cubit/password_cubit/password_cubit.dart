
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordCubit extends Cubit<bool> {
  PasswordCubit() : super(true);
static PasswordCubit get(BuildContext context)=>BlocProvider.of<PasswordCubit>(context);
  showPassword() =>emit(!state);
 
}