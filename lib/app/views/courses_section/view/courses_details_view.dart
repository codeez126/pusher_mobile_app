import 'dart:ui';
import 'package:base_project/core/constants/app_fonts_and_styles.dart';
import 'package:base_project/core/constants/app_svgs.dart';
import 'package:base_project/core/widgets/courses_view/custom_course_duration_container.dart';
import 'package:base_project/core/widgets/daily_course_view/custom_audio_waveform_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../core/Constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';
import '../model/courses_view_model.dart';

class CoursesDetailsView extends StatefulWidget {
  const CoursesDetailsView({super.key});

  @override
  State<CoursesDetailsView> createState() => _CoursesDetailsViewState();
}

class _CoursesDetailsViewState extends State<CoursesDetailsView> {
  late String title;
  late String category;
  late String backgroundImage;
  late String courseDurations;
  late int courseTimelineMinutes;
  late int courseTimelineSeconds;
  late int selectedCourseIndex;
  late int categoryIndex;
  late List<Course> reorderedCourses;
  int currentCourseIndex = 0;

  @override
  void initState() {
    super.initState();
    final args = Get.arguments as Map<String, dynamic>;
    title = args['title'];
    category = args['category'];
    backgroundImage = args['backgroundImage'];
    courseDurations = args['courseDurations'];
    courseTimelineMinutes = args['courseTimelineMinutes'];
    courseTimelineSeconds = args['courseTimelineSeconds'];
    selectedCourseIndex = args['selectedCourseIndex'];
    categoryIndex = args['categoryIndex'];
    _reorderCourses();
  }

  void _reorderCourses() {
    final originalCourses = CoursesViewModel.coursesList[categoryIndex].courses;
    reorderedCourses = [];
    reorderedCourses.add(originalCourses[selectedCourseIndex]);
    for (int i = 0; i < originalCourses.length; i++) {
      if (i != selectedCourseIndex) {
        reorderedCourses.add(originalCourses[i]);
      }
    }
  }

  void updateCurrentCourse(int index) {
    setState(() {
      currentCourseIndex = index;
      final currentCourse = reorderedCourses[index];
      title = currentCourse.title;
      backgroundImage = currentCourse.backgroundImage;
      courseDurations = currentCourse.duration;
      courseTimelineMinutes = currentCourse.timeLine.minutes;
      courseTimelineSeconds = currentCourse.timeLine.seconds;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
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
                children: [
                  // Container(height: 190.h),
                  Container(
                    height: 330,
                    width: double.infinity,
                    // alignment: Alignment.bottomCenter,
                    // padding: EdgeInsets.only(bottom: 4),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(50.sp),
                      ),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            // height: 350.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.blackColor,
                              borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(50.sp),
                              ),
                              image: DecorationImage(
                                image: AssetImage(backgroundImage),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                bottom: 10.sp,
                                left: 16,
                                right: 16,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CustomAudioWaveformPlayer(
                                    width: Get.width,
                                    isAudioContainerBackground: true,
                                    backgroundColor: AppColors.darkGrey2
                                        .withOpacity(0.22),
                                    totalDuration: Duration(
                                      minutes: courseTimelineMinutes,
                                      seconds: courseTimelineSeconds,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: RichText(
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            maxLines: 1,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "current lesson:".tr,
                                  style: AppStyles.poppins14w700darkGrey2,
                                ),
                                TextSpan(
                                  text: "  Shifting Your Perspective".tr,
                                  style: AppStyles.poppins14w400darkGrey2,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 120,
                    alignment: Alignment.bottomCenter,
                    width: double.infinity,
                    padding: EdgeInsets.only(bottom: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(50.sp),
                      ),
                      color: AppColors.yellow,
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(50.sp),
                            ),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                alignment: Alignment.bottomCenter,
                                width: double.infinity,
                                // height: 80,
                                padding: EdgeInsets.only(bottom: 10.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(50.sp),
                                  ),
                                  color: AppColors.whiteColor.withOpacity(0.45),
                                ),
                                child: Text(
                                  "\"$title\"".tr,
                                  style: AppStyles.poppins20w600darkGrey2,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AppSvgs.financialIconSvg,
                              height: 18,
                            ),
                            SizedBox(width: 5),
                            Text(
                              category.tr,
                              style: AppStyles.poppins16w600white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Positioned(
                    top: 50,
                    left: 0,
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        Get.back();
                        print('tapped');
                      },
                      child: Image.asset(AppImages.backImage, height: 100),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      10.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 20.w),
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 5.h,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(20.sp),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(AppSvgs.clockSvg),
                                5.horizontalSpace,
                                Text(
                                  courseDurations.tr,
                                  style: AppStyles.poppins12w700darkGrey2,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      10.verticalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Text(
                              "All Lessons",
                              style: AppStyles.poppins16w600darkGrey2,
                            ),
                          ),
                          10.verticalSpace,
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            itemCount: reorderedCourses.length,
                            itemBuilder: (context, index) {
                              final course = reorderedCourses[index];
                              final isCurrentCourse =
                                  index == currentCourseIndex;
                              return Container(
                                margin: EdgeInsets.only(bottom: 15.h),
                                child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 150,
                                      decoration: BoxDecoration(
                                        color: AppColors.yellow,
                                        borderRadius: BorderRadius.circular(
                                          25.sp,
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 150.w,
                                            margin: EdgeInsets.all(1.sp),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25.sp),
                                              image: DecorationImage(
                                                image: AssetImage(
                                                  course.backgroundImage,
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                CustomAudioWaveformPlayer(
                                                  buttonHeight: 30.h,
                                                  buttonWidth: 30.w,
                                                  playPauseIconHeight: 10.h,
                                                  isBackgroundContainerEnabled:
                                                      false,
                                                  isTimerEnabled: false,
                                                  isWaveForm: false,
                                                ),
                                                20.verticalSpace,
                                              ],
                                            ),
                                          ),
                                          10.horizontalSpace,
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                8.0,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,

                                                children: [
                                                  Text(
                                                    course.title,
                                                    textAlign: TextAlign.center,
                                                    softWrap: true,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style:
                                                        AppStyles
                                                            .poppins16w600white,
                                                  ),
                                                  SizedBox(height: 5),
                                                  Text(
                                                    course.description,
                                                    textAlign: TextAlign.left,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 3,
                                                    softWrap: true,
                                                    style: AppStyles
                                                        .poppins12w300white
                                                        .copyWith(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 52,
                                      child: Stack(
                                        alignment: Alignment.bottomCenter,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(10.sp),
                                              bottom: Radius.circular(23.sp),
                                            ),
                                            child: BackdropFilter(
                                              filter: ImageFilter.blur(
                                                sigmaX: 10,
                                                sigmaY: 10,
                                              ),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: 3,
                                                    color: AppColors.whiteColor
                                                        .withOpacity(0.30),
                                                    child:
                                                        LinearProgressIndicator(
                                                          value: 0.4,
                                                          color:
                                                              AppColors
                                                                  .lightBlue,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          minHeight: 3,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.symmetric(
                                                          horizontal: 10,
                                                        ),
                                                    child:
                                                        CustomCourseDurationContainer(
                                                          text: course.duration,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
