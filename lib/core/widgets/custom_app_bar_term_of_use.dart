import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../Constants/app_colors.dart';
import '../constants/app_fonts_and_styles.dart';

class CustomAppBarTermOfUse extends StatelessWidget {
  CustomAppBarTermOfUse({super.key,required this.tittle});

  String tittle;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(bottom: 20.h),
      height: 100.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(50.sp),
        ),
        color: AppColors.whiteColor.withOpacity(0.30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 25.h,
                        color: AppColors.darkGrey2,
                      ),
                    ),
                  ),
                ),
                Text(
                  tittle.tr,
                  style: AppStyles.poppins16w600darkGrey2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
