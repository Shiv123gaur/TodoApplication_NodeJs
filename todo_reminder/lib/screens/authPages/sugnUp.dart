import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_reminder/constants/colors.dart';
import 'package:todo_reminder/controllers/AuthController.dart';
import 'package:todo_reminder/screens/authPages/signIn.dart';
import 'package:todo_reminder/screens/homePages/MainHomePage.dart';
import 'package:todo_reminder/screens/homePages/mainpage.dart';
import 'package:todo_reminder/widgets/Login_singnUp_button.dart';
import 'package:todo_reminder/widgets/login_singup_fields.dart';
import 'package:sizer/sizer.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  TextEditingController Emailcontroller = TextEditingController();
  TextEditingController Passwordcontroller = TextEditingController();
  TextEditingController Namecontroller = TextEditingController();
  bool checkCred(){
    if(Namecontroller.text != "" && Emailcontroller.text != "" && Passwordcontroller.text != ""){
      return true;
    }else{
      return false;
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors().mainColor,
        body: GetBuilder<AuthController>(builder: (authcontroller){
          return Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: AppColors().mainColor),
                    child: Image.asset("assets/images/Checkmark.png"),
                  ),
                  SizedBox(height: 22,),
                  RichText(
                    text: TextSpan(
                        text: "Welcome to ",
                        style: GoogleFonts.nunito(fontSize: 35),
                        children: [
                          TextSpan(text: "Do it",style: GoogleFonts.singleDay(
                              color: Colors.black, fontSize: 50, fontWeight: FontWeight.w900))
                        ]
                    ),
                  ),
                  Text("create an account and join us now !",style: GoogleFonts.nobile(fontSize: 20,color: Colors.white54),),
                  Fields(
                      text: "Name",
                      icon: Icons.person,
                      controller: Namecontroller),
                  Fields(
                      text: "E-mail",
                      icon: Icons.email,
                      controller: Emailcontroller),
                  Fields(
                      text: "Password",
                      icon: Icons.lock,
                      controller: Passwordcontroller),
                  InkWell(
                    onTap: ()async{
                     var ans =  checkCred();
                     if(ans){
                       await authcontroller.RegisterUser(Emailcontroller.text,Passwordcontroller.text,Namecontroller.text);
                       if(authcontroller.userloggedIn){
                         Get.offAll(()=>MainPage(userr: authcontroller.user,));
                       }else{
                          Get.snackbar(authcontroller.message, "try again",duration: Duration(seconds: 3),snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.blue,colorText: Colors.white);
                       }
                     }else{
                       Get.snackbar("Invalid Input", "Try filling all fields",duration: Duration(seconds: 3),snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.blue,colorText: Colors.white);
                     }
                    },
                      child: App_Button(text: "SignUp")),
                  SizedBox(height: 25,),
                  Padding(
                    padding: EdgeInsets.all(10.w),
                    child: InkWell(
                      onTap: ()async{
                        bool res = await authcontroller.google_signup();
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
                  ),
                  InkWell(
                    onTap: (){
                      Get.to(()=>SignInPage());
                    },
                    child: RichText(text: TextSpan(text: "Do you already have an account? ",style: GoogleFonts.nunito(color: Colors.white,fontSize: 20),children: [
                      TextSpan(text:"SignIn",style: GoogleFonts.nunito(color: Colors.blue,fontSize: 20))
                    ])),
                  )
                ],
              ),
            ),
          );
        },),
      ),
    );
  }
}
