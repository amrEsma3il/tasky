import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../config/routing/app_routes_info/app_routes_name.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/utilits/services/api/end_points.dart';
import '../../data/models/task_model.dart';
import '../../logic/delete_cubit/delete_task_cubit.dart';
import 'priority_component.dart';
import 'status_component.dart';

class TaskCard extends StatelessWidget {
  final Task task;
final int index;
  const TaskCard({
    super.key,
    required this.task, required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
         Get.toNamed(AppRouteName.taskDetails,parameters: {"task":jsonEncode(task.toJson())});
      },
      child: Container(margin: EdgeInsets.only(bottom: 25.h),
      width: Get.width,
        child: Row(crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          ClipOval(
  child: Image.network(
                 

    '${EndPoints.baseUrl}${EndPoints.imagePath}${task.image}',
    fit: BoxFit.fill,
    width: 64.w,
    height: 64.h,
  ),
)
,
            SizedBox(width: 3.w,),
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
                        task.desc,
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

            PopupMenuButton<String>(elevation: 2,color: Colors.white,shadowColor: Colors.black,
          onSelected: (String result) {
            switch (result) {
              case 'Edit':
                //TODO:navigate to add update screen
           
             Get.toNamed(AppRouteName.addTask,parameters: {"task":jsonEncode(task.toJson()),"index":index.toString()});
                break;
              case 'Delete':
 DeleteTaskCubit.get(context).deleteTask(task.id, index);
                break;
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
           
             PopupMenuItem<String>(
              value: 'Delete',
              child: Text('Delete',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16.sp),),
            ),

              PopupMenuItem<String>(
              value: 'Edit',
              child: Text('Edit',style:  TextStyle(fontWeight: FontWeight.w500,fontSize: 16.sp,color: AppColor.orange),),
            ),
          ],
          icon: const Icon(Icons.more_vert), // Icon you press to show the menu
        ),
      
            // IconButton(
            //     onPressed: () {
            //       //ToDo:menu => delete , edit
            //     },
            //     icon: const Icon(Icons.more_vert))
          ],
        ),
      ),
    );
  }
}