import 'package:base_project/core/constants/app_svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../Constants/app_colors.dart';
import '../constants/app_fonts_and_styles.dart';
import '../constants/app_images.dart';

class CustomInfoDialog extends StatelessWidget {
  final String title;
  final String description;

  const CustomInfoDialog({
    Key? key,
    this.title = "Info",
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        height: 220.h,
        width: 170.w,
        padding: EdgeInsets.all(20.sp),
        decoration: BoxDecoration(
          color: AppColors.darkGrey2,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  AppSvgs.infoSvg,
                  color: AppColors.whiteColor,
                ),
                5.horizontalSpace,
                Text(
                  title.tr,
                  style: AppStyles.poppins16w600white,
                ),
              ],
            ),
            10.verticalSpace,
            Expanded(
              child: Text(
                description.tr,
                textAlign: TextAlign.left,
                style: AppStyles.poppins14w500white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
