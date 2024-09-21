import 'package:equatable/equatable.dart';

class PriorityState extends Equatable {
  final bool isOpen;
  final String priority;

  const PriorityState({required this.isOpen , required this.priority  });


factory PriorityState.initial()=> const PriorityState(isOpen: false,priority: "Low");


  PriorityState copyWith({bool? isOpen, String? priority}) {
    return PriorityState(
      isOpen: isOpen ?? this.isOpen,
      priority: priority ?? this.priority,
    );
  }


    @override
  List<Object?> get props => [isOpen, priority];
}
