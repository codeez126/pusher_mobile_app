import 'dart:io';

import 'package:base_project/app/routes/app_routes.dart';
import 'package:base_project/app/views/auth/controllers/profile_registration_controller.dart';
import 'package:base_project/core/constants/app_fonts_and_styles.dart';
import 'package:base_project/core/constants/app_images.dart';
import 'package:base_project/core/widgets/custom_app_button.dart';
import 'package:base_project/core/widgets/custom_name_container.dart';
import 'package:base_project/core/widgets/custom_registration_app_bar.dart';
import 'package:base_project/core/widgets/edit_profile_view/date_of_birth_drop_down.dart';
import 'package:base_project/core/widgets/gender_selection_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_svgs.dart';
import '../../../../core/widgets/image_picker_widget.dart';

class ProfileRegistrationView extends StatefulWidget {
  @override
  _ProfileRegistrationViewState createState() =>
      _ProfileRegistrationViewState();
}

class _ProfileRegistrationViewState extends State<ProfileRegistrationView> {

  final ImagePickerWidget imagePickerWidget =ImagePickerWidget();
  final ProfileRegistrationController profileRegistrationController = Get.put(ProfileRegistrationController());
  File? profileImage;


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
                // CustomRegistrationAppBar(
                //   isTittleAndSubtitle: true,
                //   title: "My Profile".tr,
                //   subtitle: '',
                //   isProfile: true,
                // ),
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    SizedBox(height: 250.h),
                    Container(
                      height: 170.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(50.sp)),
                        color: AppColors.whiteColor.withOpacity(0.30),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            left: 0,
                            bottom: 0,
                            child: InkWell(
                              onTap: () => Get.back(),
                              child: Image.asset(AppImages.imageBackIcon, height: 120.h),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              ImagePickerWidget(
                                onImageSelected: (file) {
                                  imageSelected(file);
                                },
                                child: Container(
                                  width: 100.w,
                                  height: 100.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: AppColors.whiteColor,
                                      width: 1.5.w,
                                    ),
                                  ),
                                  child: ClipOval(
                                    child: profileImage != null
                                        ? Image.file(
                                      profileImage!,
                                      fit: BoxFit.cover,
                                      width: 100.w,
                                      height: 100.w,
                                    )
                                        : Container(
                                      color: Colors.white.withOpacity(0.3),
                                      child: Center(
                                        child: SvgPicture.asset(
                                          AppSvgs.cameraSvg,
                                          height: 30.h,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: -5,
                                right: -5,
                                child: InkWell(
                                  onTap: () {
                                    print("Image picker tapped");
                                  },
                                  child: Image.asset(
                                    AppImages.addPng,
                                    height: 44.h,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          8.verticalSpace,
                          Text(
                            'Add a profile image'.tr,
                            style: AppStyles.poppins12w700white,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                40.verticalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///===========================================Names Fields==============================
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Row(
                        children: [
                          CustomNameContainer(
                            controller: profileRegistrationController.firstNameController.value,
                            textSection: "First Name".tr,
                            hintText: 'Or'.tr,
                          ),
                          16.horizontalSpace,
                          CustomNameContainer(
                            controller: profileRegistrationController.lastNameController.value,
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
                      controller: profileRegistrationController,
                    ),
                    24.verticalSpace,
                    ///===============================Gender selection======================================
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Text('Gender'.tr, style: AppStyles.poppins14w700white),
                    ),
                    12.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Row(
                        children: [
                          GenderSelectionContainerWidget(
                            onTap: () {
                              setState(() {
                                profileRegistrationController.gender = 'Male'.tr;
                                profileRegistrationController.selectedGender=1;
                                print(profileRegistrationController.gender);
                                print(profileRegistrationController.selectedGender);
                              });
                            },
                            selectedGender: profileRegistrationController.gender,
                            icon: Icons.male,
                            genderName: 'Male'.tr,
                          ),
                          12.horizontalSpace,
                          GenderSelectionContainerWidget(
                            onTap: () {
                              setState(() {
                                profileRegistrationController.gender = 'Female'.tr;
                                profileRegistrationController.selectedGender=2;
                                print(profileRegistrationController.gender);
                                print(profileRegistrationController.selectedGender);
                              });
                            },
                            selectedGender: profileRegistrationController.gender,
                            icon: Icons.female,
                            genderName: 'Female'.tr,
                          ),
                          12.horizontalSpace,
                          GenderSelectionContainerWidget(
                            onTap: () {
                              setState(() {
                                profileRegistrationController.gender = 'Other'.tr;
                                profileRegistrationController.selectedGender=3;
                                print(profileRegistrationController.gender);
                                print(profileRegistrationController.selectedGender);
                              });
                            },
                            selectedGender: profileRegistrationController.gender,
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
                                print(profileRegistrationController.agreeToTerms);
                                setState(() {
                                  profileRegistrationController.agreeToTerms = !profileRegistrationController.agreeToTerms;
                                });
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
                          //Get.toNamed(AppRoutes.improvementView);
                          signUp();
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
    profileRegistrationController.updateProfile();
  }

  void imageSelected(file) {
    setState(() {
      profileImage = file;
    });
  }
}
