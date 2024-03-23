
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_reminder/constants/colors.dart';
import 'package:todo_reminder/controllers/AuthController.dart';
import 'package:todo_reminder/models/userProfile.dart';
import 'package:todo_reminder/screens/authPages/sugnUp.dart';
import 'package:todo_reminder/screens/homePages/mainpage.dart';
import 'package:todo_reminder/widgets/Login_singnUp_button.dart';
import 'package:todo_reminder/widgets/login_singup_fields.dart';

import '../homePages/MainHomePage.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  TextEditingController Emailcontroller = TextEditingController();
  TextEditingController Passwordcontroller = TextEditingController();


  bool checkCred(){
    if(Emailcontroller.text != "" && Passwordcontroller.text != ""){
      return true;
    }else{
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().mainColor,
      body:GetBuilder<AuthController>(builder: (authcontroller){
        return  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/Checkmark.png",height: 10.h,),
            SizedBox(height: 5.h,),
            RichText(
              text: TextSpan(
                  text: "Welcome Back to ",
                  style: GoogleFonts.nunito(fontSize: 20.sp),
                  children: [
                    TextSpan(text: "Do it",style: GoogleFonts.singleDay(
                        color: Colors.black, fontSize: 25.sp, fontWeight: FontWeight.w900))
                  ]
              ),
            ),
            Text("Have an another productive day!",style: GoogleFonts.nobile(color: Colors.white54,fontSize: 10.sp
            ),),
            Fields(
                text: "E-mail", icon: Icons.email, controller: Emailcontroller),
            Fields(
                text: "Password",
                icon: Icons.lock,
                controller: Passwordcontroller),
            InkWell(
              onTap: (){
                Get.to(()=>SignUpPage());
              },
              child: Container(
                  padding: EdgeInsets.only(right: 20.sp,top: 11.sp),
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot Password?",
                    style: GoogleFonts.nunito(fontSize: 10.sp, color: Colors.white),
                  )),
            ),
            InkWell(
                onTap: ()async{
                  var ans =  checkCred();
                  if(ans){
                    await authcontroller.LoginUser(Emailcontroller.text,Passwordcontroller.text);
                    if(authcontroller.userloggedIn){
                      Userr user = authcontroller.user;
                      Get.to(()=>MainPage(userr: user,));
                    }else{
                      Get.snackbar(authcontroller.message, "try again",duration: Duration(seconds: 3),snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.blue,colorText: Colors.white);
                    }
                  }else{
                    Get.snackbar(
                        "Invalid Input", "Try filling all fields",duration: Duration(seconds: 3),snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.blue,colorText: Colors.white);
                  }
                },
                child: App_Button(text: "SingIn")),
            SizedBox(height: 3.w,),
            Padding(
              padding: EdgeInsets.all(10.w),
              child: InkWell(
                onTap: ()async{
                   var res = await authcontroller.google_signin();
                   if(res){
                     Get.offAll(MainPage(userr: authcontroller.user,));
                   }else{
                     Get.snackbar("Failed Signin", authcontroller.message,colorText: Colors.black87,backgroundColor: Colors.blue,);
                   }
                },
                child: Container(
                  padding: EdgeInsets.all(4.sp),
                  height: 40.sp,
                  width: 40.sp,
                  decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(5.sp)),
                  alignment: Alignment.center,
                  child: SvgPicture.asset("assets/images/googleIcon.svg",height:7.h ,),
                ),
              ),
            )
          ],
        );
      },),
    );
  }


}
