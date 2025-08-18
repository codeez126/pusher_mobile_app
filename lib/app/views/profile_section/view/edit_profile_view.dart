import 'dart:ui';

import 'package:base_project/core/constants/app_fonts_and_styles.dart';
import 'package:base_project/core/constants/app_svgs.dart';
import 'package:base_project/core/widgets/edit_profile_view/date_of_birth_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/Constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  @override
  Widget build(BuildContext context) {
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
                  child: Stack(children: []),
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
                                  color: AppColors.darkGrey2.withOpacity(0.35),
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Full Name".tr,
                        style: AppStyles.poppins12w600darkGrey2,
                      ),
                      5.verticalSpace,
                      Text(
                        "Or Haim".tr,
                        style: AppStyles.poppins14w300darkGrey2,
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      editName();
                    },
                    child: SvgPicture.asset(AppSvgs.editIcon3Svg),
                  ),
                ],
              ),
            ),
            10.verticalSpace,
            DateOfBirthContainer(),
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Gender".tr,
                        style: AppStyles.poppins12w600darkGrey2,
                      ),
                      5.verticalSpace,
                      Text("Male".tr, style: AppStyles.poppins14w300darkGrey2),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      changeGender();
                    },
                    child: SvgPicture.asset(AppSvgs.editIcon3Svg),
                  ),
                ],
              ),
            ),
          ],
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
