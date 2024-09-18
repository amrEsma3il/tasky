import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/colors.dart';
import '../../data/models/task_model.dart';
import '../screens/task_page.dart';
import 'priority_component.dart';
import 'status_component.dart';

class TaskCard extends StatelessWidget {
  final Task task;

  const TaskCard({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return Container(margin: EdgeInsets.only(bottom: 25.h),
    width: Get.width,
      child: Row(crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            //TODO:add image network return from response
            'assets/images/grocery_online.png',
            width:64.w ,height: 64.h,
          ),
          SizedBox(width: 1.6.w,),
          SizedBox(
            width: 216.w,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 156.w,
                      child: Text(
                       task.title,
                        maxLines: 1,
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w700,
                            fontSize: 16.sp,
                            fontFamily: "DMSans"),
                      ),
                    ),
                    StatusComponent(
                      status: task.status,
                    ),
                  ],
                ),
             SizedBox(height: 2.h,),
             
                SizedBox(
                    width: 220.w,
                
                   
                    child: Text(
                      'This application is designed for super shops. By using this application they can enlist all their products in one place and can deliver. Customers will get a one-stop solution for their daily shopping.',
                      maxLines: 1,
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: AppColor.gray,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400),
                    )),
                                 SizedBox(height: 2.h,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PriorityComponent(
                      priority: task.priority,
                    ),
                    Text(DateFormat('dd/MM/yyyy').format(task.createdAt),style:TextStyle(
                       
                          color: AppColor.gray,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400))
                  ],
                )
              ],
            ),
          ),
          IconButton(
              onPressed: () {
                //ToDo:menu => delete , edit
              },
              icon: const Icon(Icons.more_vert))
        ],
      ),
    );
  }
}