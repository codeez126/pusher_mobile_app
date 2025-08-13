import 'dart:ui';
import 'package:base_project/app/views/home_section/controller/pusher_challenge_controller.dart';
import 'package:base_project/core/constants/app_svgs.dart';
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
                                  AppSvgs.backImageSvg,
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
                                    AppSvgs.challenge2Svg,
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
                        child: SvgPicture.asset(AppSvgs.infoSvg),
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
                    borderRadius: BorderRadius.circular(40.sp),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: GestureDetector(
                        onTap: () {
                          Get.dialog(
                            Material(
                              color: Colors.transparent,
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 20.sp,vertical: 100.h,),
                                decoration: BoxDecoration(
                                  color: AppColors.whiteColor.withOpacity(0.45),
                                  borderRadius: BorderRadius.circular(40.r),
                                  border: Border.all(
                                    color: AppColors.whiteColor,
                                    width: 1.5.w,
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(40.r),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                    child: Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.all(20.sp),
                                      decoration: BoxDecoration(
                                        color: AppColors.darkGrey2.withOpacity(0.10),
                                        borderRadius: BorderRadius.circular(40.r),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            padding: EdgeInsets.symmetric(vertical: 12.h),
                                            decoration: BoxDecoration(
                                              color: AppColors.whiteColor.withOpacity(0.15),
                                              borderRadius: BorderRadius.circular(25.r),
                                              border: Border.all(
                                                color: AppColors.whiteColor,
                                                width: 1.5.w,
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                pusherChallengeController.taskNames[index],
                                                style: AppStyles.poppins20w600white,
                                              ),
                                            ),
                                          ),
                                          16.verticalSpace,
                                          Row(
                                            children: [
                                              SvgPicture.asset(AppSvgs.infoSvg,color: AppColors.yellow,height: 35.h,),
                                              8.horizontalSpace,
                                              Text(
                                                "Description",
                                                style: AppStyles.poppins16w700white.copyWith(color: AppColors.yellow),
                                              ),
                                            ],
                                          ),
                                          8.verticalSpace,
                                          Text(
                                            pusherChallengeController.taskDescriptions[index],
                                            style: AppStyles.poppins14w700white,
                                          ),
                                          20.verticalSpace,
                                          Row(
                                            children: [
                                              SvgPicture.asset(AppSvgs.introductionsSvg,height: 35.h,),
                                              8.horizontalSpace,
                                              Text(
                                                "Introductions",
                                                style: AppStyles.poppins16w700white.copyWith(color: AppColors.yellow),
                                              ),
                                            ],
                                          ),
                                          12.verticalSpace,
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              bulletPoint("Why It’s Important: ",
                                                  "Exercise Improves Your Energy, Mood, And Overall Health."),
                                              bulletPoint("What You Need To Do: ",
                                                  "Spend Just 45 Minutes Today On A Physical Activity Of Your Choice."),
                                              bulletPoint("How It Helps: ",
                                                  "Consistency Builds Lasting Habits And Keeps You On Track Toward Your Fitness Goals."),
                                            ],
                                          ),
                                          24.verticalSpace,
                                          SizedBox(
                                            width: double.infinity,
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: AppColors.lightBlue,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(30.r),
                                                  side: BorderSide(color: AppColors.whiteColor, width: 1.5.w),
                                                ),
                                                padding: EdgeInsets.symmetric(vertical: 14.h),
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  if (isSelected) {
                                                    selectedTaskIndices.remove(index);
                                                  } else {
                                                    if (selectedTaskIndices.length >= maxSelectableItems) {
                                                      Utils.toastMessage('You can select up to $maxSelectableItems tasks'.tr);
                                                      return;
                                                    }
                                                    selectedTaskIndices.add(index);

                                                    if (selectedTaskIndices.length == pusherChallengeController.taskNames.length) {
                                                      Get.back();
                                                      Get.toNamed(AppRoutes.pusherChallengeAllCompletedView);
                                                    } else {
                                                      Get.back();
                                                      Get.toNamed(AppRoutes.pusherChallengeDoneView);
                                                    }
                                                  }
                                                });

                                                Get.back();
                                              },
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    isSelected?"Remove".tr:"Finish".tr,
                                                    style: AppStyles.poppins16w600white,
                                                  ),
                                                  5.horizontalSpace,
                                                  SvgPicture.asset(AppSvgs.finishSvg,height: 25.h,),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          );

                          print('Selected tasks: ${selectedTaskIndices.toList()}');
                        },
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
                              SvgPicture.asset(isSelected?AppSvgs.checkBoxFillSvg:AppSvgs.checkBoxEmptySvg),
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

  Widget bulletPoint(String title, String content) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("•  ",
            style: AppStyles.poppins16w600white,
          ),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: AppStyles.poppins14w700white,
                children: [
                  TextSpan(
                    text: title,
                    style: AppStyles.poppins14w500white,
                  ),
                  TextSpan(text: content),
                ],
              ),
            ),
          ),
        ],
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