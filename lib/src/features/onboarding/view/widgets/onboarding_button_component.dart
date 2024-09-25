

import 'package:flutter/material.dart';
import '../../../../../service_locator.dart' as di;
import '../../../../core/constants/images.dart';
import '../../../../core/utilits/widgets/cutom_button.dart';
import '../../logic/onboarding_cubit/onboarding_cubit.dart';

class OnboardingButtonComponent extends StatelessWidget {
  const OnboardingButtonComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () {
        di.serviceLocator<OnboardingCubit>().navigateEvent();
      },
      text: "Let’s Start",
      icon: AppImages.arrowLeft,
    );
  }
}
