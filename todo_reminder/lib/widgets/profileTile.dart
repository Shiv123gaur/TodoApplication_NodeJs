import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class ProfileTile extends StatefulWidget {
  ProfileTile({super.key,required this.stringData,required this.iconData,required this.iconsColorData});
  final String stringData;
 final IconData iconData;
 final Color iconsColorData;
  @override
  State<ProfileTile> createState() => _ProfileTileState();
}

class _ProfileTileState extends State<ProfileTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 4.h,right: 4.h,top: 4.h),
      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(5.sp),boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.3.sp), // Shadow color with opacity
          spreadRadius: 2.0, // Spread radius
          blurRadius: 10.0.sp, // Blur radius
          offset: Offset(0.0, 8.0.sp), // Offset (vertical and horizontal)
        )
      ]),
      height: 12.w,
      width: double.maxFinite,
      child:ListTile(leading: Icon(widget.iconData,size: 24.sp,color: widget.iconsColorData,),title: Text(widget.stringData,style: GoogleFonts.nunito(fontSize: 17.sp),),) ,
    );
  }
}
