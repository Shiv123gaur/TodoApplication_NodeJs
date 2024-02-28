import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_reminder/constants/colors.dart';
import 'package:todo_reminder/controllers/taskController.dart';
import 'package:todo_reminder/models/Task.dart';

class AppBottomSheet extends StatefulWidget {
  const AppBottomSheet({super.key});

  @override
  State<AppBottomSheet> createState() => _AppBottomSheetState();
}

TextEditingController taskTitle = TextEditingController();
TextEditingController description = TextEditingController();
late DateTime date;
late TimeOfDay time;

Future<void> _selectDate(BuildContext context) async {
  DateTime? selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 2));
  if (selected != null) {
    date = selected;
    Get.find<TaskController>().selectedDatetime = selected;
  }
}

_selectTime(BuildContext context)async{
  TimeOfDay? selected = await showTimePicker(context: context, initialTime: TimeOfDay.now());
  time = selected!;
  Get.find<TaskController>().setcurrentTime = selected;
}

 _addTask()async{
     if(taskTitle.text == "" || description.text=="" || date==null || time==null){
        Get.snackbar("Task not added", "Fill all the fields");
     }else{
       DateTime combined = DateTime(
         date.year,
         date.month,
         date.day,
         time.hour,
         time.minute
       );
       await Get.find<TaskController>().AddTask(taskTitle.text, description.text, combined);
     }
 }

class _AppBottomSheetState extends State<AppBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: GetBuilder<TaskController>(builder: (taskController){
        return Container(
          height: 70.h,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(3.h),
                  topLeft: Radius.circular(3.h))),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(5.w),
                decoration: BoxDecoration(
                    color: Colors.lightBlue[900],
                    borderRadius: BorderRadius.circular(3.sp)),
                child: TextField(
                  style: TextStyle(fontSize: 2.h, color: Colors.white),
                  controller: taskTitle,
                  textAlign: TextAlign.start,
                  cursorColor: Colors.white,
                  enableSuggestions: false,
                  decoration: InputDecoration(
                      hintText: "Task title",
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(
                        Icons.check_box_outlined,
                        color: Colors.white,
                      ),
                      border: InputBorder.none),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5.w),
                height: 10.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.sp),
                    color: Colors.lightBlue[900]),
                child: TextField(
                  controller: description,
                  enableSuggestions: false,
                  cursorColor: Colors.white,
                  maxLines: 2,
                  decoration: InputDecoration(
                      label: Row(
                        children: [
                          Icon(
                            Icons.description,
                            color: Colors.white,
                            size: 15.sp,
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          Text(
                            "Description",
                            style: TextStyle(
                                color: Colors.grey, fontSize: 15.sp),
                          ),
                        ],
                      ),
                      contentPadding: EdgeInsets.all(2.w),
                      border: InputBorder.none),
                  style: TextStyle(fontSize: 2.h, color: Colors.white),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 5.w, right: 5.w),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          _selectDate(context);
                        },
                        child: Container(
                          padding: EdgeInsets.only(left: 3.sp, right: 3.sp),
                          decoration: BoxDecoration(
                              color: Colors.lightBlue[900],
                              borderRadius: BorderRadius.circular(3.sp)),
                          height: 6.h,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.date_range,
                                  color: Colors.white,
                                  size: 6.w,
                                ),
                                SizedBox(
                                  width: 5.sp,
                                ),
                                Text(
                                  "${DateFormat("yyyy-MM-dd").format(taskController.selectedDateTime)}",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 15.sp),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.h,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          _selectTime(context);
                        },
                        child: Container(
                          padding: EdgeInsets.only(left: 3.sp, right: 3.sp),
                          decoration: BoxDecoration(
                              color: Colors.lightBlue[900],
                              borderRadius: BorderRadius.circular(3.sp)),
                          height: 6.h,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.timer,
                                  color: Colors.white,
                                  size: 6.w,
                                ),
                                SizedBox(
                                  width: 5.sp,
                                ),
                                Text(
                                  "${taskController.getcurrentTime.format(context)}",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 15.sp),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 5.h,),
              taskController.isloading?CircularProgressIndicator():
              Container(
                child: Row(children: [
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 5.w, right: 5.w),
                        height: 6.h,
                        decoration: BoxDecoration(color:Colors.white,border: Border.all(color: Colors.blue,width: 1.w) ,borderRadius: BorderRadius.circular(5.w)),
                        child: Center(child: Text("Cancel",style: TextStyle(fontSize: 20.sp),)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: ()async{
                        await _addTask();
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 5.w, right: 5.w),
                        height: 6.h,
                        decoration: BoxDecoration(color:Colors.lightBlue,borderRadius: BorderRadius.circular(5.w) ),
                        child: Center(child: Text("Create",style: TextStyle(color: Colors.white,fontSize:20.sp ),)),
                      ),
                    ),
                  )
                ],),
              ),
            ],
          ),
        );
      },),
    );
  }
}
