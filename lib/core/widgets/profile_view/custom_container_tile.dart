import 'package:base_project/core/Constants/app_colors.dart';
import 'package:base_project/core/constants/app_images.dart';
import 'package:base_project/core/constants/app_svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/app_font_sizes.dart';
import '../../constants/app_fonts_and_styles.dart';

class CustomContainerTile extends StatelessWidget {
  CustomContainerTile({super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.borderColor = AppColors.lightBlue,
    this.containerColor = AppColors.whiteColor,
    this.titleColor= AppColors.darkGrey2,
  });

  String icon;
  String title;
  VoidCallback onTap;
  Color borderColor;
  Color containerColor;
  Color? titleColor;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: borderColor,
            width: 1.w,
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(icon,height: 25.h,),
            12.horizontalSpace,
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.poppins(
                    fontSize: FontSizes.pt14,
                    fontWeight: FontWeight.w700,
                    color: titleColor),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
