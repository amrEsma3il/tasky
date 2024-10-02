import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../logic/profile_cubit/profile_cubit.dart';
import '../../logic/profile_cubit/profile_state.dart';
import '../widgets/profile/profile_app_bar.dart';
import '../widgets/profile/profile_info_list.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            width: Get.width,
            height: Get.height,
            padding: EdgeInsets.fromLTRB(12.w, 5.h, 12.w, 5.h),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ProfileAppBar(),
                const SizedBox(height: 16),
                BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                    if (state is ProfileInitial || state is ProfileLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is ProfileFailure) {
                      return Center(child: Text(state.error));
                    } else if (state is ProfileSuccess) {
                      return ProfileInfoList(userProfile: state.userProfile);
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ],
            )),
      ),
    );
  }
}
