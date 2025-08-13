import 'package:base_project/app/routes/app_routes.dart';
import 'package:base_project/app/views/registration_section/controller/profile_registration_controller.dart';
import 'package:base_project/core/constants/app_fonts_and_styles.dart';
import 'package:base_project/core/constants/app_images.dart';
import 'package:base_project/core/widgets/custom_app_button.dart';
import 'package:base_project/core/widgets/custom_name_container.dart';
import 'package:base_project/core/widgets/custom_registration_app_bar.dart';
import 'package:base_project/core/widgets/edit_profile_view/date_of_birth_drop_down.dart';
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///===========================================Names Fields==============================
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),                      child: Row(
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
                    ),
                    24.verticalSpace,
                    ///====================================DOB=========================================================
                    DateOfBirthContainer(
                      borderColor: AppColors.whiteColor,
                    ),
                    24.verticalSpace,
                    ///===============================Gender selection======================================
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Text('Gender', style: AppStyles.poppins14w700white),
                    ),
                    12.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Row(
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
                    ),
                    24.verticalSpace,

                    ///=====================================Email check Box========================================
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Text('Email'.tr, style: AppStyles.poppins14w700white),
                    ),
                    28.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Row(
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
                    ),
                    30.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: CustomAppButton(
                        onTap: () {
                          Get.toNamed(AppRoutes.improvementView);
                        },
                        text: 'Sign Up'.tr,
                        textStyle: AppStyles.poppins16w700darkGrey2,
                      ),
                    ),
                    20.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Text(
                        'By clicking “Sign up״ button below'.tr,
                        textAlign: TextAlign.center,
                        style: AppStyles.poppins12w700white,
                      ),
                    ),
                    20.verticalSpace,
                  ],
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
