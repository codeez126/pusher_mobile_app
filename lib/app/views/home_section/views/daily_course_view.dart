import 'dart:math' as math show pi;
import 'dart:ui';

import 'package:base_project/app/routes/app_routes.dart';
import 'package:base_project/core/constants/app_svgs.dart';
import 'package:base_project/core/widgets/custom_change_round_button.dart';
import 'package:base_project/core/widgets/daily_course_view/custom_audio_waveform_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/Constants/app_colors.dart';
import '../../../../core/constants/app_fonts_and_styles.dart';
import '../../../../core/constants/app_images.dart';

class DailyCourseView extends StatelessWidget {
  const DailyCourseView({super.key});

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
                  children: [
                    SizedBox(
                      height: 650.h,
                    ),
                    //for more
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(50.sp),
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          height: 650.h,
                          alignment: Alignment.bottomCenter,
                          padding: EdgeInsets.only(bottom: 10.sp),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(50.sp),
                            ),
                            color: AppColors.whiteColor.withOpacity(0.30),
                          ),
                          child: GestureDetector(
                            onTap: (){
                              Get.toNamed(AppRoutes.motivationalVideosView);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Transform.rotate(angle: (3*math.pi)/2,child: SvgPicture.asset(AppSvgs.arrowDown_x2Svg)),
                                5.horizontalSpace,
                                RichText(text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text: "Motivation Video Mix".tr,
                                          style: AppStyles.poppins14w300darkGrey2
                                      ),
                                      TextSpan(
                                          text: " All Videos".tr,
                                          style: AppStyles.poppins14w700darkGrey2
                                      )
                                    ]
                                )),
                                5.horizontalSpace,
                                Transform.rotate(angle: math.pi/2,child: SvgPicture.asset(AppSvgs.arrowDown_x2Svg)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    //image
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(50.sp),
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          height: 600.h,
                          width: double.infinity,
                          alignment: Alignment.bottomCenter,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(AppImages.motivationalVideoBackgroundOne),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(50.sp),
                            ),
                            color: AppColors.whiteColor.withOpacity(0.30),
                          ),
                          child: Stack(
                            children: [
                              // overlay for text
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(50.sp),
                                  ),
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.transparent,
                                      Colors.black.withOpacity(0.3),
                                      Colors.black.withOpacity(0.3),
                                      Colors.black.withOpacity(0.5),
                                    ],
                                    stops: [0.0, 0.4, 0.7, 1.0],
                                  ),
                                ),
                              ),
                              Positioned.fill(
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '"Nothing Will Stop Me"'.tr,
                                        style: AppStyles.poppins24w700whiteItalic,
                                      ),
                                      SizedBox(height: 10.h),
                                      Text(
                                        '"Let\'s talk for a second about life and our meaning and how nothing can stop us. We are the ones who stand in our own way."'.tr,
                                        textAlign: TextAlign.left,
                                        style: AppStyles.poppins14w300whiteItalic,
                                      ),
                                      SizedBox(height: 15.h),
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12.sp),
                                          color: AppColors.whiteColor.withOpacity(0.40),
                                        ),
                                        child: Text(
                                          'By Sam Mor - Mental Adviser'.tr,
                                          style: AppStyles.poppins14w500white,
                                        ),
                                      ),
                                      20.verticalSpace,
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          CustomAudioWaveformPlayer(
                                            width: 320,
                                            height: 60,
                                            backgroundColor: AppColors.whiteColor.withOpacity(0.22),
                                            playedWaveColor: Colors.white,
                                            isTimerEnabled: false,
                                            totalDuration: Duration(minutes: 2, seconds: 20),
                                            //unPlayedWaveColor: Colors.white60,
                                            ///progress: 0.7,
                                          ),
                                        ],
                                      ),
                                      20.verticalSpace, // Added bottom spacing
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    //for top bar
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(50.sp),
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          padding: EdgeInsets.only(bottom: 10.h),
                          height: 100.h,
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
                                bottom: 10,
                                child: Text(
                                    "Daily Course".tr,
                                    style: AppStyles.poppins16w700darkGrey2
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    //for back
                    Positioned(
                      left: 0,
                      top: 60,
                      child: InkWell(
                        onTap: () => Get.back(),
                        child: SvgPicture.asset(
                          AppSvgs.backImageSvg,
                          height: 120.h,

                        ),
                      ),
                    ),
                    //timer
                    Positioned(
                        right: 20,
                        top: 100,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.sp),
                        color: AppColors.whiteColor.withOpacity(0.30),
                        border: Border.all(color: AppColors.whiteColor.withOpacity(0.50),width: 1.5.w)
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(AppSvgs.clockSvg,color: AppColors.whiteColor,),
                          5.horizontalSpace,
                          Text('08:40${'Min'.tr}',style: AppStyles.poppins12w700white,)
                        ],
                      ),
                    ))
                  ],
                ),
                15.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 70.w),
                  child: Container(
                    padding: EdgeInsets.all(13.sp),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45.sp),
                      color: const Color(0xff0E1E2E4).withOpacity(0.45),
                    ),
                    child: GestureDetector(
                      onTap: (){
                        nextDailyGoals();
                      },
                      child: CustomChangeRoundButton(text: 'Next Daily Goals'.tr, icon: AppSvgs.nextSvg),
                    ),
                  ),
                ),
                10.verticalSpace,
              ],
            ),
      ),
    );
  }

  void nextDailyGoals() {
    Get.toNamed(AppRoutes.pusherChallengeView);
  }
}
