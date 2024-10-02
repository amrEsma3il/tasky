import 'package:flutter/material.dart';

import '../../../data/models/profile_model.dart';
import 'profile_componentinfo.dart';

class ProfileInfoList extends StatelessWidget {
  final ProfileModel userProfile;

  const ProfileInfoList({
    required this.userProfile,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,  // This will prevent the Column from expanding to take all available space
      children: [
        ProfileComponentInfo(
          title: "NAME",
          info: userProfile.displayName,
        ),
        ProfileComponentInfo(
          title: "Phone",
          info: userProfile.username,
        ),
        ProfileComponentInfo(
          title: "Level",
          info: userProfile.level,
        ),
        ProfileComponentInfo(
          title: "Years of experience",
          info: userProfile.experienceYears.toString(),
        ),
        ProfileComponentInfo(
          title: "Location",
          info: userProfile.address,
        ),
      ],
    );
  }
}
