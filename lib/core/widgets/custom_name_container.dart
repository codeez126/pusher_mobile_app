import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Constants/app_colors.dart';
import '../constants/app_fonts_and_styles.dart';

class CustomNameContainer extends StatelessWidget {
  CustomNameContainer({super.key,
    required this.controller,
    required this.textSection,
    required this.hintText,

  });

  TextEditingController controller;
  String textSection;
  String hintText;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              textSection,
              style: AppStyles.poppins14w700white
          ),
          8.verticalSpace,
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20.sp),
              border: Border.all(
                color: AppColors.whiteColor,
                width: 1.2.w,
              ),
            ),
            child: TextField(
              controller: controller,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: AppStyles.poppins14w700darkGrey2,
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
