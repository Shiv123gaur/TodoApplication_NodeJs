import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class App_Button extends StatelessWidget {
  const App_Button({super.key,required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25.sp,right: 25.sp,top: 25.sp),
      width: double.maxFinite,
      padding: EdgeInsets.all(8.sp),
      decoration: BoxDecoration(color: Colors.lightBlue,borderRadius: BorderRadius.circular(12)),
      child: Center(child: Text(text,style: GoogleFonts.nunito(fontSize: 15.sp),)),
    );
  }
}
