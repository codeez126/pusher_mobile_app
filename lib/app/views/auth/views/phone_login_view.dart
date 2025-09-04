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
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/phone_login_controller.dart';

class PhoneLogin extends StatelessWidget {
  PhoneLogin({super.key});

  final PhoneLoginController phoneLoginController = Get.put(
    PhoneLoginController(),
  );
  final FocusNode phoneNumberFocusNode =FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.splashBackground),
              fit: BoxFit.cover,
            ),
          ),
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
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(() {
                      return AnimatedContainer(
                        curve: Curves.easeInOut,
                        duration: const Duration(milliseconds: 500),
                        width: 100.w,
                        height: phoneLoginController.isClickedCountryCode.value
                            ? 200.h
                            : 60.h,
                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: AppColors.whiteColor),
                        ),
                        child: phoneLoginController.isClickedCountryCode.value
                            ? ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: phoneLoginController.countryList.length,
                          itemBuilder: (context, index) {
                            final country =
                            phoneLoginController.countryList[index];
                            return GestureDetector(
                              onTap: () {
                                phoneLoginController.selectedCode.value =
                                    country['code'] ?? '';
                                phoneLoginController.isClickedCountryCode.value =
                                false;
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 6.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      country['flag'] ?? '',
                                      style: AppStyles.poppins14w700darkGrey2,
                                    ),
                                    8.horizontalSpace,
                                    Text(
                                      country['code'] ?? '',
                                      style: AppStyles.poppins14w700darkGrey2.copyWith(color: AppColors.darkGrey2.withOpacity(0.70)),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                            : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              phoneLoginController.selectedCode.value,
                              style: AppStyles.poppins14w700darkGrey2,
                            ),
                            6.horizontalSpace,
                            GestureDetector(
                              onTap: () => phoneLoginController
                                  .isClickedCountryCode.value = true,
                              child: SvgPicture.asset(AppSvgs.arrowDownSvg),
                            ),
                          ],
                        ),
                      );
                    }),
                    10.horizontalSpace,
                    Expanded(
                      child: Container(
                        height: 60.h,
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: AppColors.whiteColor),
                        ),
                        child: Center(
                          child: TextField(
                            focusNode: phoneNumberFocusNode,
                            controller: phoneLoginController.phoneController.value,
                            keyboardType: TextInputType.phone,
                            style: AppStyles.poppins14w700darkGrey2,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 10.w),
                              border: InputBorder.none,
                              hintText: '055-6675589',
                              hintStyle: AppStyles.poppins14w700darkGrey2,
                            ),
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
                        phoneNumberFocusNode.unfocus();
                        FocusScope.of(context).unfocus();
                        phoneNumberLogin();
                      },
                      verticalPadding: 15.h,
                      borderWidth: 1.w,
                      isIcon: false,
                      text: "Login".tr,
                      textStyle: AppStyles.poppins16w600white),
                ),
              ),
              50.verticalSpace,
              Text("Or".tr,style: AppStyles.poppins16w700white,),
              10.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      appleLogin();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.sp,vertical: 20.sp),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.sp),
                          color: AppColors.whiteColor,
                          ),
                      child: Image.asset(AppImages.appleImage,height: 23.h,),
                    ),
                  ),
                  10.horizontalSpace,
                  GestureDetector(
                    onTap: (){
                      googleLogin();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.sp,vertical: 20.sp),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.sp),
                        color: AppColors.whiteColor,
                      ),
                      child: Image.asset(AppImages.googleImage,height: 23.h,),
                    ),
                  ),
                ],
              ),
              Spacer(),
              SvgPicture.asset(AppSvgs.logoSvg,height: 40.h,),
              30.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  void appleLogin() {}

  void googleLogin() {
    //phoneLoginController.googleRegisterWithHardCodeEmails();
    phoneLoginController.googleSignInTry();
  }

  void phoneNumberLogin() {
    phoneLoginController.sendOtp();
  }

}
