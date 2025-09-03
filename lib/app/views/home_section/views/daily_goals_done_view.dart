import 'dart:ui';
import 'package:base_project/app/routes/app_routes.dart';
import 'package:base_project/core/constants/app_svgs.dart';
import 'package:base_project/core/widgets/custom_change_round_button.dart';
import 'package:base_project/core/widgets/daily_goals_done_view/custom_challenge_complete_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../core/Constants/app_colors.dart';
import '../../../../core/constants/app_fonts_and_styles.dart';
import '../../../../core/constants/app_images.dart';


class DailyGoalsDoneView extends StatefulWidget {
  const DailyGoalsDoneView({super.key});

  @override
  State<DailyGoalsDoneView> createState() => _DailyGoalsDoneViewState();
}


class _DailyGoalsDoneViewState extends State<DailyGoalsDoneView> {

  bool showChallengeBox = false;


  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 400), () {
      if (mounted) {
        setState(() => showChallengeBox = true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.meditationBackgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(height: 210.h),
                ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(50.sp),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 10, // blur strength horizontally
                      sigmaY: 10, // blur strength vertically
                    ),
                    child: Container(
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
                  ),
                ),
                Positioned(
                  bottom: 0,
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
                      child: CustomChangeRoundButton(text: 'Next Daily Goal'.tr, icon: AppSvgs.nextSvg),
                    ),
                  ),
                ),
                // Info Icon
                Positioned(
                  bottom: 0,
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
            20.verticalSpace,
            if (showChallengeBox)
              CustomChallengeCompleteBox(
                progress: 0.78,
              ),
          ],
        ),
      ),
    );
  }

  void nextDailyGoals() {
    Get.toNamed(AppRoutes.dailyCourseView);
  }
}
