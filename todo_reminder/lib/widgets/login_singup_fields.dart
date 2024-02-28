import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Fields extends StatelessWidget {

  const Fields({super.key,required this.text,required this.icon,required this.controller});
  final String text;
  final IconData icon;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 3.h,left: 3.h,right: 3.h),
      decoration: BoxDecoration(color: Colors.white ,borderRadius: BorderRadius.circular(6.sp)),
      child:TextField(
        style: TextStyle(fontSize: 15.sp),
        maxLines: 1,
        textAlign: TextAlign.start,
        cursorColor: Colors.black38,
        controller: controller,
      decoration: InputDecoration(
          hintStyle: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w300,color: Colors.black),
        prefixIcon: Icon(icon,size: 15.sp,),
        hintText: text,
        border:InputBorder.none,
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(6.sp),borderSide: BorderSide(color: Colors.white)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(6.sp),borderSide: BorderSide(color: Colors.white))
      ),
      ) ,
    );
  }
}
