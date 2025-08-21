import 'dart:ui';

import 'package:base_project/app/routes/app_routes.dart';
import 'package:base_project/app/views/extra_challenges_sections/model/voucher_and_coins_model.dart';
import 'package:base_project/core/constants/app_fonts_and_styles.dart';
import 'package:base_project/core/constants/app_svgs.dart';
import 'package:base_project/core/widgets/vouches_and_coins_view/coustom_challenge_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/Constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';

class VouchersAndCoinView extends StatelessWidget {
  const VouchersAndCoinView({super.key});

  void showChallengeBottomSheet(BuildContext context, dynamic challenge) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true, 
      useSafeArea: false, 
      constraints: BoxConstraints.expand(),
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height, 
          width: MediaQuery.of(context).size.width, 
          margin: EdgeInsets.zero, 
          padding: EdgeInsets.zero, 
          color: Colors.black.withOpacity(0.8),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                top: 50.h,
                left: 0.w,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(AppSvgs.backImageWhiteSvg),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(AppSvgs.arrowDownAnimateSvg),
                      SvgPicture.asset(AppSvgs.arrowDownAnimateSvg),
                      SvgPicture.asset(AppSvgs.arrowDownAnimateSvg),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(20.w),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(25.r),
                      ),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        30.verticalSpace,
                        ClipRRect(
                          borderRadius: BorderRadius.circular(55.r),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
                            child: Container(
                              alignment: Alignment.center,
                              height: 70.h,
                              padding: EdgeInsets.symmetric(horizontal: 20.sp,vertical: 10.sp),
                              decoration: BoxDecoration(
                                border: Border.all(width: 1.2.w,color: AppColors.whiteColor),
                                color: AppColors.whiteColor.withOpacity(0.45),
                                borderRadius: BorderRadius.circular(55.r),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Get.back();
                                  Get.toNamed(
                                      AppRoutes.viewingTheChallengeView,
                                      arguments: {
                                        'challengeName': challenge.challengeName,
                                        'backgroundImage': challenge.backgroundImage,
                                        'challengePoints': challenge.points,
                                        'trainerName': challenge.trainerName,
                                        'trainerDescription': challenge.trainerDescription,
                                        'challengeDescription': challenge.courseDescription,
                                        'tasks': challenge.tasks,
                                        'challengeTime': challenge.challengeTime
                                      }
                                  );
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 50.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.lightBlue,
                                    borderRadius: BorderRadius.circular(25.r),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(AppImages.premiumStar),
                                      10.horizontalSpace,
                                      Text(
                                        "I Want This Challenge",
                                        style: AppStyles.poppins14w700white
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        30.verticalSpace,
                        SvgPicture.asset(AppSvgs.lockAnimateSvg),
                        15.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              ">> Go Premium ",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "To Unlock This Challenge ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "<<",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),

                        30.verticalSpace,
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.editProfileBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(height: 180.h),
                Container(
                  height: 130.h,
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.only(bottom: 25.h),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(50.sp),
                    ),
                    color: AppColors.whiteColor.withOpacity(0.30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppImages.premiumStar, height: 30.h),
                      5.horizontalSpace,
                      Text("Challenges", style: AppStyles.poppins20w600darkGrey2),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Get.back();
                      print('tapped');
                    },
                    child: Image.asset(AppImages.backImage, height: 130.h),
                  ),
                ),
              ],
            ),
            ListView.builder(
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: VouchersAndCoinsModel.challenges.length,
              itemBuilder: (context, index) {
                final challenges = VouchersAndCoinsModel.challenges[index];
                return CustomChallengeContainer(
                  challengeName: challenges.challengeName,
                  backgroundImage: challenges.backgroundImage,
                  challengeTime: challenges.challengeTime,
                  trainerName: challenges.trainerName,
                  trainerDescription: challenges.trainerDescription,
                  challengesPoints: challenges.points,
                  onTap: () {
                    showChallengeBottomSheet(context, challenges);
                    print("Container Tapped - Bottom Sheet Opened");
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}