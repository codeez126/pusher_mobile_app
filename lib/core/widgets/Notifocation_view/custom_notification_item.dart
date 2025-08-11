import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../Constants/app_colors.dart';
import '../../constants/app_fonts_and_styles.dart';
import '../../constants/app_images.dart';

class CustomNotificationItem extends StatelessWidget {
  CustomNotificationItem({super.key,required this.time,required this.message});

  String time;
  String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.40),
        borderRadius: BorderRadius.circular(10.sp),
        border: Border.all(color: AppColors.whiteColor, width: 1.2.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(AppImages.clockSvg),
              2.horizontalSpace,
              Text(
                  time,
                  style: AppStyles.poppins12w600darkGrey2
              ),
            ],
          ),
          4.verticalSpace,
          Container(
            height: 50.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.sp),
              border: Border.all(color: AppColors.whiteColor, width: 1.w),
              color: AppColors.whiteColor.withOpacity(0.60),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppImages.notificationBellSvg, height: 20.h),
                  5.horizontalSpace,
                  Expanded(
                    child: Text(
                      message,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.poppins12w600darkGrey2,
                    ),
                  ),
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}
