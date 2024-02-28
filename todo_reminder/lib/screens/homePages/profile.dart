import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_reminder/controllers/AuthController.dart';

import '../profileScreens/accounts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Container(height: double.maxFinite,color: Colors.red,
    child: Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(onPressed: (){
          Get.to(()=>AccountSection());
        }, child: Text("Accounts")),
        ElevatedButton(child: Text("Logout"),onPressed: (){
           Get.find<AuthController>().Logout();
        },),
      ],
    ),
    );
  }
}
