import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../Constants/app_colors.dart';
import '../constants/app_fonts_and_styles.dart';
import '../constants/app_images.dart';
import '../constants/app_svgs.dart';

class CustomRegistrationAppBar extends StatelessWidget {
  CustomRegistrationAppBar({
    super.key,
    this.title,
    this.subtitle,
    this.logo,
    this.isProfile = false,
    this.isSubtitle = false,
    this.isTitle = false,
    this.isLogo = false,
    this.isIcon = false,
    this.isImprovement = false,
    this.isTittleAndSubtitle = false,
    this.isPersonalGoals = false,
  });

  String? title;
  String? subtitle;
  String? logo;
  bool isProfile;
  bool isSubtitle;
  bool isImprovement;
  bool isTittleAndSubtitle;
  bool isPersonalGoals;
  bool isTitle;
  bool isLogo;
  bool isIcon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        SizedBox(height: isProfile?250.h:200.h),
        Container(
          height: 170.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(50.sp)),
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
                  child: Image.asset(AppImages.imageBackIcon, height: 120.h),
                ),
              ),
              isLogo
                  ? Positioned(
                    bottom: 35,
                    child: SvgPicture.asset(logo!, height: 50.h),
                  )
                  : isTittleAndSubtitle?Positioned(
                    bottom: 35,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            if(isIcon)Image.asset(
                              AppImages.protectionShield,
                              height: 25.h,
                            ),
                            if(isIcon)20.horizontalSpace,
                            Text(
                              title!,
                              style: AppStyles.urbanistBold28White900,
                            ),
                          ],
                        ),
                        Text(
                          subtitle!,
                          style: AppStyles.poppins16w400darkGrey2,
                        ),
                      ],
                    ),
                  ):SizedBox(),
              if(isImprovement)Positioned(
                bottom: 40.h,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'What Would You Like To\nImprove?',
                          textAlign: TextAlign.center,
                          style: AppStyles.urbanistBold20White900,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if(isPersonalGoals)Positioned(
                bottom: 35,
                child: Column(
                  children: [
                    Text(
                      "Setting Personal Goals",
                      style: AppStyles.urbanistBold28White900,
                    ),
                    Text(
                      'Based on your selection, pick the \ngoals you want to achieve for \npersonal growth.',
                      textAlign: TextAlign.center,
                      style: AppStyles.poppins12w700white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (isProfile)
          Positioned(
            bottom: 0,
            child: Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 90,
                        height: 90,
                        padding: EdgeInsets.all(9.sp),
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        padding: EdgeInsets.all(9.sp),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.whiteColor,
                            width: 1.5.w,
                          ),
                        ),
                        child: SvgPicture.asset(AppSvgs.cameraSvg, height: 30.h),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: InkWell(
                          onTap: () {},
                          child: Image.asset(
                            AppImages.addPng,
                            height: 50.h, // provide a valid height
                          ),
                        ),
                      ),
                    ],
                  ),
                  8.verticalSpace,
                  Text(
                    'Add a profile image',
                    style: AppStyles.poppins12w700white,
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
