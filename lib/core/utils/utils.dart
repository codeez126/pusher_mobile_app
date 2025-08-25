import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../Constants/app_colors.dart';

class Utils {
  static void printData(String message) {
    print('--------------------------------------');
    print('Message : $message');
    print('--------------------------------------');
  }

  static toastMessage(String message, {bool? isError}) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: isError == true ? Colors.redAccent : AppColors.darkGrey2,
      textColor: AppColors.dividerColor,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static String get2DecimalValue(String value) {
    return double.tryParse(value)!.toStringAsFixed(2);
  }

  ///Hex to Color
  static Color hexToColor(String code) {
    return new Color(int.parse(code, radix: 16) + 0xFF000000);
  }

  static bool isNullOrEmptyList(List<dynamic> value) {
    try {
      if (value != null && value.length > 0) {
        return true;
      }
      return false;
    } catch (ex) {
      print(ex);
      return false;
    }
  }

  static bool isNullOrEmpty(dynamic value) {
    try {
      if (value != null && value != "") {
        return true;
      }
      return false;
    } catch (ex) {
      print(ex);
      return false;
    }
  }

  static bool isValidEmail(String email) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(pattern);

    return regExp.hasMatch(email);
  }

  static void showLoader() {
    if (!(Get.isDialogOpen ?? true)) {
      Get.dialog(
        Center(
          child: Container(
            height: 50,
            width: 50,
            child: CircularProgressIndicator(
              strokeWidth: 5.w,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.lightBlue),
            ),
          ),
        ),
      );
    }
  }

  static void hideLoader() {
    if ((Get.isDialogOpen ?? false)) {
      Navigator.pop(Get.context!);
    }
  }
}
