import 'dart:ui';
import 'package:base_project/app/views/home_section/views/daily_course_view.dart';
import 'package:base_project/app/views/home_section/views/daily_goals_view.dart';
import 'package:base_project/app/views/home_section/views/pusher_challenge_view.dart';
import 'package:base_project/app/views/home_section/views/well_done_view.dart';
import 'package:base_project/app/views/registration_section/view/otp_verfication_view.dart';
import 'package:base_project/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/Constants/app_colors.dart';

class BottomNavNavigation extends StatefulWidget {
  const BottomNavNavigation({super.key});

  @override
  State<BottomNavNavigation> createState() => _BottomNavNavigationState();
}

class _BottomNavNavigationState extends State<BottomNavNavigation> {
  int selectedIndex = 1;

  final List<Widget> screens = [
    WellDoneView(),
    DailyGoalsView(),
    DailyCourseView(),
 //   MotivationalVideosView(),
    PusherChallengeView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screens[selectedIndex],
      bottomNavigationBar: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.whiteColor.withOpacity(0.70),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              selectedItemColor: AppColors.darkGrey2,
              unselectedItemColor: AppColors.darkGrey2.withOpacity(0.90),
              iconSize: 25.h,
              currentIndex: selectedIndex,
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
              mouseCursor: MouseCursor.defer,
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppImages.personSvg,
                    colorFilter: ColorFilter.mode(
                      selectedIndex == 0
                          ? AppColors.darkGrey2
                          : AppColors.darkGrey2.withOpacity(0.30),
                      BlendMode.srcIn,
                    ),
                  ),
                  label: 'Profile',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppImages.dailyCourseSvg,
                    colorFilter: ColorFilter.mode(
                      selectedIndex == 1
                          ? AppColors.darkGrey2
                          : AppColors.darkGrey2.withOpacity(0.30),
                      BlendMode.srcIn,
                    ),
                  ),
                  label: 'Daily Goals',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppImages.coursesSvg,
                    colorFilter: ColorFilter.mode(
                      selectedIndex == 2
                          ? AppColors.darkGrey2
                          : AppColors.darkGrey2.withOpacity(0.30),
                      BlendMode.srcIn,
                    ),
                  ),
                  label: 'Courses',
                ),
                BottomNavigationBarItem(
                  icon: Opacity(
                    opacity: selectedIndex == 3 ? 1 : 0.4,
                    child: Image.asset(
                      AppImages.challenge,
                      height: 35.h,
                      colorBlendMode: BlendMode.srcIn,
                    ),
                  ),
                  label: 'Challenges',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}