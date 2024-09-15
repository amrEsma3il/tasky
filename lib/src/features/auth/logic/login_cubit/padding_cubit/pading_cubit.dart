import 'package:flutter_bloc/flutter_bloc.dart';

class PaddingCubit extends Cubit<double> {
  PaddingCubit() : super(14.5);

  changePadding(double paddingTop) =>emit(paddingTop);
 
}