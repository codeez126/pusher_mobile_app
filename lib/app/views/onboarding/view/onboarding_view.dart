import 'dart:math' as math;
import 'dart:ui';

import 'package:base_project/app/routes/app_routes.dart';
import 'package:base_project/core/constants/app_colors.dart';
import 'package:base_project/core/constants/app_fonts_and_styles.dart';
import 'package:base_project/core/constants/app_images.dart';
import 'package:base_project/core/constants/app_strings.dart';
import 'package:base_project/core/constants/app_svgs.dart';
import 'package:base_project/core/widgets/custom_app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.onboardingBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 80.h),
              child: SvgPicture.asset(AppSvgs.logoSvg, height: 55.h),
            ),
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(80.sp),
                topRight: Radius.circular(80.sp),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor.withOpacity(0.25),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(80.sp),
                      topRight: Radius.circular(80.sp),
                    ),
                  ),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minHeight: 400.h),
                      child: IntrinsicHeight(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.w,
                                vertical: 20.h,
                              ),
                              child: Text(
                                "Start Your Self Improvement Journey Today!".tr,
                                style: AppStyles.urbanistBold28White900,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Text(
                              "Setting Goals Is Easy, Achieving Them- ".tr,
                              style: GoogleFonts.poppins(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.whiteColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "That's Where We Shine.".tr,
                              style: GoogleFonts.poppins(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.yellow,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "Ditch The Fear, Embrace Change,".tr,
                              style: GoogleFonts.poppins(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.whiteColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "And Get Ready To Transform!".tr,
                              style: GoogleFonts.poppins(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.whiteColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            10.verticalSpace,
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor.withOpacity(0.35),
                                borderRadius: BorderRadius.circular(40.sp),
                              ),
                              margin: EdgeInsets.symmetric(
                                horizontal: 15.sp,
                                vertical: 15.sp,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CustomAppButton(
                                  onTap: () {
                                    Get.toNamed(AppRoutes.onboarding2View);
                                  },
                                  text: 'Next'.tr,
                                  textStyle: AppStyles.poppins16w700white,
                                ),
                              ),
                            ),
                            20.verticalSpace,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
