import 'dart:math' as math;
import 'dart:ui';

import 'package:base_project/app/routes/app_routes.dart';
import 'package:base_project/core/constants/app_colors.dart';
import 'package:base_project/core/constants/app_fonts_and_styles.dart';
import 'package:base_project/core/constants/app_images.dart';
import 'package:base_project/core/constants/app_strings.dart';
import 'package:base_project/core/constants/app_svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/widgets/custom_app_button.dart';

class Onboarding2View extends StatelessWidget {
  const Onboarding2View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 1.sh,
        width: 1.sw,
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
              child: SvgPicture.asset(AppSvgs.logo,height: 55.h,),
            ),

            // Updated Scrollable Blurred Bottom Container
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
                      constraints: BoxConstraints(
                        minHeight: 400.h,
                      ),
                      child: IntrinsicHeight(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
                              child: Text(
                                AppStrings.yourJourney,
                                style: AppStyles.urbanistBold28White900,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Text(
                              AppStrings.everyoneJourney,
                              style: GoogleFonts.poppins(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.whiteColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              AppStrings.chooseYourGoals,
                              style: GoogleFonts.poppins(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.yellow,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              AppStrings.letUsCustomize,
                              style: GoogleFonts.poppins(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.whiteColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            10.verticalSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 10.h,
                                  width: 10.h,
                                  decoration: BoxDecoration(
                                      color: AppColors.grey,
                                      shape: BoxShape.circle,
                                    border: Border.all(width: 1.5.w,color: AppColors.whiteColor)
                                  ),
                                ),
                                3.horizontalSpace,
                                Container(
                                  height: 10.h,
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.sp),
                                    color: AppColors.whiteColor,
                                      ),
                                )
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor.withOpacity(0.35),
                                borderRadius: BorderRadius.circular(40.sp),
                              ),
                              margin: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 15.sp),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CustomAppButton(
                                    onTap: (){Get.toNamed(AppRoutes.phoneLogin);},
                                    text: 'Next',
                                    textStyle: AppStyles.poppins16w700white),
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
