import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_reminder/constants/colors.dart';
import 'package:todo_reminder/controllers/calenderController.dart';
import 'package:todo_reminder/widgets/addEvent.dart';

class MangeTimePage extends StatefulWidget {
  const MangeTimePage({super.key});
  @override
  State<MangeTimePage> createState() => _MangeTimePageState();
}

class _MangeTimePageState extends State<MangeTimePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<CalenderController>(
        builder: (calenderController) {
          return Container(
            decoration: BoxDecoration(gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.topCenter,
                colors: [
                  AppColors().mainColor,
                  Colors.blue
                ]
            ),),
            height: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TableCalendar(
                  firstDay: DateTime.now(),
                  headerStyle: HeaderStyle(
                      titleCentered: true, formatButtonVisible: false),
                  lastDay: DateTime(2030),
                  focusedDay: calenderController.focusedDate,
                  selectedDayPredicate: (date) {
                    return isSameDay(calenderController.selectedDate, date);
                  },
                  onPageChanged: (date) {
                    calenderController.focusedDate = date;
                  },
                  eventLoader: (date) {
                    return calenderController.Events[date] ?? [];
                  },
                  onDaySelected: (selectedDate, focusedDate) {
                    calenderController.selectedDate = selectedDate;
                    calenderController.focusedDate = focusedDate;
                    calenderController.GetEvents(
                        calenderController.selectedDate
                    );
                  },
                  calendarStyle: CalendarStyle(
                      defaultTextStyle: TextStyle(color: Colors.white),
                      weekendTextStyle: TextStyle(color: Colors.amber),
                      holidayTextStyle: TextStyle(color: Colors.red)),
                ),
                SizedBox(
                  height: 3.h,
                ),
                ElevatedButton(
                    onPressed: () {
                      Get.to(() => showAddEventDialog(
                            selectedDate: calenderController.selectedDate,
                          ));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.add),
                        SizedBox(
                            width:
                                8), // Adjust spacing between icon and text as needed
                        Text(
                            "Add Event on ${DateFormat('MM/dd/yy').format(calenderController.selectedDate)}"),
                      ],
                    )),
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  height: 25.h,
                  child: ListView.builder(
                      itemCount: calenderController.currentDayevents.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.only(left: 10.w,top: 1.w,bottom: 1.w,right: 10.w),
                          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10.h)),
                          margin: EdgeInsets.all(2.h),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            Container(
                              width: 30.w,
                              child: Text(
                                calenderController
                                    .currentDayevents[index].title!,style: TextStyle(overflow: TextOverflow.ellipsis,fontSize: 15.sp),),
                            ),
                            ElevatedButton(onPressed: (){}, child: Text("Mark done"))
                          ],),
                        );
                      }),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
