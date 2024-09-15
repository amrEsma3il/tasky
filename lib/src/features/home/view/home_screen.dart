import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

import '../../../core/constants/colors.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(body: Center(child: Text("home"),),);
//   }
// }


class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(
        title:  Text("Logo",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 24.sp,fontFamily: "DMSans")),
        actions: [
             IconButton(onPressed: () {
                  
                }, icon: const Icon(Icons.person_outline)),
          IconButton(
            icon:  Icon(Icons.logout,color: AppColor.movee,),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Container(width: Get.width,height: Get.height,color: Colors.white,
        child: Column(
          children: [
             Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(textAlign: TextAlign.left,
                    "My Tasks",
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700,color: AppColor.gray,fontFamily: "DMSans"),
                  ),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 12.w),
              child: Row(
                children: [
                  FilterChip(label:  Text("All",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w400,color: AppColor.gray),), onSelected: (_) {},backgroundColor:AppColor.softMovee ,),
                  const SizedBox(width: 6),
                  FilterChip(label:  Text("Inprogress",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w400,color: AppColor.gray),), onSelected: (_) {},backgroundColor:AppColor.softMovee ,),
                  const SizedBox(width: 6),
                  FilterChip(label:  Text("Waiting",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w400,color: AppColor.gray),), onSelected: (_) {},backgroundColor:AppColor.softMovee ,),
                  const SizedBox(width: 6),
                  FilterChip(label:  Text("Finished",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w400,color: AppColor.gray),), onSelected: (_) {},backgroundColor:AppColor.softMovee ,),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  TaskCard(
                    status: 'Waiting',
                    priority: 'Medium',
                    date: '30/12/2022',
                    progressColor: Colors.pink.shade100,
                  ),
                  TaskCard(
                    status: 'Waiting',
                    priority: 'Low',
                    date: '30/12/2022',
                    progressColor: Colors.pink.shade100,
                  ),
                  TaskCard(
                    status: 'Inprogress',
                    priority: 'High',
                    date: '30/12/2022',
                    progressColor: Colors.blue.shade100,
                  ),
                  TaskCard(
                    status: 'Finished',
                    priority: 'Medium',
                    date: '30/12/2022',
                    progressColor: Colors.green.shade100,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  final String status;
  final String priority;
  final String date;
  final Color progressColor;

  const TaskCard({
    super.key,
    required this.status,
    required this.priority,
    required this.date,
    required this.progressColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [Image.asset('assets/images/grocery_online.png',),],);

    // ListTile(
    //   leading: Image.asset('assets/images/grocery_online.png',),
    //   title:  Text("Grocery Shopping",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16.sp,fontFamily: "DMSans"),),
    //   subtitle: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //        Text("This application is designed for shopping online.",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14.sp,fontFamily: "DMSans",color: AppColor.gray),),
    //       const SizedBox(height: 4),
    //       Row(
    //         children: [
    //           Chip(
    //             label: Text(status),
    //             backgroundColor: progressColor,
    //           ),
    //           const SizedBox(width: 8),
    //           Text(priority),
    //         ],
    //       ),
    //     ],
    //   ),
    //   trailing: Text(date),
    // );
 
  }
}