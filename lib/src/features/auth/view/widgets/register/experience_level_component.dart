import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../task/view/widgets/card_component.dart';
import '../../../logic/experience_level_cubit/experience_level_cubit.dart';
import '../../../logic/experience_level_cubit/experience_level_state.dart';
import '../../../logic/register_cubit/register_cubit.dart';


class ExperienceLevelComponent extends StatelessWidget {
  const ExperienceLevelComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExperienceCubit, ExperienceState>(
                                      builder: (context, state) {
                                        return CompositedTransformTarget(
                                          link:
                                              RegisterCubit.get(context).layerLink,
                                          child: CardInfoComponent(
                                            withBorder: true,
                                            bg: Colors.transparent,
                                            gestureKey: ExperienceCubit.get(context)
                                                .cardKey,
                                            widget: Text(
                                              "${state.experienceLevel} Level",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily:
                                                      "DmSans"), // Text color
                                            ),
                                            onTap: () {
                                              ExperienceCubit.get(context)
                                                  .toggleOpen();
                                            },
                                            iconWidget: Icon(
                                              state.isOpen
                                                  ? Icons.expand_less
                                                  : Icons.expand_more,
                                              color: Colors.black54,
                                              size: 36,
                                            ),
                                          ),
                                        );
                                      },
                                    );
  }
}
