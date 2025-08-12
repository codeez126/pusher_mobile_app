import 'dart:ui';
import 'package:base_project/app/views/home_section/controller/pusher_challenge_controller.dart';
import 'package:base_project/core/widgets/custom_info_dialoge.dart';
import 'package:base_project/core/widgets/pusher_challenge_view/custom_premium_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/Constants/app_colors.dart';
import '../../../../core/constants/app_fonts_and_styles.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/utils/utils.dart';
import '../../../routes/app_routes.dart';

class PusherChallengeView extends StatefulWidget {
  PusherChallengeView({super.key});

  @override
  State<PusherChallengeView> createState() => _PusherChallengeViewState();
}

class _PusherChallengeViewState extends State<PusherChallengeView> {
  final PusherChallengeController pusherChallengeController = Get.put(
    PusherChallengeController(),
  );

  Set<int> selectedTaskIndices = {};
  int maxSelectableItems = 4;

  @override
  Widget build(BuildContext context) {
    maxSelectableItems = pusherChallengeController.taskNames.length;
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(height: 190.h),

                  ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(50.sp),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        height: 170.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(50.sp),
                          ),
                          color: AppColors.whiteColor.withOpacity(0.40),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              left: 0,
                              bottom: 0,
                              child: InkWell(
                                onTap: () => Get.back(),
                                child: SvgPicture.asset(
                                  AppImages.backImage,
                                  height: 120.h,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 45,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    AppImages.challenge2Svg,
                                    height: 35.h,
                                  ),
                                  5.horizontalSpace,
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Pusher Challenge'.tr,
                                        style: AppStyles.poppins18w600darkGrey2,
                                      ),
                                      Text(
                                        'Super Mix Routine'.tr,
                                        style: AppStyles.poppins16w400darkGrey2,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: (){
                        Get.dialog(CustomInfoDialog(description: "Every day you need to complete the pusher challenge routine for 7 days, After you finish the challenge a new challenge will appear every other day.".tr));
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 10.w),
                        padding: EdgeInsets.all(5.sp),
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor.withOpacity(0.60),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.whiteColor,
                            width: 1.8.w,
                          ),
                        ),
                        child: SvgPicture.asset(AppImages.infoSvg),
                      ),
                    ),
                  ),
                ],
              ),
              10.verticalSpace,
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: pusherChallengeController.taskNames.length,
                itemBuilder: (context, index) {
                  final isSelected = selectedTaskIndices.contains(index);
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(5.sp),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        margin: EdgeInsets.only(
                          bottom: 10.h,
                          left: 20.w,
                          right: 20.w,
                        ),
                        padding: EdgeInsets.all(10.sp),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.yellow
                              : AppColors.whiteColor.withOpacity(0.18),
                          border: Border.all(
                            color: isSelected
                                ? AppColors.yellow.withOpacity(0.8)
                                : AppColors.whiteColor,
                            width: 1.5.w,
                          ),
                          borderRadius: BorderRadius.circular(5.sp),
                        ),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (isSelected) {
                                    selectedTaskIndices.remove(index);
                                  } else {
                                    if (selectedTaskIndices.length == pusherChallengeController.taskNames.length - 1) {
                                      selectedTaskIndices.add(index);
                                      Get.toNamed(AppRoutes.pusherChallengeAllCompletedView);
                                    } else if (selectedTaskIndices.length < pusherChallengeController.taskNames.length) {
                                      selectedTaskIndices.add(index);
                                    } else {
                                      // Already at max
                                      Utils.toastMessage('You can select up to $maxSelectableItems tasks'.tr);
                                    }
                                  }
                                });
                                print('Selected tasks: ${selectedTaskIndices.toList()}');
                              },
                              child: SvgPicture.asset(isSelected?AppImages.checkBoxFillSvg:AppImages.checkBoxEmptySvg),
                            ),
                            10.horizontalSpace,
                            Expanded(
                              child: Text(
                                pusherChallengeController.taskNames[index].tr,
                                style: isSelected
                                    ? AppStyles.poppins14w500white.copyWith(
                                  fontWeight: FontWeight.w600,
                                )
                                    : AppStyles.poppins14w500white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              20.verticalSpace,
              CustomPremiumBox(
                plan: pusherChallengeController.selectedPlan,
                onTap: () {
                  // Check if at least one task is selected
                  if (selectedTaskIndices.isEmpty) {
                    Utils.toastMessage('Please select at least one task'.tr);
                    return;
                  }

                  // Get selected task names for processing
                  List<String> selectedTaskNames = selectedTaskIndices
                      .map((index) => pusherChallengeController.taskNames[index])
                      .toList();

                  print('Selected tasks: ${selectedTaskNames.join(', ')}');
                  print('Selected plan: ${pusherChallengeController.selectedPlan}');

                  // Show success message
                  Utils.toastMessage('${'Selected'.tr} ${selectedTaskIndices.length} tasks'.tr);

                  Get.toNamed(AppRoutes.pusherChallengeDoneView);
                },
              ),
              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to get selected task names (you can use this in your controller)
  List<String> getSelectedTaskNames() {
    return selectedTaskIndices
        .map((index) => pusherChallengeController.taskNames[index])
        .toList();
  }

  // Helper method to reset selections
  void resetSelections() {
    setState(() {
      selectedTaskIndices.clear();
    });
  }
}