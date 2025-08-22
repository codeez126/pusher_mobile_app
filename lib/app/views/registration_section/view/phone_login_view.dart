import 'dart:ui';

import 'package:base_project/app/routes/app_routes.dart';
import 'package:base_project/core/Constants/app_colors.dart';
import 'package:base_project/core/constants/app_font_sizes.dart';
import 'package:base_project/core/constants/app_fonts_and_styles.dart';
import 'package:base_project/core/constants/app_images.dart';
import 'package:base_project/core/constants/app_svgs.dart';
import 'package:base_project/core/widgets/custom_app_button.dart';
import 'package:base_project/core/widgets/custom_registration_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/phone_login_controller.dart';

class PhoneLogin extends StatelessWidget {
  PhoneLogin({super.key});

  final PhoneLoginController phoneLoginController = Get.put(
    PhoneLoginController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.splashBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomRegistrationAppBar(
                isLogo: true,
                logo: AppSvgs.logoSvg,
              ),
              30.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Phone".tr,
                      style: GoogleFonts.poppins(
                        color: AppColors.whiteColor,
                        fontSize: FontSizes.pt14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              20.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child:Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(() {
                            return AnimatedContainer(
                              curve: Curves.easeInOut,
                              duration: const Duration(milliseconds: 1000),
                              width: 120.w,
                              height: phoneLoginController.isClickedCountryCode
                                  .value ? 200.h : 60.h,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.w, vertical: 10.h),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: AppColors.whiteColor),
                              ),
                              child: phoneLoginController.isClickedCountryCode
                                  .value
                                  ? ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: phoneLoginController.countryList
                                    .length,
                                itemBuilder: (context, index) {
                                  final country = phoneLoginController
                                      .countryList[index];
                                  return GestureDetector(
                                    onTap: () {
                                      phoneLoginController.selectedCode.value =
                                          country['code'] ?? '';
                                      phoneLoginController.isClickedCountryCode
                                          .value = false;
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 6.h),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            country['flag'] ?? '',
                                            style: GoogleFonts.poppins(
                                              color: AppColors.whiteColor,
                                              fontSize: FontSizes.pt16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          8.horizontalSpace,
                                          Text(
                                            country['code'] ?? '',
                                            style: AppStyles
                                                .poppins12w600darkGrey2,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              )
                                  : Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  // Selected flag
                                  Text(
                                    phoneLoginController.countryList.firstWhere(
                                          (c) =>
                                      c['code'] ==
                                          phoneLoginController.selectedCode
                                              .value,
                                      orElse: () =>
                                      phoneLoginController.countryList.first,
                                    )['flag']!,
                                    style: GoogleFonts.poppins(
                                      color: AppColors.whiteColor,
                                      fontSize: FontSizes.pt16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  8.horizontalSpace,

                                  // Selected code
                                  Text(
                                    phoneLoginController.selectedCode.value,
                                    style: AppStyles.poppins12w600darkGrey2,
                                  ),

                                  // Dropdown arrow
                                  GestureDetector(
                                    onTap: () {
                                      phoneLoginController.isClickedCountryCode
                                          .value = true;
                                    },
                                    child: Icon(
                                      Icons.arrow_drop_down,
                                      color: AppColors.darkGrey2,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                          10.horizontalSpace,
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: AppColors.whiteColor),
                              ),
                              child: TextField(
                                controller: phoneLoginController
                                    .phoneController,
                                keyboardType: TextInputType.phone,
                                style: AppStyles.poppins12w600darkGrey2,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '055-6675589',
                                  hintStyle: AppStyles.poppins12w600darkGrey2,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                  ),
                  ),
                ),
              30.verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: CustomAppButton(
                      onTap: () {
                        phoneNumberLogin();
                      },
                      isIcon: false,
                      text: "Login".tr,
                      textStyle: AppStyles.poppins16w600white),
                ),
              ),
              50.verticalSpace,
              Text("Or".tr,style: AppStyles.poppins16w700white,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      appleLogin();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.sp,vertical: 22.sp),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.sp),
                          color: AppColors.whiteColor,
                          ),
                      child: Image.asset(AppImages.appleImage,height: 25.h,),
                    ),
                  ),
                  10.horizontalSpace,
                  GestureDetector(
                    onTap: (){
                      googleLogin();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.sp,vertical: 22.sp),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.sp),
                        color: AppColors.whiteColor,
                      ),
                      child: Image.asset(AppImages.googleImage,height: 25.h,),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void appleLogin() {}

  void googleLogin() {}

  void phoneNumberLogin() {

    // Get.toNamed(AppRoutes.otpVerificationView);
    // final phone =
    //     '${phoneLoginController.selectedCode
    //     .value}${phoneLoginController.phoneController
    //     .text}';
    // print('Login attempt with: $phone');
    final phoneWithCode =
        '${phoneLoginController.selectedCode
        .value}${phoneLoginController.phoneController
        .text}';
    print('Full Phone: $phoneWithCode');
    if (phoneWithCode
        .replaceAll(RegExp(r'\D'), '')
        .length < 8) {
      print("Invalid phone number");
    } else {
      //GetStorage().write('phone', phoneWithCode);
      Get.toNamed(AppRoutes.otpVerificationView);
    }

  }
}
