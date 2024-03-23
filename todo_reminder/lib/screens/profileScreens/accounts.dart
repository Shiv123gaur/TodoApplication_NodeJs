import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_reminder/widgets/accountCard.dart';

import '../../constants/colors.dart';
import '../../controllers/profileController.dart';

class AccountSection extends StatefulWidget {
  const AccountSection({super.key});

  @override
  State<AccountSection> createState() => _AccountSectionState();
}

class _AccountSectionState extends State<AccountSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.lightBlueAccent,
              AppColors().mainColor,
            ],
          ),
        ),
        child: SafeArea(
          child: GetBuilder<ProfileController>(
            builder: (profileController) {
              return Column(
                children: [
                  Container(
                    width: double.maxFinite,
                    height: 18.h,
                    child: Stack(
                      children: [
                        Positioned(
                            child: Container(
                          padding: EdgeInsets.only(left: 40.sp),
                          alignment: Alignment.centerLeft,
                          height: 12.h,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10.w),
                                bottomLeft: Radius.circular(10.w)),
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.white, // Replace with your light color
                                AppColors()
                                    .mainColor, // Replace with your dark color
                              ],
                            ),
                          ),
                          child: Text(
                            "Do it!",
                            style: GoogleFonts.singleDay(
                                color: Colors.black,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w900),
                          ),
                        )),
                        Positioned(
                          top: 5.h,
                          left: 60.w,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            height: 10.h,
                            width: 10.h,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(5.h),
                                child: profileController.filee != null
                                    ? Image.file(
                                        profileController.filee!,
                                        fit: BoxFit.fill,
                                      )
                                    : Image(
                                        image: AssetImage(
                                            "assets/images/profile.png"),
                                        fit: BoxFit.cover,
                                      )),
                          ),
                        ),
                        Positioned(
                            top: 20.w,
                            left: 72.w,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                elevation: 5,
                                shape: CircleBorder(),
                              ),
                              onPressed: () async {
                                await profileController.PickImage();
                              },
                              child: Icon(
                                Icons.add,
                                size: 5.w,
                              ),
                            ))
                      ],
                    ),
                  ),
                  AccountCard(
                    stringg: "Shiv Gaur",
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  AccountCard(
                    stringg: "shiv@gmail.com",
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Icon(Icons.arrow_back)),
                      SizedBox(
                        width: 10.h,
                      ),
                      profileController.loading
                          ? CircularProgressIndicator()
                          : ElevatedButton(
                              onPressed: () async{
                                var res = await profileController.uploadImage();
                                if(res){
                                  Get.snackbar("Success","Image uploaded Successfully",backgroundColor: Colors.white,snackPosition: SnackPosition.BOTTOM);
                                }
                              },
                              child: Text("Save")),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
