import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Constants/app_colors.dart';
import '../../constants/app_fonts_and_styles.dart';
import '../../constants/app_svgs.dart';

class CustomCourseDurationContainer extends StatelessWidget {
  CustomCourseDurationContainer({super.key,required this.text});

  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10.sp),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(25.sp),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppSvgs.clockSvg),
          5.horizontalSpace,
          Text(
            text.tr,
            style: AppStyles.poppins12w700darkGrey2,
          ),
        ],
      ),
    );
  }
}
