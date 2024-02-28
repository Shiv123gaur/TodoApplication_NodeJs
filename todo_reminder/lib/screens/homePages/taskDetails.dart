import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_reminder/constants/colors.dart';
import 'package:todo_reminder/controllers/taskController.dart';
import 'package:todo_reminder/widgets/Tasktile.dart';
import 'package:todo_reminder/widgets/bottomsheet.dart';

import '../../models/Task.dart';

class TaskDetailPage extends StatefulWidget {
  const TaskDetailPage({super.key});

  @override
  State<TaskDetailPage> createState() => _TaskDetailPageState();
}

class _TaskDetailPageState extends State<TaskDetailPage> {
  @override

  void initialization()async{
    await Get.find<TaskController>().GetAllTasks();
  }

  void initState() {
    initialization();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().mainColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.5.w,vertical: 2.5.w),
            child: GetBuilder<TaskController>(builder: (taskController){
              List<Task> tasks = <Task>[];
              tasks = taskController.getallTasks;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Container(
                          padding: EdgeInsets.all(2.5.w),
                          height: 6.h,
                          decoration: BoxDecoration(
                            color: Colors.cyan[800],
                            borderRadius: BorderRadius.circular(4.w),
                          ),
                          child: TextField(
                            enableSuggestions: false,
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                              prefixStyle: TextStyle(color: Colors.white54),
                              prefixIcon: Icon(Icons.search),
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.white54,),
                              hintText: "Search",
                            ),
                            style: TextStyle(fontSize: 2.h),
                          ),
                        ),
                      ),
                      SizedBox(width: 4.w,),
                      Expanded(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.all(1.w),
                            decoration: BoxDecoration(color: Colors.cyan[800],borderRadius: BorderRadius.circular(4.w),),
                            height: 6.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.sort,color: Colors.white54,),
                                Text("Sort",style: TextStyle(color: Colors.white54,fontSize: 2.h),),
                                Icon(Icons.keyboard_arrow_down,color: Colors.white54,)
                              ],),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),

                  Text("Tasks List",style: GoogleFonts.cabin(color: Colors.white54,fontSize: 20.sp),),
                  SizedBox(height: 2.5.h,),
                  Container(
                    height: 55.h,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount:taskController.getallTasks.length,
                        itemBuilder: (contex,index){
                          return Padding(
                            padding: EdgeInsets.all(2.h),
                            child: TaskTile(title: tasks[index].title!, description: tasks[index].description!, taskCompleted: tasks[index].status!, duedate: tasks[index].due_date!),
                          );
                        }),
                  ),
                  SizedBox(height: 5.w,),
                  Align(alignment: Alignment.centerRight,
                      child: Container(
                        margin: EdgeInsets.only(right: 5.w),
                        child: FloatingActionButton(
                          hoverColor: Colors.white,
                          backgroundColor: Colors.lightBlue[400],onPressed: (){
                          showModalBottomSheet(
                              backgroundColor: Color(0xff08264E),
                              context: context, builder: (BuildContext context){
                            return AppBottomSheet();
                          });
                        },child: Icon(Icons.add,color: Colors.white,),),
                      ))
                ],
              );
            },),
          ),
        ),
      ),
    );
  }
}
