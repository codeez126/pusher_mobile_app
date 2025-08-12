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
                logo: AppSvgs.logo,
              ),
              30.verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.white30),
                          ),
                          child: Row(
                            children: [
                              Obx(
                                () => DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value:
                                        phoneLoginController.selectedCode.value,
                                    dropdownColor: AppColors.darkGrey2,
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.white,
                                    ),
                                    items:
                                        phoneLoginController.countryCodes.map((
                                          code,
                                        ) {
                                          return DropdownMenuItem<String>(
                                            value: code,
                                            child: Text(
                                              code,
                                              style: TextStyle(
                                                color: AppColors.whiteColor,
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                    onChanged: (value) {
                                      phoneLoginController.selectedCode.value =
                                          value!;
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        10.horizontalSpace,
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.white30),
                            ),
                            child: TextField(
                              controller: phoneLoginController.phoneController,
                              keyboardType: TextInputType.phone,
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: '055-6675589',
                                hintStyle: TextStyle(color: Colors.white70),
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
                      onTap: (){
                        Get.toNamed(AppRoutes.otpVerificationView);
                        final phone =
                            '${phoneLoginController.selectedCode.value}${phoneLoginController.phoneController.text}';
                        print('Login attempt with: $phone');
                      },
                      isIcon: false,
                      text: "Login".tr,
                      textStyle:AppStyles.poppins16w600white ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
