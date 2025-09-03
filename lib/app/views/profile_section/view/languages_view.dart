import 'package:base_project/core/constants/app_fonts_and_styles.dart';
import 'package:base_project/core/widgets/languages_view/custom_languages_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/constants/app_svgs.dart';

class LanguagesView extends StatefulWidget {
  const LanguagesView({super.key});

  @override
  State<LanguagesView> createState() => _LanguagesViewState();
}

class _LanguagesViewState extends State<LanguagesView> {
  bool isHebrew = false;
  bool isEnglish = false;

  @override
  void initState() {
    super.initState();
    final currentLocale = Get.locale?.languageCode ?? "en";
    if (currentLocale == "he") {
      isHebrew = true;
      isEnglish = false;
    } else {
      isEnglish = true;
      isHebrew = false;
    }
  }

  void _changeLanguage(Locale locale) {
    Get.updateLocale(locale);
    setState(() {
      if (locale.languageCode == 'he') {
        isHebrew = true;
        isEnglish = false;
      } else {
        isEnglish = true;
        isHebrew = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.editProfileBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(height: 180.h),
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.only(bottom: 20.h),
                  height: 150.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(50.sp),
                    ),
                    color: AppColors.whiteColor.withOpacity(0.30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AppSvgs.languagesIconSvg),
                      5.horizontalSpace,
                      Text(
                        "Languages".tr,
                        style: AppStyles.poppins20w600darkGrey2,
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Get.back();
                    },
                    child: Image.asset(AppImages.backImage, height: 130.h),
                  ),
                ),
              ],
            ),
            10.verticalSpace,
            CustomLanguagesTile(
              title: "עברית",
              valueCheck: isHebrew,
              onTap: (value) {
                if (value == true) {
                  _changeLanguage(const Locale('he', 'IL'));
                }
              },
            ),
            10.verticalSpace,
            CustomLanguagesTile(
              title: "English",
              valueCheck: isEnglish,
              onTap: (value) {
                if (value == true) {
                  _changeLanguage(const Locale('en', 'US'));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
