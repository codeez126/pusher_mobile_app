import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Constants/app_colors.dart';
import '../../constants/app_fonts_and_styles.dart';
import '../../constants/app_images.dart';
import '../../constants/app_svgs.dart';
import '../custom_change_round_button.dart';

class CustomChallengeContainer extends StatelessWidget {

  CustomChallengeContainer({
    super.key,
    required this.challengeName,
    required this.backgroundImage,
    required this.challengeTime,
    required this.trainerName,
    required this.trainerDescription,
    required this.challengesPoints,
    required this.onTap,

  });

  String challengeName;
  String backgroundImage;
  String challengeTime;
  String trainerName;
  String trainerDescription;
  int challengesPoints;
  Function onTap;



  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 400.h,
          margin: EdgeInsets.only(left: 20.w,right: 20.w,bottom: 20.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.sp),
            border: Border.all(color: AppColors.yellow, width: 1.2.w),
            image: DecorationImage(
              image: AssetImage(backgroundImage),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          height: 400.h,
          margin: EdgeInsets.only(left: 20.w,right: 20.w,bottom: 20.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.sp),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.3),
                Colors.black.withOpacity(0.7),
              ],
            ),
          ),
        ),
        Container(
          height: 400.h,
          margin: EdgeInsets.only(left: 20.w,right: 20.w,bottom: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 20.w,right: 20.w,top: 20.h,bottom: 10.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(AppImages.premiumStar, height: 30.h),
                          10.horizontalSpace,
                          Text(
                            "$challengeName+ ${"Challenge".tr}",
                            style: AppStyles.poppins20w600white,
                          ),
                        ],
                      ),
                      10.verticalSpace,
                      Container(
                        width: 120.w,
                        padding: EdgeInsets.symmetric(vertical: 5.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.sp),
                          border: Border.all(
                              color: AppColors.whiteColor, width: 1.5.w),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "$challengeTime ${"Days".tr}",
                              style: AppStyles.poppins12w300white,
                            ),
                            10.horizontalSpace,
                            SvgPicture.asset(AppSvgs.calenderSvg),
                          ],
                        ),
                      ),
                      Spacer(),
                      Text(
                        "${"By".tr} $trainerName",
                        style: AppStyles.poppins20w600white,
                      ),
                      10.verticalSpace,
                      Container(
                        padding:
                        EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.sp),
                          border: Border.all(
                              color: AppColors.whiteColor, width: 1.5.w),
                        ),
                        child: Text(
                          trainerDescription,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: AppStyles.poppins12w300white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20.sp),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    height: 140.h,
                    padding: EdgeInsets.symmetric(
                        horizontal: 20.sp, vertical: 10.sp),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.sp),
                      color: AppColors.whiteColor.withOpacity(0.25),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.sp),
                            border: Border.all(
                                width: 1.5.w, color: AppColors.whiteColor),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Win ".tr,
                                      style: AppStyles.poppins16w300white,
                                    ),
                                    TextSpan(
                                      text: challengesPoints.toString(),
                                      style: AppStyles.poppins16w600white,
                                    ),
                                  ],
                                ),
                              ),
                              SvgPicture.asset(AppSvgs.coinSvg),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            onTap();
                          },
                          child: CustomChangeRoundButton(
                            text: "See The Challenges".tr,
                            icon: AppSvgs.nextSvg,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
