import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_reminder/constants/colors.dart';
import 'package:todo_reminder/controllers/AuthController.dart';
import 'package:todo_reminder/widgets/profileTile.dart';

import '../profileScreens/accounts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Center(
            child: Container(
              height: double.maxFinite,
              color: Colors.white,
              child: Container(
                padding: EdgeInsets.all(5.w),
                alignment: Alignment.topLeft,
                // padding: EdgeInsets.all(5.w),
                child: Text(
                  "Your Profile",
                  style: GoogleFonts.nunito(
                    color: Colors.black,
                      fontSize: 25.sp, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Positioned(
              top: 12.h,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.topCenter,
                    colors: [
                      AppColors().mainColor,
                      Colors.blue
                    ]
                  ),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(3.w),
                        topRight: Radius.circular(5.w)),
                    color: AppColors().mainColor),
                height: 100.h,
                width: 100.w,
                child: Column(
                  children: [
                    InkWell(
                      onTap: (){
                        Get.to(()=>AccountSection());
                      },
                        child: ProfileTile(stringData: "Personal Info",iconData: Icons.account_circle_sharp,iconsColorData: Colors.lightBlueAccent,)),
                    InkWell(onTap: ()async{
                      await Get.find<AuthController>().Logout();
                    },
                        child: ProfileTile(stringData: "Logout",iconData: Icons.logout,iconsColorData: Colors.red,))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
