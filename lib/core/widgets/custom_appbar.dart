import 'package:base_project/core/constants/app_strings.dart';
import 'package:base_project/core/constants/app_svgs.dart';
import 'package:base_project/core/utils/text_styles.dart';
import 'package:base_project/core/widgets/custom_search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

PreferredSizeWidget customAppBar() {
  return PreferredSize(
    preferredSize: Size.fromHeight(142.h),
    child: Container(
      width: double.infinity,
      height: 142.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(15.r),
          bottomLeft: Radius.circular(15.r),
        ),
        gradient: const LinearGradient(
          colors: [Color(0xFF8C37F8), Color(0xFFD51BF9)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(AppSvgs.drawer, height: 18.h),
                Text(
                  AppStrings.home,
                  style: TextStyles.mediumw600(
                    Get.context!,
                  ).copyWith(color: Colors.white, fontSize: 18.sp),
                ),
                SvgPicture.asset(AppSvgs.bell, height: 18.h),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                Expanded(child: CustomSearchField(hintText: "Search")),
                SizedBox(width: 10.w),
                SvgPicture.asset(AppSvgs.filter, height: 36.h),
              ],
            ),
          ).marginOnly(top: 10.h),
        ],
      ).marginOnly(top: 15.h),
    ),
  );
}
