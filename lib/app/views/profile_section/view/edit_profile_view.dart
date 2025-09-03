import 'dart:io';
import 'dart:ui';

import 'package:base_project/core/Managers/PrefManager.dart';
import 'package:base_project/core/constants/app_fonts_and_styles.dart';
import 'package:base_project/core/constants/app_svgs.dart';
import 'package:base_project/core/widgets/custom_app_button.dart';
import 'package:base_project/core/widgets/edit_profile_view/date_of_birth_drop_down.dart';
import 'package:base_project/core/widgets/image_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/Constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';
import '../../auth/controllers/profile_registration_controller.dart';
import '../../auth/model/user_model.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final TextEditingController updateNameController = TextEditingController();
  final ProfileRegistrationController profileRegistrationController =
  Get.put(ProfileRegistrationController());

  bool isEditName = false;
  bool isEditGender = false;
  File? image;
  int gender = 1; // Default Male
  UserModel? currentUser;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  @override
  void dispose() {
    updateNameController.dispose();
    super.dispose();
  }

  Future<void> loadUserData() async {
    try {
      final user = await PrefManager.getUser();
      setState(() {
        currentUser = user;
        gender = user?.gender ?? 1;
        updateNameController.text =
            "${user?.firstName ?? ""} ${user?.lastName ?? ""}".trim();
        isLoading = false;
      });
    } catch (e) {
      print("Error loading user data: $e");
      setState(() => isLoading = false);
    }
  }

  Future<void> _saveUser(UserModel updatedUser) async {
    setState(() => currentUser = updatedUser);
    await PrefManager.saveUser(updatedUser);
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
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
          child: const Center(child: CircularProgressIndicator()),
        ),
      );
    }

    var fullName = currentUser != null
        ? "${currentUser!.firstName ?? ""} ${currentUser!.lastName ?? ""}".trim()
        : "";

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
              _buildHeader(fullName),
              10.verticalSpace,
              Text("Edit Profile".tr,
                  style: AppStyles.poppins20w600darkGrey2),
              20.verticalSpace,
              _buildNameField(fullName),
              10.verticalSpace,
              DateOfBirthContainer(controller: profileRegistrationController),
              10.verticalSpace,
              _buildGenderField(),
              10.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                child: CustomAppButton(
                  onTap: updateProfile,
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

  Widget _buildHeader(String fullName) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(height: 200.h),
        Container(
          height: 150.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(50.sp)),
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
                        border: Border.all(color: AppColors.lightBlue, width: 1.w),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: AppColors.whiteColor, width: 2.w),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(1000.sp),
                          child: _buildProfileImage(),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0.h,
                      right: 4.w,
                      child: Container(
                        padding: EdgeInsets.all(4.w),
                        decoration: BoxDecoration(
                          color: AppColors.darkGrey2.withOpacity(0.35),
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: AppColors.whiteColor, width: 2.w),
                        ),
                        child: ImagePickerWidget(
                          onImageSelected: (file) {
                            setState(() => image = file);
                            // TODO: If profile image needs to be saved to Prefs or uploaded, handle here
                          },
                          child: SvgPicture.asset(
                            AppSvgs.editIcon2Svg,
                            color: AppColors.whiteColor,
                            width: 18.w,
                            height: 18.h,
                          ),
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
            onTap: () => Get.back(),
            child: Image.asset(AppImages.backImage, height: 130.h),
          ),
        ),
      ],
    );
  }

  Widget _buildNameField(String fullName) {
    return Container(
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
                Text("Full Name".tr, style: AppStyles.poppins12w600darkGrey2),
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
                  fullName.isEmpty ? "No name set" : fullName,
                  style: AppStyles.poppins14w300darkGrey2,
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () async {
              if (isEditName && currentUser != null) {
                final fullNameText = updateNameController.text.trim();
                if (fullNameText.isNotEmpty) {
                  final parts = fullNameText.split(" ");
                  final firstName = parts.isNotEmpty ? parts.first : "";
                  final lastName =
                  parts.length > 1 ? parts.sublist(1).join(" ") : "";

                  final updatedUser = currentUser!.copyWith(
                    firstName: firstName,
                    lastName: lastName,
                  );
                  await _saveUser(updatedUser);
                }
              } else {
                updateNameController.text = fullName;
              }
              setState(() => isEditName = !isEditName);
            },
            child: isEditName
                ? SvgPicture.asset(AppSvgs.tickSvg,
                height: 20.h, color: AppColors.darkGrey2)
                : SvgPicture.asset(AppSvgs.editIcon3Svg),
          ),
        ],
      ),
    );
  }

  Widget _buildGenderField() {
    return Container(
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
                Text("Gender".tr, style: AppStyles.poppins12w600darkGrey2),
                5.verticalSpace,
                isEditGender
                    ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _genderOption(1, "Male"),
                    16.horizontalSpace,
                    _genderOption(2, "Female"),
                    16.horizontalSpace,
                    _genderOption(3, "Other"),
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
            onTap: () async {
              if (isEditGender && currentUser != null) {
                final updatedUser = currentUser!.copyWith(gender: gender);
                await _saveUser(updatedUser);
              }
              setState(() => isEditGender = !isEditGender);
            },
            child: isEditGender
                ? SvgPicture.asset(AppSvgs.tickSvg,
                height: 20.h, color: AppColors.darkGrey2)
                : SvgPicture.asset(AppSvgs.editIcon3Svg),
          ),
        ],
      ),
    );
  }

  Widget _genderOption(int value, String label) {
    return Column(
      children: [
        Radio<int>(
          value: value,
          groupValue: gender,
          activeColor: AppColors.lightBlue,
          onChanged: (val) => setState(() => gender = val ?? gender),
        ),
        Text(label.tr, style: AppStyles.poppins14w400darkGrey2),
      ],
    );
  }

  Widget _buildProfileImage() {
    if (image != null) {
      return Image.file(image!, fit: BoxFit.cover);
    } else if (currentUser?.profileImage != null &&
        currentUser!.profileImage!.isNotEmpty) {
      return Image.network(
        currentUser!.profileImage!,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) =>
            Image.asset(AppImages.profilePic, fit: BoxFit.cover),
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                  loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
      );
    } else {
      return Image.asset(AppImages.profilePic, fit: BoxFit.cover);
    }
  }

  Future<void> updateProfile() async {
    final fullName = updateNameController.text.trim();
    String firstName = "";
    String lastName = "";

    if (fullName.isEmpty && currentUser != null) {
      firstName = currentUser!.firstName ?? "";
      lastName = currentUser!.lastName ?? "";
    } else if (fullName.isNotEmpty) {
      final parts = fullName.split(" ");
      firstName = parts.isNotEmpty ? parts.first : "";
      lastName = parts.length > 1 ? parts.sublist(1).join(" ") : "";
    }

    final selectedGender = gender;

    if (currentUser != null) {
      final updatedUser = currentUser!.copyWith(
        firstName: firstName,
        lastName: lastName,
        gender: selectedGender,
      );
      await _saveUser(updatedUser);
    }

    profileRegistrationController.updateProfileEditView(
      firstName: firstName,
      lastName: lastName,
      gender: selectedGender,
    );
  }
}
