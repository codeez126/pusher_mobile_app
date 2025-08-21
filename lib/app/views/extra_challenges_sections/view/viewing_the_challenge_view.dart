import 'dart:ui';
import 'package:base_project/app/views/extra_challenges_sections/controller/viewing_the_challenge_controller.dart';
import 'package:base_project/core/constants/app_svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/Constants/app_colors.dart';
import '../../../../core/constants/app_fonts_and_styles.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/daily_goals_done_view/animated_progress_bar.dart';

class ViewingTheChallengeView extends StatefulWidget {
  const ViewingTheChallengeView({super.key});

  @override
  State<ViewingTheChallengeView> createState() =>
      _ViewingTheChallengeViewState();
}

class _ViewingTheChallengeViewState extends State<ViewingTheChallengeView> {
  late String backgroundImage;
  late String challengeName;
  late int challengePoints;
  late String trainerName;
  late String trainerDescription;
  late String challengeDescription;
  late String challengeTime;
  late List<String> tasks;

  bool isPremium = true;
  final ViewingTheChallengeController viewingTheChallengeController = Get.put(
    ViewingTheChallengeController(),
  );

  Set<int> selectedTaskIndices = {};

  @override
  void initState() {
    super.initState();
    final args = Get.arguments as Map<String, dynamic>;
    backgroundImage = args['backgroundImage'];
    challengeName = args['challengeName'];
    challengePoints = args['challengePoints'];
    trainerName = args['trainerName'];
    trainerDescription = args['trainerDescription'];
    challengeDescription = args['challengeDescription'];
    challengeTime = args['challengeTime'];
    tasks = List<String>.from(args['tasks']);
  }

  int selectedDay = 5;
  int currentDay = 5;

  @override
  Widget build(BuildContext context) {
    final int maxSelectableItems = tasks.length;

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
                  if (isPremium) SizedBox(height: 470.h),
                  Container(
                    height: 450.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(50.sp),
                      ),
                      image: DecorationImage(
                        image: AssetImage(backgroundImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 400.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(50.sp),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.6),
                          Colors.black.withOpacity(0.3),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 400.h,
                    child: Column(
                      children: [
                        // top bar
                        Container(
                          height: 120.h,
                          alignment: Alignment.bottomCenter,
                          padding: EdgeInsets.only(bottom: 25.h),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(50.sp),
                            ),
                            color: AppColors.whiteColor.withOpacity(0.50),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.sp),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                  AppSvgs.shareSvg,
                                  color: AppColors.darkGrey2,
                                  height: 30.h,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      AppImages.premiumStar,
                                      height: 30.h,
                                    ),
                                    5.horizontalSpace,
                                    Text(
                                      "$challengeName${" Challenges".tr}",
                                      style: AppStyles.poppins20w600white,
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _openTopSheet(
                                      context,
                                      currentDay,
                                      selectedDay,
                                      (day) {
                                        setState(() => selectedDay = day);
                                      },
                                    );
                                  },
                                  child: SvgPicture.asset(
                                    AppSvgs.calenderSvg,
                                    color: AppColors.darkGrey2,
                                    height: 30.h,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment:
                              isPremium
                                  ? MainAxisAlignment.center
                                  : MainAxisAlignment.end,
                          children: [
                            Container(
                              width: isPremium ? null : 130.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.sp),
                                color: AppColors.whiteColor.withOpacity(0.25),
                                border: Border.all(
                                  width: 1.5.w,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 10.h,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              isPremium
                                                  ? "Complete The Challenge And Win ".tr
                                                  : "Win ".tr,
                                          style: AppStyles.poppins16w300white,
                                        ),
                                        TextSpan(
                                          text: challengePoints.toString(),
                                          style: AppStyles.poppins16w600white,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SvgPicture.asset(
                                    AppSvgs.coinSvg,
                                    height: 30.h,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        if (isPremium) Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20.sp),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 10,
                                      sigmaY: 10,
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10.sp,
                                        vertical: 5.sp,
                                      ),
                                      color: AppColors.whiteColor.withOpacity(
                                        0.25,
                                      ),
                                      child: Text(
                                        '${'By'.tr}$trainerName',
                                        style: AppStyles.poppins14w700white,
                                      ),
                                    ),
                                  ),
                                ),
                                8.verticalSpace,
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20.sp),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 10,
                                      sigmaY: 10,
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10.sp,
                                        vertical: 5.sp,
                                      ),
                                      color: AppColors.whiteColor.withOpacity(
                                        0.25,
                                      ),
                                      child: Text(
                                        trainerDescription,
                                        style: AppStyles.poppins12w300white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  isPremium
                      ? Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40.sp),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30.sp),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                alignment: Alignment.center,
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20.sp,
                                  vertical: 10.sp,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.sp),
                                  border: Border.all(
                                    color: AppColors.whiteColor,
                                    width: 1.5.w,
                                  ),
                                  gradient: LinearGradient(
                                    colors: [
                                      AppColors.whiteColor.withOpacity(0.20),
                                      AppColors.darkGrey2.withOpacity(0.20),
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  ),
                                ),
                                child: Text(
                                  '${'DAY'.tr}05',
                                  textAlign: TextAlign.center,
                                  style: AppStyles.poppins24w600white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                      : Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(30.sp),
                          ),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(20.sp),
                              color: AppColors.darkGrey2.withOpacity(0.25),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    challengeDescription,
                                    textAlign: TextAlign.center,
                                    style: AppStyles.poppins14w500white
                                        .copyWith(height: 1.4),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                ],
              ),
              20.verticalSpace,
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final isSelected = selectedTaskIndices.contains(index);
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(40.sp),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: GestureDetector(
                        onTap: () {
                          completionDialoge(context,0.20);
                          setState(() {
                            if (isPremium) {
                              if (isSelected) {
                                selectedTaskIndices.remove(index);
                              } else {
                                if (selectedTaskIndices.length >=
                                    maxSelectableItems) {
                                  Utils.toastMessage(
                                    'You can select up to $maxSelectableItems tasks'
                                        .tr,
                                  );
                                  return;
                                }
                                selectedTaskIndices.add(index);
                              }
                            }
                          });
                          debugPrint(
                            'Selected tasks: ${getSelectedTaskNames()}',
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 5.h,
                          ),
                          padding: EdgeInsets.all(10.sp),
                          decoration: BoxDecoration(
                            color:
                                isSelected
                                    ? AppColors.yellow
                                    : AppColors.whiteColor.withOpacity(0.25),
                            border: Border.all(
                              color:
                                  isSelected
                                      ? AppColors.yellow.withOpacity(0.8)
                                      : AppColors.whiteColor,
                              width: 1.5.w,
                            ),
                            borderRadius: BorderRadius.circular(5.sp),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                isSelected
                                    ? AppSvgs.checkBoxFillSvg
                                    : AppSvgs.checkBoxEmptySvg,
                              ),
                              10.horizontalSpace,
                              Expanded(
                                child: Text(
                                  tasks[index],
                                  style:
                                      isSelected
                                          ? AppStyles.poppins14w500white
                                              .copyWith(
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
            ],
          ),
        ),
      ),
    );
  }

  void _openTopSheet(BuildContext context, int currentDay, int selectedDay, Function(int) onDaySelected,) {showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.4),
      barrierLabel: '',
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.topCenter,
          child: Material(
            color: Colors.transparent,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.darkGrey2.withOpacity(0.35),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(16.r),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 200.h,
                      child: Stack(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 120.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(AppImages.topContainer),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Text(
                              "${"Day".tr}${currentDay.toString().padLeft(2, '0')}",
                              style: AppStyles.poppins20w600white,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: GestureDetector(
                              onTap: () => Get.back(),
                              child: Image.asset(
                                AppImages.closeButtonImage,
                                height: 120.h,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.r),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 20.w),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.5.w,
                              color: AppColors.whiteColor,
                            ),
                            color: AppColors.darkGrey2.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: GridView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 7,
                                  childAspectRatio: 1,
                                ),
                            itemCount: 30,
                            itemBuilder: (context, index) {
                              final day = index + 1;
                              final isCurrentDay = day == currentDay;
                              final isCompleted = day < currentDay;
                              return GestureDetector(
                                  onTap: () {
                                    Get.back();
                                    if (isCompleted) {
                                      _openCompletedDaySheet(context, day);
                                    } else {
                                      if(isCurrentDay){
                                        _currentDaySheet(context);
                                      }else{
                                        onDaySelected(day);
                                      }
                                    }
                                  },
                                  child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                        (isCompleted || isCurrentDay)
                                            ? AppColors.whiteColor.withOpacity(
                                              0.25,
                                            )
                                            : Colors.transparent,
                                    borderRadius:
                                        isCompleted
                                            ? index == 0
                                                ? BorderRadius.only(
                                                  topLeft: Radius.circular(20.r),
                                                )
                                                : index == 6
                                                ? BorderRadius.only(
                                                  topRight: Radius.circular(8.r),
                                                )
                                                : index == 28
                                                ? BorderRadius.only(
                                                  bottomLeft: Radius.circular(
                                                    8.r,
                                                  ),
                                                )
                                                : BorderRadius.zero
                                            : isCurrentDay
                                            ? BorderRadius.only(
                                              topRight: Radius.circular(8.r),
                                              bottomRight: Radius.circular(8.r),
                                            )
                                            : BorderRadius.circular(8.r),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      isCurrentDay
                                          ? Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 2.sp,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(
                                                10.sp,
                                              ),
                                              border: Border.all(
                                                width: 1.w,
                                                color: AppColors.whiteColor,
                                              ),
                                            ),
                                            child: Text(
                                              day.toString().padLeft(2, '0'),
                                              style: AppStyles.poppins20w600white,
                                            ),
                                          )
                                          : Text(
                                            day.toString().padLeft(2, '0'),
                                            style: AppStyles.poppins14w500white,
                                          ),
                                      if (isCompleted) ...[
                                        SizedBox(height: 2.h),
                                        SvgPicture.asset(
                                          AppSvgs.circleTickSvg,
                                          width: 10.w,
                                          height: 10.h,
                                        ),
                                      ],
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),

                    20.verticalSpace,
                  ],
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(0, -1),
            end: Offset.zero,
          ).animate(CurvedAnimation(parent: anim, curve: Curves.easeOut)),
          child: child,
        );
      },
    );
  }
  void _currentDaySheet(BuildContext context,) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.4),
      barrierLabel: '',
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.topCenter,
          child: Material(
            color: Colors.transparent,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.darkGrey2.withOpacity(0.35),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(16.r),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 200.h,
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 0,
                            child: GestureDetector(
                              onTap: () => Get.back(),
                              child: Image.asset(
                                AppImages.closeButtonImage,
                                height: 120.h,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("The Challenge Completed Successfully And Earned:".tr,textAlign: TextAlign.center,style: AppStyles.urbanistBold20White600,),
                          20.verticalSpace,
                          SvgPicture.asset(AppSvgs.coinSvg,height: 150.h,),
                          20.verticalSpace,
                          Container(
                            padding: EdgeInsets.all(20.sp),
                            decoration: BoxDecoration(
                                border: Border.all(width: 1.5.w,color: AppColors.whiteColor.withOpacity(0.25)),
                                borderRadius: BorderRadius.circular(20.sp)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Share the achievement with friends".tr,textAlign: TextAlign.center,style: AppStyles.poppins16w600white,),
                                5.verticalSpace,
                                Container(
                                  width: 150.w,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(horizontal: 5.sp,vertical: 10.sp),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.sp),
                                      color: AppColors.whiteColor.withOpacity(0.15),
                                      border: Border.all(color: AppColors.whiteColor,width: 0.5)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(AppSvgs.shareSvg,height: 30.h,),
                                      5.horizontalSpace,
                                      Text("Share".tr,style: AppStyles.poppins16w600white,)
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    20.verticalSpace,
                  ],
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(0, -1),
            end: Offset.zero,
          ).animate(CurvedAnimation(parent: anim, curve: Curves.easeOut)),
          child: child,
        );
      },
    );
  }
  void completionDialoge(BuildContext context, double progress) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.4),
      barrierLabel: '',
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.center,
          child: Material(
            color: Colors.transparent,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(50.sp),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  width: double.infinity,
                  height: 420.h,
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.sp),
                    border: Border.all(width: 1.5.w, color: AppColors.whiteColor),
                    color: AppColors.whiteColor.withOpacity(0.10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      10.verticalSpace,
                      Text(
                        "Financial Daily challenge completed today".tr,
                        textAlign: TextAlign.center,
                        style: AppStyles.poppins16w600white,
                      ),
                      SvgPicture.asset(
                        AppSvgs.doneSvg,
                        height: 200.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: AnimatedProgressBar(
                          targetProgress: progress,
                          backgroundColor: AppColors.whiteColor.withOpacity(0.25),
                          height: 30.h,
                          progressColor: AppColors.lightBlue,
                          borderColor: AppColors.whiteColor,
                        ),
                      ),
                      10.verticalSpace,
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(0, -1),
            end: Offset.zero,
          ).animate(CurvedAnimation(parent: anim, curve: Curves.easeOut)),
          child: child,
        );
      },
    );
    Future.delayed( Duration(seconds: 2), () {
      if (Navigator.of(context).canPop()) {
        Get.back();
      }
    });
  }
  void _openCompletedDaySheet(BuildContext context, int currentDay) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.4),
      barrierLabel: '',
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.topCenter,
          child: Material(
            color: Colors.transparent,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.darkGrey2.withOpacity(0.35),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(16.r),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 200.h,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 120.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(AppImages.topContainer),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${"Day".tr} ${currentDay.toString().padLeft(2, '0')} ",
                                    style: AppStyles.poppins20w600white,
                                  ),
                                  SvgPicture.asset(AppSvgs.circleTickSvg),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 30,
                              child: Container(
                                width: 100.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.sp),
                                  border: Border.all(color: AppColors.whiteColor,width: 1.5.w),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(currentDay.toString().padLeft(2, '0'),style: AppStyles.poppins20w600white.copyWith(color: AppColors.yellow),),
                                    5.horizontalSpace,
                                    Text("/",style: AppStyles.poppins20w600white,),
                                    5.horizontalSpace,
                                    Text(challengeTime,style: AppStyles.poppins20w600white,),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              child: GestureDetector(
                                onTap: () => Get.back(),
                                child: Image.asset(
                                  AppImages.backImageButton,
                                  height: 120.h,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 10.sp,vertical: 15.sp),
                        margin: EdgeInsets.symmetric(horizontal: 20.sp,vertical: 10.sp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.sp),
                          border: Border.all(width: 1.5.w,color: AppColors.whiteColor)
                        ),
                        child: Text("you still can complete all the challenges".tr,style: AppStyles.poppins14w500white,),
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: tasks.length,
                        itemBuilder: (context, index) {
                          final isSelected = selectedTaskIndices.contains(index);
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(40.sp),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: GestureDetector(
                                onTap: () {
                                  completionDialoge(context,0.20);
                                  debugPrint(
                                    'Selected tasks: ${getSelectedTaskNames()}',
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 20.w,
                                    vertical: 5.h,
                                  ),
                                  padding: EdgeInsets.all(10.sp),
                                  decoration: BoxDecoration(
                                    color:
                                    isSelected
                                        ? AppColors.yellow
                                        : AppColors.whiteColor.withOpacity(0.25),
                                    border: Border.all(
                                      color:
                                      isSelected
                                          ? AppColors.yellow.withOpacity(0.8)
                                          : AppColors.whiteColor,
                                      width: 1.5.w,
                                    ),
                                    borderRadius: BorderRadius.circular(5.sp),
                                  ),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        isSelected
                                            ? AppSvgs.checkBoxFillSvg
                                            : AppSvgs.checkBoxEmptySvg,
                                      ),
                                      10.horizontalSpace,
                                      Expanded(
                                        child: Text(
                                          tasks[index],
                                          style:
                                          isSelected
                                              ? AppStyles.poppins14w500white
                                              .copyWith(
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
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(0, -1),
            end: Offset.zero,
          ).animate(CurvedAnimation(parent: anim, curve: Curves.easeOut)),
          child: child,
        );
      },
    );
  }


  List<String> getSelectedTaskNames() {
    return selectedTaskIndices.map((index) => tasks[index]).toList();
  }

  void resetSelections() {
    setState(() {
      selectedTaskIndices.clear();
    });
  }
}
