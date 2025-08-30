import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../Constants/app_colors.dart';
import '../../constants/app_fonts_and_styles.dart';
import '../../constants/app_svgs.dart';

class CustomCategoryList extends StatelessWidget {
  CustomCategoryList({
    super.key,
    required this.categoryName,
    required this.child,
  });

  String categoryName;
  Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          // margin: EdgeInsets.only(bottom: 20),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4.h),
          decoration: BoxDecoration(
            color: AppColors.whiteColor.withOpacity(0.40),
            border: Border(
              top: BorderSide(color: AppColors.lightBlue, width: 1.w),
              left: BorderSide(color: AppColors.lightBlue, width: 1.w),
              right: BorderSide(color: AppColors.lightBlue, width: 1.w),
            ),
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
          ),
          child: Text(
            categoryName,
            style: AppStyles.poppins16w600darkGrey2.copyWith(),
          ),
        ),
        Container(
          height: 220,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(width: 1.w, color: AppColors.lightBlue),
            ),
            gradient: LinearGradient(
              colors: [
                AppColors.whiteColor.withOpacity(0.6),
                AppColors.whiteColor.withOpacity(0.05),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.only(topRight: Radius.circular(25.sp)),
          ),
          child: child,
        ),
      ],
    );
  }
}
