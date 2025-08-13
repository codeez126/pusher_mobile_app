import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../Constants/app_colors.dart';
import '../../constants/app_fonts_and_styles.dart';
import '../../constants/app_svgs.dart';

class CustomLanguagesTile extends StatelessWidget {
  CustomLanguagesTile({
    super.key,
    required this.title,
    required this.valueCheck,
    required this.onTap,
  });

  final String title;
  final bool valueCheck;
  final Function(bool?) onTap; // now properly typed

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: AppColors.whiteColor.withOpacity(0.70),
        borderRadius: BorderRadius.circular(12.sp),
        border: Border.all(
          color: AppColors.lightBlue,
          width: 1.w,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppStyles.poppins14w700darkGrey2,
          ),
          GestureDetector(
            onTap: () {
              // Pass back the toggled value
              onTap(!valueCheck);
            },
            child: Container(
              width: 23.w,
              height: 23.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.sp),
                color: valueCheck ? AppColors.whiteColor : Colors.transparent,
                border: Border.all(
                  color: AppColors.lightBlue,
                  width: 1.w,
                ),
              ),
              child: valueCheck
                  ? SvgPicture.asset(AppSvgs.tickSvg, height: 10.h)
                  : SizedBox(),
            ),
          ),
        ],
      ),
    );
  }
}
