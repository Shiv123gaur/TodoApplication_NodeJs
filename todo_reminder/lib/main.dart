import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_reminder/controllers/AuthController.dart';
import 'package:todo_reminder/controllers/mainPageController.dart';
import 'package:todo_reminder/helper/dependencies.dart' as depp;
import 'package:todo_reminder/screens/homePages/splash_screen.dart';
import 'package:get/get.dart';
import 'constants/colors.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await depp.init();
  runApp(Myapp());
}


class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType){
      return  GetBuilder<AuthController>(builder:(_){
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
              backgroundColor: AppColors().mainColor,
              body:SplashScreen()
          ),
        );
      } );
    });
  }
}


