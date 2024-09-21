import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:io';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/utilits/services/api/end_points.dart';
import '../../../../../core/utilits/widgets/dotted_border.dart';
import '../../../logic/add_task/image_cubit.dart';
import '../../../logic/add_task/image_task_cubit.dart';

class ImagePickerWidget extends StatelessWidget {
  final String? imageTaskName;
  const ImagePickerWidget({super.key, this.imageTaskName});

  @override
  Widget build(BuildContext context) {
    if (imageTaskName != null) {
      ImageNameCubit.get(context).setImageName(imageTaskName!);
    }

    return Center(
      child: BlocBuilder<ImageNameCubit, String?>(
        builder: (context, imageNameState) {
          return SizedBox(
            width: Get.width,
            child: BlocBuilder<ImagePickedCubit, File?>(
              builder: (context, imageFile) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //
                    imageNameState != null
                        ? Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.network(
                                '${EndPoints.baseUrl}${EndPoints.imagePath}$imageNameState',
                                          width: Get.width,
                    height: 200.h,
                                 fit: BoxFit.fill,
                              ),
                              Container(
                                 width: Get.width,
                    height: 200.h,
                                color: Colors.black38,
                              ),
                              IconButton(
                                  onPressed: () {
                                    context
                                        .read<ImageNameCubit>()
                                        .clearImage();
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    size: 55,
                                    color: AppColor.gray,
                                  ))
                            ],
                          )
                        :
                        //

                        imageFile != null
                            ? Stack(
                                alignment: Alignment.center,
                                children: [
                                  Image.file(
                                    imageFile,
                                                 width: Get.width,
                    height: 200.h,
                                       fit: BoxFit.fill,
                                  ),
                                  Container(
                                             width: Get.width,
                    height: 200.h,
                                    color: Colors.black38,
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        context
                                            .read<ImagePickedCubit>()
                                            .clearImage();
                                      },
                                      icon: const Icon(
                                        Icons.delete_outline,
                                        size: 55,
                                        color: AppColor.gray,
                                      ))
                                ],
                              )
                            : GestureDetector(
                                onTap: () => context
                                    .read<ImagePickedCubit>()
                                    .pickImage(),
                                child: DottedBorderContainer(
                                  borderColor: AppColor.movee,
                                  gap: 4.0,
                                  strokeWidth: 2.0,
                                  borderRadius: 12.r,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColor.movee,
                                          style: BorderStyle.none),
                                      borderRadius: BorderRadius.circular(14.r),
                                    ),
                                    padding: EdgeInsets.only(
                                        top: 14.h, bottom: 14.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.add_photo_alternate_outlined,
                                          color: AppColor.movee,
                                          size: 27,
                                        ),
                                        SizedBox(width: 8.w),
                                        Text(
                                          "Add Img",
                                          style: TextStyle(
                                            color: AppColor.movee,
                                            fontSize: 19.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
