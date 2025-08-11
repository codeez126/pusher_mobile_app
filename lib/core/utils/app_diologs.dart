import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

class AppDialogs {
  static successSnackBar(String msg) {
    if (msg.isNotEmpty) {
      return ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.greenColor,
          content: Text(
            msg,
            style: GoogleFonts.rubik(fontSize: 14.sp, color: Colors.white),
          ),
        ),
      );
    }
  }

  static errorSnackBar(String msg) {
    if (msg.isNotEmpty) {
      return ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.redColor,
          content: Text(
            msg,
            style: GoogleFonts.rubik(fontSize: 14.sp, color: Colors.white),
          ),
        ),
      );
    }
  }

  static errorSnackBarTop(String msg) {
    if (msg.isNotEmpty) {
      return Get.showSnackbar(
        GetSnackBar(
          message: msg,
          duration: const Duration(seconds: 3),
          backgroundColor: AppColors.redColor,
          snackPosition: SnackPosition.TOP,
        ),
      );
    }
  }
}
