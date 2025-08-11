import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonStyles {
  // Padding
  static EdgeInsets pagePadding = EdgeInsets.symmetric(
    horizontal: 16.w,
    vertical: 12.h,
  );
  static EdgeInsets cardPadding = EdgeInsets.all(12.w);
  static EdgeInsets sectionPadding = EdgeInsets.symmetric(
    horizontal: 20.w,
    vertical: 16.h,
  );

  // Margin
  static EdgeInsets sectionMargin = EdgeInsets.only(bottom: 20.h);
  static EdgeInsets topMargin = EdgeInsets.only(top: 16.h);
  static EdgeInsets bottomMargin = EdgeInsets.only(bottom: 16.h);

  // Spacing
  static double verticalSpace = 16.h;
  static double horizontalSpace = 16.w;

  // Radius
  static double borderRadius = 12.r;
  static double smallRadius = 8.r;
  static double largeRadius = 20.r;
}
