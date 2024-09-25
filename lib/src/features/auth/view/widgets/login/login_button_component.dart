import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../service_locator.dart' as di;
import '../../../../../core/utilits/widgets/cutom_button.dart';
import '../../../../task/logic/task_cubit/task_cubit.dart';
import '../../../logic/login_cubit/login_cubit.dart';


class LoginButtonComponent extends StatelessWidget {
  const LoginButtonComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      width: 326.w,
      onPressed: () async {
        await di.serviceLocator<LoginCubit>().login(
          phone: LoginCubit.get(context).phoneNoController.value.countryCode
              .split("").last +
              LoginCubit.get(context).phoneNoController.value.nsn,
          password: LoginCubit.get(context).passwordController.text,
        );
        if (!context.mounted) return;
        TaskCubit.get(context).fetchTodos();
      },
      text: "Sign In",
    );
  }
}

