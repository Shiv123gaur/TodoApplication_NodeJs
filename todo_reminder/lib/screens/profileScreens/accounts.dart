import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_reminder/constants/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_reminder/controllers/profileController.dart';

class AccountSection extends StatefulWidget {
  const AccountSection({super.key});

  @override
  State<AccountSection> createState() => _AccountSectionState();
}

class _AccountSectionState extends State<AccountSection> {
  late File _file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().mainColor,
      body: SafeArea(
        child: GetBuilder<ProfileController>(builder: (profileController){
          return Column(children: [
            Container(
              margin: EdgeInsets.only(top: 10.sp),
              width: double.maxFinite,
              height: 18.h,
              child: Stack(
                children: [
                  Positioned(
                    left: 43.w,
                    child: Container(
                      decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white,),
                      height: 10.h,
                      child: profileController.picked?Image.file(_file,fit: BoxFit.cover,):Image.asset("assets/images/profile.png",fit: BoxFit.cover,),
                    ),
                  ),
                  Positioned(top: 15.w,left:43.w ,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                         backgroundColor: Colors.blue,
                          elevation: 5,
                          shape: CircleBorder(),
                        ),
                        onPressed: ()async{
                              _file = await profileController.PickImage();
                        },
                        child: Icon(Icons.add),))
                ],
              ),
            )
          ],);
        },),
      )
    );
  }
}
