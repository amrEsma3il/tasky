import 'package:equatable/equatable.dart';

class ExperienceState extends Equatable {
  final bool isOpen;
  final String experienceLevel;

  const ExperienceState({required this.isOpen, required this.experienceLevel});

  // Initial state
  factory ExperienceState.initial() => const ExperienceState(isOpen: false, experienceLevel: "Choose experience");

  // Copy state with changes
  ExperienceState copyWith({bool? isOpen, String? experienceLevel}) {
    return ExperienceState(
      isOpen: isOpen ?? this.isOpen,
      experienceLevel: experienceLevel ?? this.experienceLevel,
    );
  }

  @override
  List<Object?> get props => [isOpen, experienceLevel];
}
