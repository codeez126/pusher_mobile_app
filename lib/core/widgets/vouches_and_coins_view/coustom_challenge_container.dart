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
    return Container(
      height: 350,
      margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.sp),
        border: Border.all(color: AppColors.yellow, width: 1.2.w),
        image: DecorationImage(
          opacity: 0.5,
          image: AssetImage(backgroundImage),
          fit: BoxFit.fill,
        ),
        color: Colors.black.withValues(alpha: 0.80),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.sp),
                topRight: Radius.circular(20.sp),
              ),
              // color: Color(0xff000000).withValues(alpha: 0.10),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(AppImages.premiumStar, height: 30.h),
                    10.horizontalSpace,
                    Text(
                      "$challengeName Challenge",
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
                      color: AppColors.whiteColor,
                      width: 1.5.w,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$challengeTime Days",
                        style: AppStyles.poppins12w300white,
                      ),
                      10.horizontalSpace,
                      SvgPicture.asset(AppSvgs.calenderSvg),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: Get.width,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                decoration: BoxDecoration(
                  // gradient: LinearGradient(
                  //   stops: [0.2, 0.8],
                  //   begin: Alignment.topCenter,
                  //   end: Alignment.bottomCenter,
                  //   colors: [
                  //     AppColors.blackColor.withOpacity(0.7),
                  //     AppColors.whiteColor.withOpacity(0.1),
                  //     AppColors.blackColor.withOpacity(0.7),
                  //   ],
                  // ),
                  // color: Color(0xff000000).withValues(alpha: 0.10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "By $trainerName",
                      style: AppStyles.poppins20w600white,
                    ),
                    10.verticalSpace,
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 5.h,
                        horizontal: 10.w,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.sp),
                        border: Border.all(
                          color: AppColors.whiteColor,
                          width: 1.5.w,
                        ),
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
              SizedBox(height: 5),
              Container(
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.sp),
                    bottomRight: Radius.circular(20.sp),
                  ),
                  // color: Color(0xff000000).withValues(alpha: 0.40),
                ),
                // padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.sp),
                  child: Container(
                    width: Get.width,
                    height: 140.h,
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.sp,
                      vertical: 10.sp,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.sp),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.whiteColor.withOpacity(0.3),
                          AppColors.blackColor.withOpacity(0.5),
                        ],
                      ),
                    ),
                    child: Column(
                      spacing: 8,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.sp),
                            border: Border.all(
                              width: 1.5.w,
                              color: AppColors.whiteColor,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Win ",
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
                          onTap: () {
                            onTap();
                          },
                          child: SizedBox(
                            width: Get.width,
                            child: CustomChangeRoundButton(
                              text: "See The Challenges",
                              icon: AppSvgs.nextSvg,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Container(
          //   height: 400.h,
          //   margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(20.sp),
          //     gradient: LinearGradient(
          //       begin: Alignment.topCenter,
          //       end: Alignment.bottomCenter,
          //       colors: [
          //         Colors.black.withOpacity(0.3),
          //         Colors.black.withOpacity(0.7),
          //       ],
          //     ),
          //   ),
          // ),
          // Container(
          //   // height: 400.h,
          //   // margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Expanded(
          //         child: Padding(
          //           padding: EdgeInsets.only(
          //             left: 20.w,
          //             right: 20.w,
          //             top: 20.h,
          //             bottom: 10.h,
          //           ),
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Spacer(),
          //               Text(
          //                 "By $trainerName",
          //                 style: AppStyles.poppins20w600white,
          //               ),
          //               10.verticalSpace,
          //               Container(
          //                 padding: EdgeInsets.symmetric(
          //                   vertical: 5.h,
          //                   horizontal: 10.w,
          //                 ),
          //                 decoration: BoxDecoration(
          //                   borderRadius: BorderRadius.circular(20.sp),
          //                   border: Border.all(
          //                     color: AppColors.whiteColor,
          //                     width: 1.5.w,
          //                   ),
          //                 ),
          //                 child: Text(
          //                   trainerDescription,
          //                   overflow: TextOverflow.ellipsis,
          //                   softWrap: true,
          //                   style: AppStyles.poppins12w300white,
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //       ClipRRect(
          //         borderRadius: BorderRadius.circular(20.sp),
          //         child: BackdropFilter(
          //           filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          //           child: Container(
          //             height: 140.h,
          //             padding: EdgeInsets.symmetric(
          //               horizontal: 20.sp,
          //               vertical: 10.sp,
          //             ),
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(20.sp),
          //               color: AppColors.whiteColor.withOpacity(0.25),
          //             ),
          //             child: Column(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 Container(
          //                   decoration: BoxDecoration(
          //                     borderRadius: BorderRadius.circular(30.sp),
          //                     border: Border.all(
          //                       width: 1.5.w,
          //                       color: AppColors.whiteColor,
          //                     ),
          //                   ),
          //                   child: Row(
          //                     mainAxisAlignment: MainAxisAlignment.center,
          //                     children: [
          //                       RichText(
          //                         text: TextSpan(
          //                           children: [
          //                             TextSpan(
          //                               text: "Win ",
          //                               style: AppStyles.poppins16w300white,
          //                             ),
          //                             TextSpan(
          //                               text: challengesPoints.toString(),
          //                               style: AppStyles.poppins16w600white,
          //                             ),
          //                           ],
          //                         ),
          //                       ),
          //                       SvgPicture.asset(AppSvgs.coinSvg),
          //                     ],
          //                   ),
          //                 ),
          //                 GestureDetector(
          //                   onTap: () {
          //                     onTap();
          //                   },
          //                   child: CustomChangeRoundButton(
          //                     text: "See The Challenges",
          //                     icon: AppSvgs.nextSvg,
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
