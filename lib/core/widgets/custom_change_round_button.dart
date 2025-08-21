import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../Constants/app_colors.dart';
import '../constants/app_fonts_and_styles.dart';
import '../constants/app_svgs.dart';

class CustomChangeRoundButton extends StatelessWidget {
  CustomChangeRoundButton({super.key,required this.text,required this.icon});

  String text;
  String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightBlue,
        borderRadius: BorderRadius.circular(35.sp),
        border: Border.all(
          width: 1.5.w,
          color: AppColors.whiteColor,
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 10.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: AppStyles.poppins16w600white,
          ),
          5.horizontalSpace,
          SvgPicture.asset(
            icon,
            height: 30.h,
          )
        ],
      ),
    );
  }
}
