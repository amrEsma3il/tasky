import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../service_locator.dart' as di;
import '../../../../../config/routing/app_routes_info/app_routes_name.dart';
import '../../../../../core/utilits/widgets/cutom_button.dart';
import '../../../../task/logic/task_cubit/task_cubit.dart';
import '../../../logic/login_cubit/login_cubit.dart';
import '../text_with_link_component.dart';

class LoginActions extends StatelessWidget {
  const LoginActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
   padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 0),      child: Column(
        children: [
          SizedBox(height: 38.h),
          CustomButton(
            width: 326.w,
            onPressed: () async {
              await di.serviceLocator<LoginCubit>().login(
                phone: LoginCubit.get(context).phoneNoController.value.countryCode.split("").last.toString() +
                       LoginCubit.get(context).phoneNoController.value.nsn,
                password: LoginCubit.get(context).passwordController.text,
              );
              if (!context.mounted) return;
              TaskCubit.get(context).fetchTodos();
            },
            text: "Sign In",
          ),
          SizedBox(height: 20.h),
          TextWithLink(
            txt: "Didn't have any account? ",
            link: 'Sign Up here',
            onTap: () {
              Get.offNamed(AppRouteName.register);
            },
          ),
          SizedBox(height: 13.h),
        ],
      ),
    );
  }
}
