import 'dart:math' as math;
import 'dart:ui';
import 'package:base_project/app/views/home_section/controller/pusher_challenge_controller.dart';
import 'package:base_project/core/constants/app_svgs.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../core/Constants/app_colors.dart';
import '../../../../core/constants/app_fonts_and_styles.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/widgets/pusher_challenge_view/custom_premium_box.dart';

class PusherChallengesAllCompletedView extends StatelessWidget {
  PusherChallengesAllCompletedView({super.key});

  final PusherChallengeController pusherChallengeController =Get.put(PusherChallengeController());

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
              // Replace your ListView + Transform.rotate section with:
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(width: double.infinity,),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: pusherChallengeController.taskNames.length,
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(5.sp),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            margin: EdgeInsets.only(
                              bottom: 10.h,
                              left: 20.w,
                              right: 20.w,
                            ),
                            padding: EdgeInsets.all(10.sp),
                            decoration: BoxDecoration(
                              color: pusherChallengeController.selectedChallenge
                                  ? AppColors.yellow
                                  : AppColors.whiteColor.withOpacity(0.18),
                              border: Border.all(
                                color: AppColors.whiteColor,
                                width: 1.5.w,
                              ),
                              borderRadius: BorderRadius.circular(5.sp),
                            ),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: SvgPicture.asset(
                                    pusherChallengeController.selectedChallenge
                                        ? AppSvgs.checkBoxFillSvg
                                        : AppSvgs.checkBoxEmptySvg,
                                  ),
                                ),
                                10.horizontalSpace,
                                Text(
                                  pusherChallengeController.taskNames[index].tr,
                                  style: AppStyles.poppins14w500white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  Positioned(
                    child: IgnorePointer( 
                      child: Transform.rotate(
                        angle: math.pi*2*(math.pi/3.35),//math.pi*(math.pi / 4),
                        child: Container(
                          height: 60.h,
                          width: double.infinity,
                          alignment: Alignment.center,
                          decoration: DottedDecoration(
                            shape: Shape.box,
                            strokeWidth: 2.w,
                            color: AppColors.whiteColor,
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            color: AppColors.whiteColor.withOpacity(0.55),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Well Done".tr,style: AppStyles.poppins20w700LightBlue,),
                                SvgPicture.asset(AppSvgs.wellDoneBlueSvg)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
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
