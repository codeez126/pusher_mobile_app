import 'dart:ui';
import 'package:base_project/app/routes/app_routes.dart';
import 'package:base_project/app/views/auth/controllers/phone_login_controller.dart';
import 'package:base_project/core/Managers/PrefManager.dart';
import 'package:base_project/core/constants/app_fonts_and_styles.dart';
import 'package:base_project/core/constants/app_svgs.dart';
import 'package:base_project/core/widgets/profile_view/custom_container_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/Constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';
import '../controller/profile_view_controller.dart';
class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  final PhoneLoginController phoneLoginController =Get.put(PhoneLoginController());
  final controller = Get.put(ProfileViewController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.dailyChallengeBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(height: 170.h),
                Container(
                  height: 120.h,
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
                          width: 100.w,
                          height: 100.h,
                          padding: EdgeInsets.all(5.w),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.whiteColor.withOpacity(0.70),
                            border: Border.all(
                              color: AppColors.whiteColor.withOpacity(0.30),
                              width: 2.w,
                            ),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: AppColors.whiteColor, width: 2.w),
                              image: DecorationImage(
                                image: AssetImage(AppImages.profilePic),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                ),
                Positioned(right: 20,top: 30,child: GestureDetector(onTap: (){
                  Get.toNamed(AppRoutes.languagesView);
                },child: Icon(Icons.settings,color: AppColors.darkGrey2,)))
              ],
            ),
            20.verticalSpace,
            Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(50.sp)),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor.withOpacity(0.70),
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(50.sp),
                        ),
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(40.sp),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                              child: Container(
                                padding: EdgeInsets.all(15.sp),
                                decoration: BoxDecoration(
                                  color: AppColors.darkGrey2.withOpacity(0.17),
                                  borderRadius: BorderRadius.circular(40.sp),
                                  border: Border.all(
                                    color: AppColors.whiteColor,
                                    width: 1.5.sp,
                                  ),
                                ),
                                child:  Obx(() {
                                  final firstName = controller.user.value?.firstName ?? '';
                                  final lastName = controller.user.value?.lastName ?? '';
                                  return Text(
                                    '$firstName $lastName'.trim().isEmpty
                                        ? "N/A"
                                        : '$firstName $lastName',
                                    style: AppStyles.poppins20w600white,
                                  );
                                }),

                              ),
                            ),
                          ),
                          20.verticalSpace,
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                children: [
                                  CustomContainerTile(
                                      icon: AppSvgs.editProfileSvg,
                                      title: "Edit My Profile".tr,
                                      onTap: () {
                                        Get.toNamed(AppRoutes.editProfileView);
                                      }),
                                  10.verticalSpace,
                                  CustomContainerTile(
                                      icon: AppSvgs.shareProfileSvg,
                                      title: "Sharing The App".tr,
                                      onTap: () {}),
                                  10.verticalSpace,
                                  CustomContainerTile(
                                      icon: AppSvgs.contactUsSvg,
                                      title: 'Contact Us'.tr,
                                      onTap: () {}),
                                  10.verticalSpace,
                                  CustomContainerTile(
                                      icon: AppSvgs.termOfUseSvg,
                                      title: 'Terms Of Use'.tr,
                                      onTap: () {
                                        Get.toNamed(AppRoutes.termOfUseView);
                                      }),
                                  10.verticalSpace,
                                  CustomContainerTile(
                                      icon: AppSvgs.termOfUseSvg,
                                      title: 'Privacy Policy'.tr,
                                      onTap: () {
                                        Get.toNamed(AppRoutes.privacyPolicyView);
                                      }),
                                  10.verticalSpace,
                                  CustomContainerTile(
                                      icon: AppSvgs.logOutSvg,
                                      title: 'Log Out'.tr,
                                      containerColor: AppColors.redColor.withOpacity(0.35),
                                      borderColor: AppColors.redColor,
                                      titleColor: AppColors.whiteColor,
                                      onTap: () {
                                        PrefManager.setIsLogin(false);
                                        Get.offAllNamed(AppRoutes.phoneLogin);

                                        phoneLoginController.disconnect();
                                        phoneLoginController.signOut();

                                      }),
                                  Spacer(),
                                  CustomContainerTile(
                                      icon: AppSvgs.deleteSvg,
                                      title: 'Delete User'.tr,
                                      containerColor: AppColors.redColor.withOpacity(0.85),
                                      borderColor: AppColors.redColor,
                                      titleColor: AppColors.whiteColor,
                                      onTap: () {
                                        showDeleteConfirmation(context);
                                      }),
                                  10.verticalSpace
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }

  void showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Account'.tr,style: AppStyles.poppins16w700darkGrey2,),
          content: Text(
            'Are you sure you want to delete your account? This action cannot be undone.'.tr,
            style: AppStyles.poppins14w300darkGrey2,
          ),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: Text('Cancel'.tr,style: AppStyles.poppins14w400darkGrey2,),
            ),
            TextButton(
              onPressed: () {
                Get.back();
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
              ),
              child: Text('Delete'.tr,style: AppStyles.poppins14w400Red,),
            ),
          ],
        );
     },
    );
  }
}