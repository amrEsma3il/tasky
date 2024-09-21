import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'priority_state.dart';

class PriorityCubit extends Cubit<PriorityState> {
  PriorityCubit() : super(PriorityState.initial());
 static String priority="Low";
static List<String> priorityList=["Low","Medium","High"];

final GlobalKey cardKey = GlobalKey();
  static PriorityCubit get(BuildContext context)=>BlocProvider.of(context);

  void toggleOpen() {
    emit(state.copyWith(isOpen: !state.isOpen));
  }


  void closeMenu() {
    emit(state.copyWith(isOpen: !state.isOpen));
  }


  void setPriority(String privilege) {
    priority=privilege;
    emit(state.copyWith(priority: priority,isOpen: false));
  }


   bool checkIfTapIsInsideContainer(TapUpDetails details) {
    // Get the RenderBox of the container
    final RenderBox renderBox =
      cardKey.currentContext?.findRenderObject() as RenderBox;

    // Get the position and size of the container
    final Offset containerPosition = renderBox.localToGlobal(Offset.zero);
    final Size containerSize = renderBox.size;

    // Get the tapped position
    final Offset tapPosition = details.globalPosition;

    // Check if the tap is inside the container's boundaries
    if (tapPosition.dx >= containerPosition.dx &&
        tapPosition.dx <= containerPosition.dx + containerSize.width &&
        tapPosition.dy >= containerPosition.dy &&
        tapPosition.dy <= containerPosition.dy + containerSize.height) {
    return true;
    } else {
      // The tap is outside the container
     return false;
    }
  }
}