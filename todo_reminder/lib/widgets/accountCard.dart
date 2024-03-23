 import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class AccountCard extends StatefulWidget {
  const AccountCard({super.key,required this.stringg});
  final String stringg;
  @override
  State<AccountCard> createState() => _AccountCardState();
}

class _AccountCardState extends State<AccountCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.sp,right: 20.sp),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3.sp), // Shadow color with opacity
            spreadRadius: 2.0, // Spread radius
            blurRadius: 10.0.sp, // Blur radius
            offset: Offset(0.0, 8.0.sp), // Offset (vertical and horizontal)
          ),
        ],
        borderRadius: BorderRadius.circular(15.w),
      ),
      height: 6.h,width: 70.w,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Align(alignment:Alignment.centerLeft,child: Text(widget.stringg,style: GoogleFonts.nunito(fontSize: 15.sp),)),
        Icon(Icons.edit),
      ],),
    );
  }
}
