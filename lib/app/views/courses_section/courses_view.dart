import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/Constants/app_colors.dart';
import '../../../core/constants/app_fonts_and_styles.dart';
import '../../../core/constants/app_images.dart';
import '../../../core/constants/app_svgs.dart';

class CoursesView extends StatelessWidget {
  const CoursesView({super.key});

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
              clipBehavior: Clip.none,
              fit: StackFit.passthrough,
              alignment: Alignment.topCenter,
              children: [
                Container(height: 140.h),
                Container(
                  height: 100.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(50.sp),
                    ),
                    color: AppColors.whiteColor.withOpacity(0.20),
                  ),
                  child: Stack(children: []),
                ),
                Positioned(
                  bottom: 10,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                      width: 200.w,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.45),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: AppColors.whiteColor),
                      ),
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        style: AppStyles.poppins12w600darkGrey2,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              AppSvgs.searchSvg,
                              color: AppColors.darkGrey2,
                              height: 20.h,
                              width: 20.w,
                            ),
                          ),
                          hintText: 'Search',
                          hintStyle: AppStyles.poppins12w600darkGrey2,
                        ),
                      ),
                    )
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
