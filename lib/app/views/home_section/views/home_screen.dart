import 'dart:developer';
import 'package:base_project/app/views/home_section/controllers/home_controller.dart';
import 'package:base_project/app/views/home_section/widgets/top_scroller.dart';
import 'package:base_project/core/constants/app_svgs.dart';
import 'package:base_project/core/widgets/custom_info_dialoge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/Constants/app_colors.dart';
import '../../../../core/constants/app_fonts_and_styles.dart';
import '../../../../core/constants/app_images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var con = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.dailyChallengeBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(height: 210.h),
                Container(
                  height: 170.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(50.sp),
                    ),
                    color: AppColors.whiteColor.withOpacity(0.30),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        left: 0,
                        bottom: 0,
                        child: InkWell(
                          onTap: () => Get.back(),
                          child: SvgPicture.asset(
                            AppSvgs.backImageSvg,
                            height: 120.h,
                          ),
                          // Image.asset(
                          //   AppImages.imageBackIcon,
                          //   height: 120.h,
                          // ),
                        ),
                      ),
                      Positioned(
                        bottom: 55,
                        child: Text(
                          'Daily Challenge'.tr,
                          style: AppStyles.poppins20w600darkGrey2,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 13.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45.sp),
                      color: const Color(0xff0E1E2E4),
                    ),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'choose'.tr,
                            style: AppStyles.poppins16w400darkGrey2,
                          ),
                          TextSpan(
                            text: ' One'.tr,
                            style: AppStyles.poppins16w900darkGrey2,
                          ),
                          TextSpan(
                            text: '\nchallenge for today'.tr,
                            style: AppStyles.poppins16w400darkGrey2,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      Get.dialog(
                        CustomInfoDialog(
                          description:
                              "Every day you can choose one daily challenge from three possible challenges. After you choose and carry it out, three new challenge will appear every other day."
                                  .tr,
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.all(20.sp),
                      padding: EdgeInsets.all(5.sp),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor.withOpacity(0.60),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.whiteColor,
                          width: 1.8.w,
                        ),
                      ),
                      child: SvgPicture.asset(AppSvgs.infoSvg),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    FadeThreeWidgets(),
                    // SizedBox(height: 20.h),
                    SizedBox(
                      height: Get.height * 0.4,
                      width: double.infinity,
                      child: Row(
                        // spacing: 2,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (con.currentIndex.value == 0) {
                                return;
                              }
                              con.currentIndex.value -= 1;
                              con.controller.animateToPage(
                                con.currentIndex.value,
                                duration: Duration(seconds: 1),
                                curve: Curves.easeInOut,
                              );
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset('assets/images/hpre.png'),
                                Icon(Icons.arrow_back_ios, size: 20),
                              ],
                            ),
                          ),
                          Expanded(
                            child: PageView.builder(
                              onPageChanged: (value) {
                                con.currentIndex.value = value;
                              },
                              controller: con.controller,
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return AnimatedBuilder(
                                  animation: con.controller,
                                  builder: (context, child) {
                                    double value = 0.0;
                                    if (con
                                        .controller
                                        .position
                                        .haveDimensions) {
                                      value = con.controller.page! - index;
                                    } else {
                                      value =
                                          con.controller.initialPage
                                              .toDouble() -
                                          index;
                                    }

                                    // Limit tilt range
                                    value = (value * 0.5).clamp(-1.0, 1.0);

                                    // Rotation angle in radians
                                    double angle = value * 0.25;

                                    // adjust tilt strength

                                    return Transform(
                                      alignment: Alignment.center,
                                      transform:
                                          Matrix4.identity()
                                            ..setEntry(
                                              3,
                                              2,
                                              0.001,
                                            ) // perspective
                                            ..rotateZ(-angle),

                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 20,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                            24,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(
                                                0.2,
                                              ),
                                              blurRadius: 12,
                                              offset: const Offset(0, 6),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              "“Nothing Will Stop Me”",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                            const Text("By Amit Cohen"),
                                            const SizedBox(height: 20),
                                            CircleAvatar(
                                              radius: 30,
                                              backgroundColor:
                                                  Colors.grey.shade200,
                                              child: const Icon(
                                                Icons.play_arrow,
                                                size: 40,
                                                color: Colors.black87,
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (con.currentIndex.value == 2) {
                                return;
                              }
                              con.currentIndex.value += 1;
                              con.controller.animateToPage(
                                con.currentIndex.value,
                                duration: Duration(seconds: 1),
                                curve: Curves.easeInOut,
                              );
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset('assets/images/hnext.png'),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 20,
                                ).marginOnly(bottom: 10),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
