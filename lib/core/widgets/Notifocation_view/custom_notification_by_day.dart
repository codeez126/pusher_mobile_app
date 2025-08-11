import 'package:base_project/core/constants/app_fonts_and_styles.dart';
import 'package:base_project/core/widgets/Notifocation_view/custom_notification_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Constants/app_colors.dart';

class CustomNotificationByDay extends StatelessWidget {
  CustomNotificationByDay({super.key,required this.weekday});

  String weekday;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.whiteColor.withOpacity(0.15.sp),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.whiteColor,
          width: 1.w,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            weekday,
            style: AppStyles.poppins16w700darkGrey2
          ),
          8.verticalSpace,
          CustomNotificationItem(
            time: '08:30',
            message:'You Didn\'t Complete Your Daily Challenge',
          ),
          8.verticalSpace,
          CustomNotificationItem(time: '10:30', message:'You Didn\'t Complete Your Daily Challenge'),
          8.verticalSpace,
          CustomNotificationItem(time: '16:00', message:'You Didn\'t Complete Your Daily Challenge'),
          8.verticalSpace,
          CustomNotificationItem(time: '18:30', message:'You Didn\'t Complete Your Daily Challenge'),
          5.verticalSpace,
        ],
      ),
    );
  }
}
