import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../config/routing/app_routes_info/app_routes_name.dart';
import '../text_with_link_component.dart';

class SignUpLinkComponent extends StatelessWidget {
  const SignUpLinkComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return TextWithLink(
      txt: "Didn't have any account? ",
      link: 'Sign Up here',
      onTap: () {
        Get.offNamed(AppRouteName.register);
      },
    );
  }
}
