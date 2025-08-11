
import 'dart:ui';
import 'package:base_project/core/constants/app_font_sizes.dart';
import 'package:flutter/material.dart';
import 'package:base_project/core/Constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts{

  static const String urbanistBold = "urbanist_latin_900";

}

class AppStyles{

  static const TextStyle urbanistBold28White900 = TextStyle(
    color: AppColors.whiteColor,
    fontFamily: AppFonts.urbanistBold,
    fontSize: FontSizes.pt28,
    fontWeight: FontWeight.w900,
  );
  static const TextStyle urbanistBold32White900 = TextStyle(
    color: AppColors.whiteColor,
    fontFamily: AppFonts.urbanistBold,
    fontSize: FontSizes.pt32,
    fontWeight: FontWeight.w900,
  );
  static const TextStyle urbanistBold20White900 = TextStyle(
    color: AppColors.whiteColor,
    fontFamily: AppFonts.urbanistBold,
    fontSize: FontSizes.pt20,
    fontWeight: FontWeight.w900,
  );
  static const TextStyle urbanistBold30Yellow700 = TextStyle(
    color: AppColors.yellow,
    fontFamily: AppFonts.urbanistBold,
    fontSize: FontSizes.pt30,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle urbanistBold30LightBlue700 = TextStyle(
    color: AppColors.lightBlue,
    fontFamily: AppFonts.urbanistBold,
    fontSize: FontSizes.pt30,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle urbanistBold20White600 = TextStyle(
    color: AppColors.whiteColor,
    fontFamily: AppFonts.urbanistBold,
    fontSize: FontSizes.pt20,
    fontWeight: FontWeight.w600,
  );

  /// GoogleFonts Poppin
  static TextStyle poppins14w700white = GoogleFonts.poppins(fontSize: FontSizes.pt14,fontWeight: FontWeight.w700,color: AppColors.whiteColor);
  static TextStyle poppins14w700darkGrey2 = GoogleFonts.poppins(fontSize: FontSizes.pt14,fontWeight: FontWeight.w700,color: AppColors.darkGrey2);
  static TextStyle poppins12w700white = GoogleFonts.poppins(fontSize: FontSizes.pt12,fontWeight: FontWeight.w700,color: AppColors.whiteColor);
  static TextStyle poppins28w300white = GoogleFonts.poppins(fontSize: FontSizes.pt28,fontWeight: FontWeight.w300,color: AppColors.whiteColor);
  static TextStyle poppins12w600darkGrey2 = GoogleFonts.poppins(fontSize: FontSizes.pt12,fontWeight: FontWeight.w600,color: AppColors.darkGrey2);
  static TextStyle poppins13w700white = GoogleFonts.poppins(fontSize: FontSizes.pt13,fontWeight: FontWeight.w700,color: AppColors.whiteColor);
  static TextStyle poppins10w700white = GoogleFonts.poppins(fontSize: FontSizes.pt10,fontWeight: FontWeight.w700,color: AppColors.whiteColor);
  static TextStyle poppins16w700white = GoogleFonts.poppins(fontWeight: FontWeight.w700, fontSize: FontSizes.pt16, color: AppColors.whiteColor,);
  static TextStyle poppins16w600white = GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: FontSizes.pt16, color: AppColors.whiteColor,);
  static TextStyle poppins20w600white = GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: FontSizes.pt20, color: AppColors.whiteColor,);
  static TextStyle poppins24w600white = GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: FontSizes.pt24, color: AppColors.whiteColor,);
  static TextStyle poppins24w300white = GoogleFonts.poppins(fontWeight: FontWeight.w300, fontSize: FontSizes.pt24, color: AppColors.whiteColor,);
  static TextStyle poppins28w600white = GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: FontSizes.pt28, color: AppColors.whiteColor,);
  static TextStyle poppins16w700darkGrey2 = GoogleFonts.poppins(fontWeight: FontWeight.w700, fontSize: FontSizes.pt16, color: AppColors.darkGrey2,);
  static TextStyle poppins14w500white = GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: FontSizes.pt14, color: AppColors.whiteColor,);
  static TextStyle poppins20w600darkGrey2 = GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: FontSizes.pt20, color: AppColors.darkGrey2,);
  static TextStyle poppins16w400darkGrey2 = GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: FontSizes.pt16, color: AppColors.darkGrey2,);
  static TextStyle poppins16w900darkGrey2 = GoogleFonts.poppins(fontWeight: FontWeight.w900, fontSize: FontSizes.pt16, color: AppColors.darkGrey2,);

  //GoogleFonts.poppins(fontSize: FontSizes.pt14,fontWeight: FontWeight.w700,color: AppColors.whiteColor)


}