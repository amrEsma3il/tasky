import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'experience_level_state.dart';

class ExperienceCubit extends Cubit<ExperienceState> {
  ExperienceCubit() : super(ExperienceState.initial());
static String experienceLevel="junior";
  static List<String> experienceLevels = ["fresh", "junior", "midLevel", "senior"];
  
  static ExperienceCubit get(BuildContext context) => BlocProvider.of(context);

  final GlobalKey cardKey = GlobalKey();

  void toggleOpen() {
    emit(state.copyWith(isOpen: !state.isOpen));
  }

  void closeMenu() {
    emit(state.copyWith(isOpen: false));
  }

  void setExperienceLevel(String level) {
    experienceLevel=level;
    emit(state.copyWith(experienceLevel: level, isOpen: false));
  }
}
