import 'package:base_project/app/routes/app_routes.dart';
import 'package:base_project/app/views/registration_section/controller/profile_registration_controller.dart';
import 'package:base_project/core/constants/app_fonts_and_styles.dart';
import 'package:base_project/core/constants/app_images.dart';
import 'package:base_project/core/widgets/custom_app_button.dart';
import 'package:base_project/core/widgets/custom_name_container.dart';
import 'package:base_project/core/widgets/custom_registration_app_bar.dart';
import 'package:base_project/core/widgets/gender_selection_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_colors.dart';

class ProfileRegistrationView extends StatefulWidget {
  @override
  _ProfileRegistrationViewState createState() =>
      _ProfileRegistrationViewState();
}

class _ProfileRegistrationViewState extends State<ProfileRegistrationView> {

  final ProfileRegistrationController profileRegistrationController = Get.put(ProfileRegistrationController());
  @override
  void dispose() {
    profileRegistrationController.firstNameController.dispose();
    profileRegistrationController.lastNameController.dispose();
    profileRegistrationController.emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 1.sh,
        width: 1.sw,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.splashBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomRegistrationAppBar(
                  isTittleAndSubtitle: true,
                  title: "My Profile".tr,
                  subtitle: '',
                  isProfile: true,
                ),
                40.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///===========================================Names Fields==============================
                      Row(
                        children: [
                          CustomNameContainer(
                            controller: profileRegistrationController.firstNameController,
                            textSection: "First Name".tr,
                            hintText: 'Or'.tr,
                          ),
                          16.horizontalSpace,
                          CustomNameContainer(
                            controller: profileRegistrationController.lastNameController,
                            textSection: 'Last Name'.tr,
                            hintText: 'Hajim'.tr,
                          ),
                        ],
                      ),
                      24.verticalSpace,
                      ///====================================DOB=========================================================
                     // SizedBox(height: 400.h,child: CustomDatePicker()),
                      Container(
                        padding: EdgeInsets.all(9.sp),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20.sp),
                          border: Border.all(
                            color: AppColors.whiteColor,
                            width: 1.2.w,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Date of birth'.tr,
                              style: AppStyles.poppins14w700white,
                            ),
                            8.verticalSpace,
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(12),
                                      // border: Border.all(
                                      //   color: AppColors.whiteColor,
                                      //   width: 1.2.w,
                                      // ),
                                    ),
                                    child: DropdownButtonFormField<String>(
                                      value: profileRegistrationController.selectedDay,
                                      dropdownColor: AppColors.whiteColor
                                          .withOpacity(0.80),
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 26,
                                          vertical: 10,
                                        ),
                                      ),
                                      items: List.generate(32, (index) {
                                        String day =
                                            index == 0
                                                ? '00'
                                                : index.toString().padLeft(
                                                  2,
                                                  '0',
                                                );
                                        return DropdownMenuItem(
                                          value: day,
                                          child: Text(
                                            day,
                                            style:
                                                AppStyles
                                                    .poppins14w700darkGrey2,
                                          ),
                                        );
                                      }),
                                      onChanged: (value) {
                                        setState(() {
                                          profileRegistrationController.selectedDay = value!;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                12.horizontalSpace,
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(12),
                                      // border: Border.all(
                                      //   color: AppColors.whiteColor,
                                      //   width: 1.2.w,
                                      // ),
                                    ),
                                    child: DropdownButtonFormField<String>(
                                      value: profileRegistrationController.selectedMonth,
                                      dropdownColor: AppColors.whiteColor
                                          .withOpacity(0.80),
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 26,
                                          vertical: 10,
                                        ),
                                      ),
                                      items: List.generate(13, (index) {
                                        String month =
                                            index == 0
                                                ? '00'
                                                : index.toString().padLeft(
                                                  2,
                                                  '0',
                                                );
                                        return DropdownMenuItem(
                                          value: month,
                                          child: Text(
                                            month,
                                            style:
                                                AppStyles
                                                    .poppins14w700darkGrey2,
                                          ),
                                        );
                                      }),
                                      onChanged: (value) {
                                        setState(() {
                                          profileRegistrationController.selectedMonth = value!;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                12.horizontalSpace,
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(12),
                                      // border: Border.all(
                                      //   color: AppColors.whiteColor,
                                      //   width: 1.2.w,
                                      // ),
                                    ),
                                    child: DropdownButtonFormField<String>(
                                      value: profileRegistrationController.selectedYear,
                                      dropdownColor: AppColors.whiteColor
                                          .withOpacity(0.80),
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 10,
                                        ),
                                      ),
                                      items: List.generate(50, (index) {
                                        String year =
                                            (DateTime.now().year - index)
                                                .toString();
                                        return DropdownMenuItem(
                                          value: year,
                                          child: Text(
                                            year,
                                            style:
                                                AppStyles
                                                    .poppins14w700darkGrey2,
                                          ),
                                        );
                                      }),
                                      onChanged: (value) {
                                        setState(() {
                                          profileRegistrationController.selectedYear = value!;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      24.verticalSpace,
                      ///===============================Gender selection======================================
                      Text('Gender', style: AppStyles.poppins14w700white),
                      12.verticalSpace,
                      Row(
                        children: [
                          GenderSelectionContainerWidget(
                            onTap: () {
                              setState(() {
                                profileRegistrationController.selectedGender = 'Male'.tr;
                              });
                            },
                            selectedGender: profileRegistrationController.selectedGender,
                            icon: Icons.male,
                            genderName: 'Male'.tr,
                          ),
                          12.horizontalSpace,
                          GenderSelectionContainerWidget(
                            onTap: () {
                              setState(() {
                                profileRegistrationController.selectedGender = 'Female'.tr;
                              });
                            },
                            selectedGender: profileRegistrationController.selectedGender,
                            icon: Icons.female,
                            genderName: 'Female'.tr,
                          ),
                          12.horizontalSpace,
                          GenderSelectionContainerWidget(
                            onTap: () {
                              setState(() {
                                profileRegistrationController.selectedGender = 'Other'.tr;
                              });
                            },
                            selectedGender: profileRegistrationController.selectedGender,
                            isIcon: false,
                            genderName: 'Other'.tr,
                          ),
                        ],
                      ),
                      24.verticalSpace,

                      ///=====================================Email check Box========================================
                      Text('Email'.tr, style: AppStyles.poppins14w700white),
                      28.verticalSpace,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              print(profileRegistrationController.agreeToTerms);
                              setState(() {
                                profileRegistrationController. agreeToTerms = !profileRegistrationController.agreeToTerms;
                              });
                            },
                            child: Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                color:
                                profileRegistrationController.agreeToTerms
                                        ? Colors.orange
                                        : Colors.transparent,
                                border: Border.all(
                                  color: Colors.orange,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child:
                              profileRegistrationController.agreeToTerms
                                      ? Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 16,
                                      )
                                      : null,
                            ),
                          ),
                          12.horizontalSpace,
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                signUp();
                              },
                              child: Text(
                                'I\'ve read this text & you want to receive promotional emails & messages from Pusher'.tr,
                                style: AppStyles.poppins10w700white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      30.verticalSpace,
                      CustomAppButton(
                        onTap: () {
                          Get.toNamed(AppRoutes.improvementView);
                        },
                        text: 'Sign Up'.tr,
                        textStyle: AppStyles.poppins16w700darkGrey2,
                      ),
                      20.verticalSpace,
                      Text(
                        'By clicking “Sign up״ button below'.tr,
                        textAlign: TextAlign.center,
                        style: AppStyles.poppins12w700white,
                      ),
                      20.verticalSpace,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addProfileImage() {
    print('Profile Picture Accessing');
  }

  void signUp() {
    print(profileRegistrationController.agreeToTerms);
    setState(() {
      profileRegistrationController.agreeToTerms = !profileRegistrationController.agreeToTerms;
    });
  }
}
