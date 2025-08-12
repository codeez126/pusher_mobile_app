import 'package:base_project/app/routes/app_routes.dart';
import 'package:base_project/core/constants/app_font_sizes.dart';
import 'package:base_project/core/constants/app_fonts_and_styles.dart';
import 'package:base_project/core/widgets/custom_app_button.dart';
import 'package:base_project/core/widgets/custom_registration_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import '../../../../core/Constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';
import '../controller/otp_verification_controller.dart';

class OtpVerficationView extends StatefulWidget {
  const OtpVerficationView({super.key});

  @override
  State<OtpVerficationView> createState() => _OtpVerficationViewState();
}

class _OtpVerficationViewState extends State<OtpVerficationView> {
  final OtpVerificationController otpController = Get.put(
    OtpVerificationController(),
  );

  // List<int> tapCounts = List.filled(6, 0);

  @override
  void initState() {
    super.initState();
    //otpController.clearingLogic();
  }

  @override
  void dispose() {
    //otpController.disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.splashBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomRegistrationAppBar(
                isTittleAndSubtitle: true,
                title: "verification".tr,
                subtitle: "Enter Your Verification Code".tr,
                isIcon: true,
              ),
              Container(
                padding: EdgeInsets.all(10.sp),
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.sp),
                  color: AppColors.whiteColor.withOpacity(0.25),
                  border: Border.all(color: AppColors.whiteColor, width: 1.5.w),
                ),
                child: Pinput(
                  length: 6,
                  defaultPinTheme: PinTheme(
                    width: 45.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(25.sp),
                      border: Border.all(
                        color: AppColors.whiteColor,
                        width: 2.w,
                      ),
                    ),
                  ),
                ),
              ),
              30.verticalSpace,
              Container(
                height: 40.h,
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.sp),
                  color: AppColors.whiteColor.withOpacity(0.25),
                  border: Border.all(color: AppColors.whiteColor, width: 1.5.w),
                ),

                child: Center(
                  child: Text(
                    "Invalid code. Enter the correct verification code".tr,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: FontSizes.pt12,
                      color: AppColors.redColor,
                    ),
                  ),
                ),
              ),
              20.verticalSpace,
              InkWell(
                onTap: (){
                  print('Resend Code');
                },
                child: Text(
                  "Didn't receive the code? Resend it now".tr,
                  style: GoogleFonts.poppins(
                    color: AppColors.whiteColor,
                    fontSize: FontSizes.pt12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              20.verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: CustomAppButton(onTap: (){
                    Get.toNamed(AppRoutes.profileRegistrationView);
                  }, text: "OK".tr, textStyle: AppStyles.poppins16w700white)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
