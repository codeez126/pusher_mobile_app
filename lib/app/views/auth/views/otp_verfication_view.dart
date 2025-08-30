import 'package:base_project/app/routes/app_routes.dart';
import 'package:base_project/app/views/auth/controllers/phone_login_controller.dart';
import 'package:base_project/app/views/auth/model/verify_otp_response_model.dart';
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

class OtpVerficationView extends StatefulWidget {
  const OtpVerficationView({super.key});

  @override
  State<OtpVerficationView> createState() => _OtpVerficationViewState();
}

class _OtpVerficationViewState extends State<OtpVerficationView> {
  final PhoneLoginController phoneLoginController = Get.put(
    PhoneLoginController(),
  );
  final FocusNode otpFocusNode = FocusNode();


  late String phoneNumber;

  @override
  void initState() {
    super.initState();
    final args = Get.arguments as Map<String, dynamic>;
    phoneNumber = args['phoneNumber'];
  }

  @override
  void dispose() {
    otpFocusNode.dispose();
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
                  focusNode: otpFocusNode,
                  controller: phoneLoginController.otpTextController.value,
                  defaultPinTheme: PinTheme(
                    textStyle: AppStyles.poppins14w700darkGrey2,
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
                height: 50.h,
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.sp),
                  color: AppColors.whiteColor.withOpacity(0.25),
                  border: Border.all(color: AppColors.whiteColor, width: 1.5.w),
                ),

                child: Obx(() {
                  return Text(
                    phoneLoginController.errorToShow.value.tr,
                    style: phoneLoginController.successCondition.value?AppStyles.poppins14w700white.copyWith(color: AppColors.greenColor):AppStyles.poppins14w700white.copyWith(color: AppColors.redColor.withOpacity(0.5)),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  );
                }),
              ),
              20.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't receive the code?".tr,
                    style: AppStyles.poppins12w700white,
                  ),
                  GestureDetector(
                    onTap: (){
                      resendOtp();
                    },
                    child: Text(
                      " Resend it now",
                      style: AppStyles.poppins14w700white,
                    ),
                  ),
                ],
              ),
              20.verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: CustomAppButton(
                    onTap: () {
                      otpFocusNode.unfocus();
                      FocusScope.of(context).unfocus();
                      otpVerfication();
                    },
                    isIcon: false,
                    verticalPadding: 15.h,
                    borderWidth: 1.w,
                    text: "OK".tr,
                    textStyle: AppStyles.poppins16w700white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void otpVerfication() {
    print(phoneLoginController.otpTextController.value.text);
    String phone = phoneLoginController.selectedCode.value.replaceAll('+', '') + phoneLoginController.phoneController.value.text;
    phoneNumber = phone;
    print("PhoneNumber: $phone");
    phoneLoginController.verifyOtp(phone);
    //Get.toNamed(AppRoutes.profileRegistrationView);
  }

  void resendOtp() {}

}
