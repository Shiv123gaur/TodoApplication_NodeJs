import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class PageViewContainer extends StatelessWidget {
   PageViewContainer({super.key,required this.imageUrl,required this.text});
   final String imageUrl;
   final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.all(0.5.h),
            height: 40.h,
            child: Image.asset(imageUrl)),
        Container(
          height: 30.h,
          width: 40.h,
          child: Text(text,
              textAlign: TextAlign.center,
              style: GoogleFonts.nunito(
                  color: Colors.white,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w500)
          ),
        ),

      ],
    );
  }
}


