import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'dart:math' as math;
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/images.dart';
import '../../../../core/utilits/services/api/end_points.dart';
import '../../data/models/task_model.dart';
import '../widgets/card_component.dart';

class TaskDetails extends StatelessWidget {
  final Task task;
  const TaskDetails({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
              width: Get.width,
              padding: EdgeInsets.fromLTRB(12.w, 5.h, 12.w, 5.h),
              color: Colors.white,
              // height: Get.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              icon: Transform.rotate(
                                  angle: math.pi,
                                  child: Image.asset(
                                    AppImages.arrowLeft,
                                    color: Colors.black,
                                    width: 24.w,
                                    height: 24.h,
                                  )), // Change icon color based on theme
                              onPressed: () => Navigator.pop(context),
                            ),
                            SizedBox(
                              width: 1.5.w,
                            ),
                            Text(
                              'Task Details',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700), // Text color
                            ),
                          ],
                        ),
                        IconButton(
                          icon: const Icon(Icons.more_vert,
                              color: Colors.black), // Menu icon
                          onPressed: () {
                            // Handle menu action
                          },
                        )
                      ]),
                  const SizedBox(
                    height: 3.5,
                  ),
               Image.network(
                
                   "${EndPoints.baseUrl}${EndPoints.imagePath}${task.image}",
                    fit: BoxFit.fill,
                    width: Get.width,
                    height: 225.h,
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  Text(
                    task.title,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700), // Text color
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    task.desc,
                    softWrap: true,
                    style: TextStyle(
                        height: 1.5,
                        color: AppColor.gray,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400), // Text color
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  Column(
                    children: [
                      CardInfoComponent(
                        widget: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'End Date',
                              style: TextStyle(
                                  color: AppColor.gray,
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w400), // Text color
                            ),
                            Text(
                              DateFormat('d MMMM, y').format(task.updatedAt),
                              style: TextStyle(
                                  // height:2,
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400), // Text color
                            ),
                          ],
                        ),
                        onTap: () {},
                        iconWidget: Icon(
                          Icons.calendar_month_rounded,
                          color: AppColor.movee,
                        ),
                      ),
                      CardInfoComponent(
                        widget: Text(
                          task.status,
                          style: TextStyle(
                              color: AppColor.movee,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              fontFamily: "DmSans"), // Text color
                        ),
                        onTap: () {},
                        iconWidget: Icon(
                          Icons.arrow_drop_down,
                          color: AppColor.movee,
                          size: 36,
                        ),
                      ),
                      CardInfoComponent(
                        widget: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.flag_outlined,
                              color: AppColor.movee,
                              size: 30,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              "${task.priority} Priority",
                              style: TextStyle(
                                  color: AppColor.movee,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "DmSans"), // Text color
                            ),
                          ],
                        ),
                        onTap: () {},
                        iconWidget: Icon(
                          Icons.arrow_drop_down,
                          color: AppColor.movee,
                          size: 36,
                        ),
                      ),
                    SizedBox(height: 12.h,),
        
                    SizedBox(width: (Get.width/11)*9,height:(Get.width/11)*9,
                    child: PrettyQrView.data(
          data: task.id,
          decoration: const PrettyQrDecoration(
            // image: PrettyQrDecorationImage(
            //   image: AssetImage('images/flutter.png'),
            // ),
          ),
        ),),
        SizedBox(height: 16.h,),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
