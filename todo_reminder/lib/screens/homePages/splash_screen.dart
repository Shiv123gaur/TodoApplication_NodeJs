import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_reminder/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_reminder/controllers/mainPageController.dart';
import 'package:todo_reminder/screens/authPages/signIn.dart';
import 'package:todo_reminder/screens/authPages/sugnUp.dart';
import 'package:todo_reminder/screens/homePages/MainHomePage.dart';
import 'package:todo_reminder/screens/homePages/guiding_1.dart';
import 'package:todo_reminder/screens/homePages/mainpage.dart';

import '../../controllers/taskController.dart';
import '../../models/userProfile.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SharedPreferences preferences = Get.find<SharedPreferences>();
    Future.delayed(Duration(seconds: 6),()async{
     if(preferences.containsKey("isloggedin")){
       User user = User(email: preferences.getString("email"), name: preferences.getString("name"), profile: preferences.getString("profile-photo"));
       if(preferences.getBool("isloggedin")!){
         TaskController controller = Get.find<TaskController>();
         await controller.GetAllTasks();
         Get.offAll(MainPage(userr: user,));
       }else{
         Get.offAll(()=>SignInPage());
       }
     }else{
       Get.offAll(()=>SignInPage());
     }
    });
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.center,
            child: Column(children: [
              Image.asset(
              "assets/images/Checkmark.png",
              width: 100.w,
              height: 10.h,
            ),
              SizedBox(height: 5.h,),
              Text(
                "Do it !",
                style: GoogleFonts.singleDay(
                    color: Colors.black, fontSize: 50.sp, fontWeight: FontWeight.w900),
              )
            ],)
    )
      ],
    );
  }
}
