import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../service_locator.dart' as di;
import '../../../../core/constants/images.dart';
import '../../../../core/utilits/widgets/cutom_button.dart';
import '../../logic/onboarding_cubit/onboarding_cubit.dart';

class OnboardingButtonComponent extends StatelessWidget {
  const OnboardingButtonComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 0),
      child: CustomButton(
        width: 326.w,
        onPressed: () {
          di.serviceLocator<OnboardingCubit>().navigateEvent();
        },
        text: "Let’s Start",
        icon: AppImages.arrowLeft,
      ),
    );
  }
}
