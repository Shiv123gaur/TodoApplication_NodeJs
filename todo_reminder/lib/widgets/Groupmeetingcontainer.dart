import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class GroupMeetingContainter extends StatelessWidget {
   GroupMeetingContainter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.w),
      height:15.h ,width: 24.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.w),
        color: Colors.white
      ),
      child: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Bussiness meet",style: GoogleFonts.akatab(fontSize: 15.sp,color: Colors.black54),),
            Text("Tommorrow | 10:30")
          ],
        ),
      ),
    );
  }
}
