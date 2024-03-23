import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_reminder/constants/colors.dart';
import 'package:todo_reminder/controllers/AuthController.dart';
import 'package:todo_reminder/controllers/taskController.dart';
import 'package:todo_reminder/models/Task.dart';
import 'package:todo_reminder/models/userProfile.dart';
import 'package:todo_reminder/screens/homePages/mainpage.dart';
import 'package:todo_reminder/widgets/Groupmeetingcontainer.dart';
import 'package:todo_reminder/widgets/Tasktile.dart';

import '../../controllers/mainPageController.dart';

class MainHomePage extends StatefulWidget {
 final Userr user;
  const MainHomePage({super.key,required this.user});
  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

  Future<void> refreshReq()async{
       await Get.find<TaskController>().GetAllTasks();
  }

class _MainHomePageState extends State<MainHomePage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskController>(builder: (taskController) {
      List<Task> CompletedTasks = [];
                CompletedTasks = taskController.completedTasks;
      List<Task> PendingTasks = [];
                PendingTasks = taskController.pendingTasks;
      return taskController.isloading
          ? Center(
        child: Container(height: double.maxFinite,
            color: AppColors().mainColor,child: Center(child: CircularProgressIndicator())),
      )
          : RefreshIndicator(child:
      Scaffold(
        backgroundColor:AppColors().mainColor,
        body: SafeArea(
          child: Container(
            child: Column(
              children: [
                Container(
                  padding:
                  EdgeInsets.only(left: 5.w, right: 5.w, top: 5.w),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(5.w),
                          child: Container(height: 8.h,width: 8.h,
                              child: Image.network(widget.user.profile!,height: 5.h,)),),
                      SizedBox(
                        width: 2.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                         widget.user.name!,
                            style: GoogleFonts.lato(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          Text(
                           widget.user.email!,
                            style: GoogleFonts.nunito(
                                fontSize: 12.sp, color: Colors.black87),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 18.w,
                      ),
                      InkWell(
                          onTap: () {

                          },
                          child: Icon(
                            Icons.notifications,
                            color: Colors.white,
                            size: 4.h,
                          ))
                    ],
                  ),
                ),
                Container(
                  height: 15.h,
                  child: ListView.builder(
                      padding: EdgeInsets.all(3.w),
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return GroupMeetingContainter();
                      }),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: 5.w, horizontal: 5.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Incomplete Tasks",
                        style: GoogleFonts.nunito(
                            fontSize: 15.sp, color: Colors.white),
                      ),
                      SizedBox(
                        height: 2.5.h,
                      ),
                      Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.w),color: Colors.lightBlueAccent[400],),
                        height: 17.h,
                        child: taskController.pendingTasks.length>0?ListView.builder(
                            scrollDirection: Axis.vertical,
                            padding: EdgeInsets.all(4.w),
                            itemCount: PendingTasks.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                  padding: EdgeInsets.all(1.w),
                                  child: TaskTile(
                                    title: PendingTasks[index].title!,
                                    description:
                                    PendingTasks[index].description!,
                                    taskCompleted: PendingTasks[index].status!,
                                    duedate:
                                    PendingTasks[index].due_date!,
                                  ));
                            }):Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.w),color: Colors.lightBlueAccent,),
                          alignment: Alignment.topCenter,
                          padding: EdgeInsets.zero,
                          child: Center(child: Lottie.asset("assets/lottie/noIncopleTask.json")),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: 5.w, horizontal: 5.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Completed Tasks",
                        style: GoogleFonts.nunito(
                            fontSize: 15.sp, color: Colors.white),
                      ),
                      SizedBox(height: 2.h,),
                      Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.w),color: Colors.lightBlueAccent[400],),
                        height: 15.h,
                        child: taskController.completedTasks.length >
                            0
                            ? ListView.builder(
                            padding: EdgeInsets.all(4.w),
                            itemCount: CompletedTasks.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:EdgeInsets.all(1.w),
                                child: TaskTile(
                                  title: CompletedTasks[index].title!,
                                  description: CompletedTasks[index]
                                      .description!,
                                  taskCompleted:
                                  CompletedTasks[index].status!,
                                  duedate:
                                  CompletedTasks[index].due_date!,
                                ),
                              );
                            })
                            : Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.w),color: Colors.lightBlueAccent,),
                          alignment: Alignment.topCenter,
                          padding: EdgeInsets.zero,
                          child: Center(
                            child: Lottie.asset("assets/lottie/emptyTask2.json"
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ), onRefresh:refreshReq );
    });
  }
}
