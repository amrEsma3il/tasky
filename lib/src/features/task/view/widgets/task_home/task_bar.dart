import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../auth/logic/logout_cubit/log_out_cubit.dart';
import '../../../../auth/logic/profile_cubit/profile_cubit.dart';

class TaskAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TaskAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "Logo",
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 24.sp,
          fontFamily: "DMSans",
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            ProfileCubit.get(context).fetchUserProfile();
          },
          icon: const Icon(Icons.person_outline),
        ),
        IconButton(
          icon: Icon(Icons.logout, color: AppColor.movee),
          onPressed: () {
            LogoutCubit.get(context).logOut();
          },
        ),
      ],
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.black),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
