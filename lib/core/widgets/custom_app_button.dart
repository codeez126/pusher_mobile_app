import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';
import '../constants/app_fonts_and_styles.dart';
import '../constants/app_images.dart';

class CustomAppButton extends StatelessWidget {
  CustomAppButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.textStyle,
    this.isIcon=true,
    this.isImage=false,
    this.image='',
    this.paddingInsideHorizontal=30,
    this.verticalPadding=12,
    this.borderWidth=1.4,
  });

  String text;
  Function onTap;
  TextStyle textStyle;
  bool isIcon;
  String image;
  bool isImage;
  double paddingInsideHorizontal;
  double verticalPadding;
  double borderWidth;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.lightBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.r),
          side: BorderSide(
            color: AppColors.whiteColor,
            width: borderWidth.sp,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: paddingInsideHorizontal.w, vertical: verticalPadding.h),
      ),
      child: Row(
        mainAxisAlignment: isIcon?MainAxisAlignment.spaceBetween:MainAxisAlignment.center,
        children: [
          if(isImage)Image.asset(image,height: 30.h,),
          Text(
              text,
              style: textStyle,
          ),
          if(isIcon)10.horizontalSpace,
          if(isIcon)Transform.rotate(
            angle: math.pi,
            child: Image.asset(
              AppImages.arrowLeft,
              height: 20.h,width: 15.w,

            ),
          ),
        ],
      ),
    );
  }
}
