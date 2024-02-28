import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:todo_reminder/constants/colors.dart';
import 'package:todo_reminder/controllers/homePageController.dart';
import 'package:todo_reminder/screens/authPages/sugnUp.dart';
import 'package:todo_reminder/widgets/pageViewContainer.dart';

class Guide_1 extends StatelessWidget {
  Guide_1({super.key});
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().mainColor,
      body: GetBuilder<HomepageController>(
        builder: (controller) {
          return Column(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  decoration: BoxDecoration(color: AppColors().mainColor),
                  child: PageView(
                    controller: pageController,
                    onPageChanged: (index) {
                      controller.SetTabno = index;
                    },
                    children: [
                      PageViewContainer(imageUrl: "assets/images/guide-1.png", text: "Plan your tasks to do, that way you’ll stay organized and you won’t skip any"),
                      PageViewContainer(imageUrl: "assets/images/guide-2_img.png", text: "create a team task, invite people and manage your work together"),
                      PageViewContainer(imageUrl: "assets/images/guide-3_img.png", text: "Make a full schedule for the whole week and stay organized and productive all days"),
                      PageViewContainer(imageUrl: "assets/images/guide-4_img.png", text: "You informations are secure with us")
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.center,
                  width: double.maxFinite,
                  color: AppColors().mainColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SmoothPageIndicator(
                        count: 4,
                        controller: pageController,
                        effect: CustomizableEffect(
                            spacing: 5.w,
                            dotDecoration: DotDecoration(
                                width: 12.w,height: 2.h,
                                color: Colors.black38,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(1.w),
                                    bottomRight: Radius.circular(1.w)),
                                rotationAngle: 20),
                            activeDotDecoration:
                            DotDecoration(
                                width: 10.w,height: 5.w,
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(2.w),
                                    bottomLeft: Radius.circular(2.w)),
                                rotationAngle: 195)),
                      ),
                      InkWell(
                        onTap: (){
                         Get.to(()=>SignUpPage());
                        },
                          child: SvgPicture.asset("assets/images/next_button.svg",
                          height: 10.h,
                          ))
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

