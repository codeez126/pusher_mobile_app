import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonStyles {
  // Padding inside buttons
  static EdgeInsets buttonPadding = EdgeInsets.symmetric(
    horizontal: 20.w,
    vertical: 14.h,
  );
  // Margin
  static EdgeInsets buttonMargin = EdgeInsets.only(bottom: 16.h);
  // Height and Width
  static double buttonHeight = 40.h;
  static double buttonTextSize = 16.sp;
  static FontWeight buttonWeight = FontWeight.w600;
  static double buttonWidth = double.infinity;
  // Radius
  static double buttonRadius = 6.r;

  // Icon size
  static double iconSize = 20.w;
}
