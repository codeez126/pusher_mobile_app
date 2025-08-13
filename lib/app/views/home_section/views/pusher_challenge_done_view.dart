import 'dart:ui';
import 'package:base_project/core/constants/app_svgs.dart';
import 'package:base_project/core/widgets/daily_goals_done_view/custom_challenge_complete_box.dart';
import 'package:base_project/core/widgets/pusher_challenge_view/custom_premium_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/Constants/app_colors.dart';
import '../../../../core/constants/app_fonts_and_styles.dart';
import '../../../../core/constants/app_images.dart';

class PusherChallengeDoneView extends StatefulWidget {
  PusherChallengeDoneView({super.key});

  @override
  State<PusherChallengeDoneView> createState() => _PusherChallengeDoneViewState();
}

class _PusherChallengeDoneViewState extends State<PusherChallengeDoneView> {


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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(height: 190.h),

                  ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(50.sp),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        height: 170.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(50.sp),
                          ),
                          color: AppColors.whiteColor.withOpacity(0.40),
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
                              ),
                            ),
                            Positioned(
                              bottom: 45,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    AppSvgs.challenge2Svg,
                                    height: 35.h,
                                  ),
                                  5.horizontalSpace,
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Pusher Challenge'.tr,
                                        style: AppStyles.poppins18w600darkGrey2,
                                      ),
                                      Text(
                                        'Super Mix Routine'.tr,
                                        style: AppStyles.poppins16w400darkGrey2,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      margin: EdgeInsets.only(right: 10.w),
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
                ],
              ),
              20.verticalSpace,
              CustomChallengeCompleteBox(
                progress: 0.28,
              ),
              20.verticalSpace,
              CustomPremiumBox(
                  plan: false,
                  onTap: (){}
              )
            ],
          ),
        ),
      ),
    );
  }
}
