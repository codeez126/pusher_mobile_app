import 'dart:ui';

import 'package:base_project/app/routes/app_routes.dart';
import 'package:base_project/core/widgets/custom_app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/Constants/app_colors.dart';
import '../../../../core/constants/app_fonts_and_styles.dart';
import '../../../../core/constants/app_images.dart';

class DailyTaskView extends StatefulWidget {
  DailyTaskView({Key? key}) : super(key: key);

  @override
  State<DailyTaskView> createState() => _DailyTaskViewState();
}

class _DailyTaskViewState extends State<DailyTaskView> {
  int currentPage = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
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
                Container(height: 210.h),
                Container(
                  height: 170.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(50.sp),
                    ),
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
                          child: SvgPicture.asset(
                            AppImages.backImage,
                            height: 120.h,
                          ),
                          // Image.asset(
                          //   AppImages.imageBackIcon,
                          //   height: 120.h,
                          // ),
                        ),
                      ),
                      Positioned(
                        bottom: 55,
                        child: Text(
                          'Daily Challenge',
                          style: AppStyles.poppins20w600darkGrey2,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 13.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45.sp),
                      color: const Color(0xff0E1E2E4),
                    ),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'choose',
                            style: AppStyles.poppins16w400darkGrey2,
                          ),
                          TextSpan(
                            text: ' One',
                            style: AppStyles.poppins16w900darkGrey2,
                          ),
                          TextSpan(
                            text: '\nchallenge for today',
                            style: AppStyles.poppins16w400darkGrey2,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Info Icon
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    margin: EdgeInsets.all(20.sp),
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
              ],
            ),
            40.verticalSpace,
            SizedBox(
              height: 450.h,
              child: PageView(
                controller: pageController,
                scrollDirection: Axis.horizontal,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                    print(currentPage);
                  });
                },
                children: [
                  buildPageViewItem(
                    '5 Minute',
                    'Meditation',
                    AppStyles.urbanistBold30Yellow700,
                    'Take a 5 minute break today to go outside in the sun and breathe air',
                    AppImages.yogaSvg,
                    AppImages.meditationBackgroundImage,
                    () {
                      Get.toNamed(AppRoutes.dailyTaskDoingView);
                    },
                  ),
                  buildPageViewItem(
                    'Meet A',
                    'Friend',
                    AppStyles.urbanistBold30LightBlue700,
                    'meeting a friend I haven\'t seen in a long time',
                    AppImages.friendsSvg,
                    AppImages.friendBackgroundImage,
                    () {},
                  ),
                  buildPageViewItem(
                    'Take A',
                    'Walk',
                    AppStyles.urbanistBold30Yellow700,
                    'Go for a walk in a place you like, for example at the sea or even under the house',
                    AppImages.walkSvg,
                    AppImages.walkBackgroundImage,
                    () {},
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => Container(
                  height: 15.h,
                  width: currentPage == index ? 70.w : 15.w,
                  margin: EdgeInsets.all(2.sp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.sp),
                    color:
                        currentPage == index
                            ? AppColors.whiteColor
                            : AppColors.whiteColor.withOpacity(0.4),
                    border: Border.all(
                      color: AppColors.whiteColor,
                      width: 1.5.w,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPageViewItem(
    String title,
    String heading,
    TextStyle headingStyle,
    String description,
    String svgIcon,
    String backgroundImage,
    Function onTap,
  ) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(height: 370.h),
            Container(
              height: 300.h,
              margin: EdgeInsets.symmetric(horizontal: 30.w),
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: Colors.black,
                backgroundBlendMode: BlendMode.srcIn,
                border: Border.all(width: 1.5.w, color: AppColors.whiteColor),
                image: DecorationImage(
                  image: AssetImage(backgroundImage),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  currentPage == 0
                      ? Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          SvgPicture.asset(AppImages.meditationClockSvg),
                          Text(title, style: AppStyles.urbanistBold20White600),
                        ],
                      )
                      : Text(title, style: AppStyles.urbanistBold20White600),
                  if (currentPage == 1 || currentPage == 2) 10.verticalSpace,
                  Text(heading, style: headingStyle),
                  if (currentPage == 1 || currentPage == 2) 10.verticalSpace,
                  Text(
                    description,
                    style: AppStyles.poppins14w500white,
                    textAlign: TextAlign.center,
                  ),
                  if (currentPage == 1 || currentPage == 2) 10.verticalSpace,
                  SvgPicture.asset(
                    svgIcon,
                    height: currentPage == 1 || currentPage == 2 ? 50.h : null,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
                decoration: BoxDecoration(
                  color: AppColors.darkGrey2.withOpacity(0.80),
                  borderRadius: BorderRadius.circular(40.sp),
                  border: Border.all(color: AppColors.whiteColor, width: 1.5.w),
                ),
                child: Text(
                  currentPage == 0
                      ? '01'
                      : currentPage == 1
                      ? '02'
                      : '03',
                  style: AppStyles.poppins28w600white,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 8.h, right: 70.w, left: 70.w),
          child: CustomAppButton(
            onTap: () {
              onTap();
            },
            text: 'Take This Challenge',
            isIcon: false,
            textStyle: AppStyles.poppins16w600white,
          ),
        ),
      ],
    );
  }
}
