import 'dart:ui';

import 'package:base_project/app/routes/app_routes.dart';
import 'package:base_project/core/Managers/PrefManager.dart';
import 'package:base_project/core/constants/app_fonts_and_styles.dart';
import 'package:base_project/core/constants/app_svgs.dart';
import 'package:base_project/core/widgets/custom_app_button.dart';
import 'package:base_project/core/widgets/custom_name_container.dart';
import 'package:base_project/core/widgets/edit_profile_view/date_of_birth_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/Constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';
import '../../auth/controllers/profile_registration_controller.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final TextEditingController updateNameController = TextEditingController();
  final ProfileRegistrationController profileRegistrationController = Get.put(
    ProfileRegistrationController(),
  );

  var gender = PrefManager.read("gender");
  bool isEditName = false;
  bool isEditGender = false;

  @override
  Widget build(BuildContext context) {
    var fullName =
    "${PrefManager.read("firstName") ?? ""} ${PrefManager.read("lastName") ?? ""}";
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.editProfileBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(height: 200.h),
                  Container(
                    height: 150.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(50.sp),
                      ),
                      color: AppColors.whiteColor.withOpacity(0.30),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.sp),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                        child: Container(
                          padding: EdgeInsets.all(8.w),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.whiteColor.withOpacity(0.70),
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 100.w,
                                height: 100.h,
                                padding: EdgeInsets.all(5.w),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.whiteColor.withOpacity(0.70),
                                  border: Border.all(
                                    color: AppColors.lightBlue,
                                    width: 1.w,
                                  ),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: AppColors.whiteColor,
                                      width: 2.w,
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage(AppImages.profilePic),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0.h,
                                right: 4.w,
                                child: Container(
                                  padding: EdgeInsets.all(4.w),
                                  decoration: BoxDecoration(
                                    color: AppColors.darkGrey2.withOpacity(
                                      0.35,
                                    ),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: AppColors.whiteColor,
                                      width: 2.w,
                                    ),
                                  ),
                                  child: SvgPicture.asset(
                                    AppSvgs.editIcon2Svg,
                                    color: AppColors.whiteColor,
                                    width: 18.w,
                                    height: 18.h,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        Get.back();
                        print('tapped');
                      },
                      child: Image.asset(AppImages.backImage, height: 130.h),
                    ),
                  ),
                ],
              ),
              10.verticalSpace,
              Text("Edit Profile".tr, style: AppStyles.poppins20w600darkGrey2),
              20.verticalSpace,
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15.sp),
                padding: EdgeInsets.all(20.sp),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor.withOpacity(0.40),
                  borderRadius: BorderRadius.circular(20.sp),
                  border: Border.all(color: AppColors.lightBlue, width: 1.w),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Full Name".tr,
                            style: AppStyles.poppins12w600darkGrey2,
                          ),
                          isEditName ? 0.verticalSpace : 5.verticalSpace,
                          isEditName
                              ? TextField(
                                controller: updateNameController,
                                style: AppStyles.poppins14w400darkGrey2,
                                decoration: InputDecoration(
                                  hintText: "Enter full name".tr,
                                  border: InputBorder.none,
                                ),
                              )
                              : Text(
                               "${PrefManager.read("firstName") ?? ""} ${PrefManager.read("lastName") ?? ""}",
                                style: AppStyles.poppins14w300darkGrey2,
                              ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          final fullName = updateNameController.text.trim();
                          final parts = fullName.split(" ");
                          final firstName = parts.isNotEmpty ? parts.first : "";
                          final lastName = parts.length > 1 ? parts.sublist(1).join(" ") : "";
                          PrefManager.save("firstName", firstName);
                          PrefManager.save("lastName", lastName);
                          isEditName = !isEditName;
                        });
                      },
                      child:
                          isEditName
                              ? SvgPicture.asset(
                                AppSvgs.tickSvg,
                                height: 20.h,
                                color: AppColors.darkGrey2,
                              )
                              : SvgPicture.asset(AppSvgs.editIcon3Svg),
                    ),
                  ],
                ),
              ),
              10.verticalSpace,
              DateOfBirthContainer(controller: profileRegistrationController),
              10.verticalSpace,
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15.sp),
                padding: EdgeInsets.all(20.sp),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor.withOpacity(0.40),
                  borderRadius: BorderRadius.circular(20.sp),
                  border: Border.all(color: AppColors.lightBlue, width: 1.w),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Gender".tr,
                            style: AppStyles.poppins12w600darkGrey2,
                          ),
                          5.verticalSpace,
                          isEditGender
                              ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Radio<int>(
                                        value: 1,
                                        groupValue: gender,
                                        activeColor: AppColors.lightBlue,
                                        onChanged: (val) {
                                          setState(() => gender = val ?? 1);
                                        },
                                      ),
                                      Text(
                                        "Male".tr,
                                        style: AppStyles.poppins14w400darkGrey2,
                                      ),
                                    ],
                                  ),
                                  16.horizontalSpace,
                                  Column(
                                    children: [
                                      Radio<int>(
                                        value: 2,
                                        groupValue: gender,
                                        activeColor: AppColors.lightBlue,
                                        onChanged: (val) {
                                          setState(() => gender = val ?? 2);
                                        },
                                      ),
                                      Text(
                                        "Female".tr,
                                        style: AppStyles.poppins14w400darkGrey2,
                                      ),
                                    ],
                                  ),
                                  16.horizontalSpace,
                                  Column(
                                    children: [
                                      Radio<int>(
                                        value: 3,
                                        groupValue: gender,
                                        activeColor: AppColors.lightBlue,
                                        onChanged: (val) {
                                          setState(() => gender = val ?? 3);
                                        },
                                      ),
                                      Text(
                                        "Other".tr,
                                        style: AppStyles.poppins14w400darkGrey2,
                                      ),
                                    ],
                                  ),
                                ],
                              )
                              : Text(
                                gender == 1
                                    ? "Male".tr
                                    : gender == 2
                                    ? "Female".tr
                                    : "Other".tr,
                                style: AppStyles.poppins14w300darkGrey2,
                              ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isEditGender = !isEditGender;
                        });
                        if (!isEditGender) {
                          changeGender();
                        }
                      },
                      child:
                          isEditGender
                              ? SvgPicture.asset(
                                AppSvgs.tickSvg,
                                height: 20.h,
                                color: AppColors.darkGrey2,
                              )
                              : SvgPicture.asset(AppSvgs.editIcon3Svg),
                    ),
                  ],
                ),
              ),
              10.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                child: CustomAppButton(
                  onTap: () {
                    final fullName = updateNameController.text.trim();
                    final parts = fullName.split(" ");
                    final firstName = parts.isNotEmpty ? parts.first : "";
                    final lastName = parts.length > 1 ? parts.sublist(1).join(" ") : "";
                    final selectedGender = gender ?? 1;

                    profileRegistrationController.updateProfileEditView(
                      firstName: firstName,
                      lastName: lastName,
                      gender: selectedGender,
                    );
                  },
                  text: "Update Profile".tr,
                  isIcon: false,
                  textStyle: AppStyles.poppins14w500white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void editName() {
    print('Edit Name');
  }

  void changeGender() {
    print('Change Gender');
  }
}
