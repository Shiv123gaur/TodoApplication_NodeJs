import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_reminder/models/userProfile.dart';
import 'package:todo_reminder/screens/homePages/manageTime.dart';
import 'package:todo_reminder/screens/homePages/profile.dart';
import 'package:todo_reminder/screens/homePages/taskDetails.dart';

import '../../constants/colors.dart';
import '../../controllers/mainPageController.dart';
import 'MainHomePage.dart';
class MainPage extends StatefulWidget {
  MainPage({super.key,required this.userr});
  final User userr;


  @override
  State<MainPage> createState() => _MainPageState();
}


class _MainPageState extends State<MainPage> {
  late User? _user;
  late List<Widget> pages;
  late PageController pagecontroller;



  @override
  void initState() {
    _user = widget.userr;
    pagecontroller = new PageController(viewportFraction: 1.0);
    pages = [
      MainHomePage(user:_user!),
      TaskDetailPage(),
      MangeTimePage(),
      ProfilePage()
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainPageController>(builder: (controller){
      return Scaffold(
        body:Container(
          color: Colors.white,
          child: PageView.builder(
            controller: pagecontroller,
              itemCount: 4,
              onPageChanged: (index){
                controller.currentpage = index;
              },
              itemBuilder: (context,index){
                return pages[controller.currentpage] ;
              }),
        ) ,
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.lightBlueAccent,
          backgroundColor: AppColors().mainColor,
          currentIndex: controller.currentpage,
          onTap: (index){
            controller.currentpage = index;
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 3.5.h,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/images/bottom_navigation_check.svg",
                  height: 3.5.h,
                  color: controller.currentpage==1?Colors.lightBlueAccent:Colors.white,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.calendar_month,
                  size: 3.5.h,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  size: 3.5.h,
                ),
                label: ""),
          ],
        ),
      );
    });
  }
}
