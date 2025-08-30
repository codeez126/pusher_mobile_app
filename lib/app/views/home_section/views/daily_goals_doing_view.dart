import 'dart:ui';

import 'package:base_project/core/constants/app_svgs.dart';
import 'package:base_project/core/widgets/daily_goals_done_view/custom_challenge_complete_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:get/get.dart';

import '../../../../core/Constants/app_colors.dart';
import '../../../../core/constants/app_fonts_and_styles.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/widgets/custom_app_button.dart';
import '../../../../core/widgets/custom_change_round_button.dart';
import '../../../routes/app_routes.dart';

class DailyGoalsDoingView extends StatefulWidget {
  const DailyGoalsDoingView({super.key});

  @override
  State<DailyGoalsDoingView> createState() => _DailyGoalsDoingViewState();
}

class _DailyGoalsDoingViewState extends State<DailyGoalsDoingView> {
  DateTime? endTime;

  late String backgroundImage;
  late String title;
  late String heading;
  late String description;
  late String iconImage;
  bool taskDone = false;

  @override
  void initState() {
    super.initState();
    final args = Get.arguments as Map<String, dynamic>;
    backgroundImage = args['backgroundImage'];
    title = args['title'];
    heading = args['heading'];
    description = args['description'];
    iconImage = args['iconImage'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Header section
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(50.sp),
                  ),
                  color: AppColors.whiteColor.withOpacity(0.30),
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      left: 0,
                      // bottom: -20,
                      child: InkWell(
                        onTap: () => Get.back(),
                        child: SvgPicture.asset(
                          AppSvgs.backImageSvg,
                          height: 100,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 50,
                      child: Text(
                        'Daily Challenge'.tr,
                        style: AppStyles.poppins20w600darkGrey2,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Transform(
              transform: Matrix4.translationValues(0, -40, 0),
              child: Container(
                width: Get.width,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    taskDone
                        ? Container(
                          width: Get.width * 0.60.w,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(45.sp),
                            color: const Color(0xff0E1E2E4).withOpacity(0.45),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.dailyCourseView);
                            },
                            child: CustomChangeRoundButton(
                              text: 'Next Daily Goals',
                              icon: AppSvgs.nextSvg,
                            ),
                          ),
                        )
                        : Container(
                          width: Get.width * 0.60.w,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(45.sp),
                            color: const Color(0xff0E1E2E4).withOpacity(0.45),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: CustomChangeRoundButton(
                              text: 'Change Task',
                              icon: AppSvgs.changeSvg,
                            ),
                          ),
                        ),

                    if (!taskDone)
                      Positioned(
                        right: 0,
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
                  ],
                ),
              ),
            ),
            // Positioned(
            //   bottom: 0,
            //   child:
            //       taskDone
            //           ? Container(
            //             padding: EdgeInsets.all(13.sp),
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(45.sp),
            //               color: const Color(0xff0E1E2E4).withOpacity(0.45),
            //             ),
            //             child: GestureDetector(
            //               onTap: () {
            //                 Get.toNamed(AppRoutes.dailyCourseView);
            //               },
            //               child: CustomChangeRoundButton(
            //                 text: 'Next Daily Goals',
            //                 icon: AppSvgs.nextSvg,
            //               ),
            //             ),
            //           )
            //           : Container(
            //             padding: EdgeInsets.all(13.sp),
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(45.sp),
            //               color: const Color(0xff0E1E2E4).withOpacity(0.45),
            //             ),
            //             child: GestureDetector(
            //               onTap: () {
            //                 Get.back();
            //               },
            //               child: CustomChangeRoundButton(
            //                 text: 'Change Task',
            //                 icon: AppSvgs.changeSvg,
            //               ),
            //             ),
            //           ),
            // ),
            // if (!taskDone)
            //   Positioned(
            //     bottom: 0,
            //     right: 0,
            //     child: Container(
            //       margin: EdgeInsets.all(20.sp),
            //       padding: EdgeInsets.all(5.sp),
            //       decoration: BoxDecoration(
            //         color: AppColors.whiteColor.withOpacity(0.60),
            //         shape: BoxShape.circle,
            //         border: Border.all(
            //           color: AppColors.whiteColor,
            //           width: 1.8.w,
            //         ),
            //       ),
            //       child: SvgPicture.asset(AppSvgs.infoSvg),
            //     ),
            //   ),
            20.verticalSpace,
            if (!taskDone) ...[
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.4),
                          Colors.black.withOpacity(0.6),
                          Colors.black.withOpacity(0.8),
                        ],
                        stops: [0.0, 0.3, 0.6, 1.0],
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50.r),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.r),
                          border: Border.all(
                            width: 1.5.w,
                            color: AppColors.whiteColor,
                          ),
                          color: AppColors.whiteColor.withOpacity(0.35),
                        ),
                        child: Column(
                          children: [
                            20.verticalSpace,
                            Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                if (title == '5 Minute')
                                  SvgPicture.asset(AppSvgs.meditationClockSvg),
                                Text(
                                  title.tr,
                                  style: AppStyles.urbanistBold20White600,
                                ),
                              ],
                            ),
                            Text(
                              heading.tr,
                              style: AppStyles.urbanistBold30Yellow700,
                            ),
                            10.verticalSpace,
                            Text(
                              description.tr,
                              textAlign: TextAlign.center,
                              style: AppStyles.poppins16w600white.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            30.verticalSpace,
                            Text(
                              'Start The Timer'.tr,
                              textAlign: TextAlign.center,
                              style: AppStyles.poppins14w700darkGrey2.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            5.verticalSpace,
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              // alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35.sp),
                                border: Border.all(
                                  color: AppColors.whiteColor,
                                  width: 1.5.w,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        endTime = DateTime.now().add(
                                          const Duration(seconds: 10),
                                        );
                                      });
                                    },
                                    child: Image.asset(
                                      AppImages.startPng,
                                      height: 40,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  endTime == null
                                      ? Text(
                                        "00:10",
                                        style: AppStyles.poppins28w300white,
                                      )
                                      : TimerCountdown(
                                        format:
                                            CountDownTimerFormat.minutesSeconds,
                                        enableDescriptions: false,
                                        timeTextStyle:
                                            AppStyles.poppins28w300white,
                                        spacerWidth: 0,
                                        endTime: endTime!,
                                        onEnd: () {
                                          print('Finished');
                                        },
                                      ),
                                  SizedBox(width: 5),
                                ],
                              ),
                            ),
                            10.verticalSpace,
                            SvgPicture.asset(iconImage, height: 50.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              10.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: CustomAppButton(
                  onTap: () {
                    // Get.toNamed(AppRoutes.dailyGoalsDoneView);
                    setState(() {
                      taskDone = true;
                    });
                  },
                  text: 'Done'.tr,
                  isIcon: false,
                  textStyle: AppStyles.poppins16w600white,
                ),
              ),
            ],
            if (taskDone) ...[CustomChallengeCompleteBox(progress: 1)],
          ],
        ),
      ),
    );
  }
}
