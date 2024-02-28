import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

class TaskTile extends StatelessWidget {
  final String title;
  final String description;
  final bool taskCompleted;
  final DateTime duedate;
  const TaskTile({super.key,required this.title,required this.description,required this.taskCompleted,required this.duedate});

  @override
  Widget build(BuildContext context) {

    List<String> listOfwords = title.split(" ");
    List<String> limitedWords = listOfwords.take(4).toList();
    String TitleFiltered = limitedWords.join(" ");


    String formatedtime(DateTime time){
      String data =  DateFormat.jm().format(time);
      return data;
    }

    String timeLeft(DateTime timee){
     Duration difference = timee.difference(DateTime.now());
     int differencIndays = difference.inDays;

     if(differencIndays==0){
       return "Today";
     } else if(differencIndays==1){
       return "Tommorow";
     }else if(differencIndays==2){
       return "Day after tomorrow";
     }else{
       return "$differencIndays Days left!";
     }

    }

    return Container(
      padding:EdgeInsets.all(2.5.w),
      height: 8.h,
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(2.w)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Align(alignment: Alignment.centerLeft,
            child: taskCompleted?
            Row(children: [
              FaIcon(FontAwesomeIcons.solidSquareCheck,size: 10.w,color: Colors.green,),
              SizedBox(width: 2.w,),
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(TitleFiltered,style: GoogleFonts.nunito(fontSize: 16.sp,textStyle: TextStyle(overflow: TextOverflow.ellipsis)),),
                  Text("${timeLeft(duedate)} | ${formatedtime(duedate)}")
                ],)
            ],):
            Row(
              children: [
                FaIcon(FontAwesomeIcons.hourglassStart,size: 10.w,color: Colors.blue,),
                SizedBox(width: 2.w,),
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,style: GoogleFonts.nunito(fontSize: 16.sp),),
                    Text("${timeLeft(duedate)} | ${formatedtime(duedate)}")
                  ],)
              ],
            )
        ),
        Icon(Icons.arrow_forward_ios,size: 8.w,color: Colors.blue,)
      ],),
    );
  }
}
