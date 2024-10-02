import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/theme/text_styles/styles.dart';
import '../../../../../core/constants/colors.dart';
import '../../../logic/add_task/add_task_cubit/add_task_cubit.dart';
import '../../../logic/add_task/priority_cubit/priority_cubit.dart';
import '../../../logic/add_task/priority_cubit/priority_state.dart';
import '../card_component.dart';

class TaskPrioritySelector extends StatelessWidget {
  const TaskPrioritySelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Priority",
          style: TextStyles.font12GraySemiBold,
        ),
        SizedBox(height: 6.h),
        BlocBuilder<PriorityCubit, PriorityState>(
          builder: (context, state) {
            return CompositedTransformTarget(
              link: AddTaskCubit.get(context).layerLink,
              child: CardInfoComponent(
                gestureKey: PriorityCubit.get(context).cardKey,
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.flag_outlined, color: AppColor.movee, size: 30),
                    SizedBox(width: 10.w),
                    Text(
                      "${state.priority} Priority",
                      style: TextStyle(
                        color: AppColor.movee,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: "DmSans",
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  PriorityCubit.get(context).toggleOpen();
                },
                iconWidget: Icon(
                  state.isOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  color: AppColor.movee,
                  size: 36,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
