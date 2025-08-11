import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../core/Constants/app_colors.dart';
import '../../../../core/constants/app_fonts_and_styles.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/widgets/daily_task_done_view/animated_progress_bar.dart';


class DailyTaskDoneView extends StatelessWidget {
  const DailyTaskDoneView({super.key});

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
                //Blur effect custom made for practice
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
                                AppImages.backImage,
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
                              'Daily Challenge',
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
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.lightBlue,
                            borderRadius: BorderRadius.circular(35.sp),
                            border: Border.all(width: 1.5.w,color: AppColors.whiteColor)
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
                        child: Row(
                          children: [
                            Text('Next Daily Goal', style: AppStyles.poppins16w600white,),
                            5.horizontalSpace,
                            SvgPicture.asset(AppImages.nextSvg,height: 30.h,)
                          ],
                        ),
                      ),
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
                    child: SvgPicture.asset(AppImages.infoSvg),
                  ),
                ),
              ],
            ),
            20.verticalSpace,
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
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.sp),
                      border: Border.all(width: 1.5.w,color: AppColors.whiteColor),
                      color: AppColors.whiteColor.withOpacity(0.10),
                    ),
                    child: Column(
                      children: [
                        30.verticalSpace,
                          Text(
                            'Daily Challenge Completed Today',
                            textAlign: TextAlign.center,
                            style: AppStyles.poppins16w600white,
                          ),
                        30.verticalSpace,
                        SvgPicture.asset(AppImages.doneSvg),
                        30.verticalSpace,
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: AnimatedProgressBar(
                              targetProgress: 0.33, // 0=0% ,1=100%
                              backgroundColor: AppColors.whiteColor.withOpacity(
                                0.25,
                              ),
                              height: 30.h,
                              progressColor: AppColors.lightBlue,
                              borderColor: AppColors.whiteColor,
                            ),
                          ),
                        30.verticalSpace

                      ],
                    )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void nextDailyGoals() {}
}
