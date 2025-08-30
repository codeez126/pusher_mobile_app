import 'dart:ui';

import 'package:base_project/app/routes/app_routes.dart';
import 'package:base_project/app/views/courses_section/controller/courses_controller.dart';
import 'package:base_project/app/views/courses_section/model/courses_view_model.dart';
import 'package:base_project/core/widgets/courses_view/custom_category_list.dart';
import 'package:base_project/core/widgets/courses_view/custom_listview_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../core/Constants/app_colors.dart';
import '../../../../core/constants/app_fonts_and_styles.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/constants/app_svgs.dart';
import '../model/course_add_fav_model.dart';

class CoursesView extends StatelessWidget {
  CoursesView({super.key});

  final CoursesController coursesController = Get.put(CoursesController());

  @override
  Widget build(BuildContext context) {
    final CoursesViewModel coursesViewModel;
    return Scaffold(
      extendBody: false,
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
                clipBehavior: Clip.none,
                fit: StackFit.passthrough,
                alignment: Alignment.topCenter,
                children: [
                  // Container(height: 140.h),
                  Container(
                    height: 100.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(50.sp),
                      ),
                      color: AppColors.whiteColor.withOpacity(0.20),
                    ),
                    child: Stack(children: []),
                  ),
                  Positioned(
                    bottom: -20,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      width: Get.width,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 47,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(
                                      0xff1E5DA1,
                                    ).withValues(alpha: 0.15),
                                    offset: Offset(0, 4),
                                    blurRadius: 10,
                                    spreadRadius: 0,
                                  ),
                                ],
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                style: AppStyles.poppins14w400darkGrey2,

                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                      color: AppColors.lightBlue,
                                      width: 1,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                      color: AppColors.lightBlue,
                                      width: 1,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                      color: AppColors.lightBlue,
                                      width: 1,
                                    ),
                                  ),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 16,
                                      right: 8,
                                      top: 16,
                                      bottom: 16,
                                    ),
                                    child: Image.asset(
                                      AppImages.searchIconCoursesDarkGery2,
                                      height: 20,
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: AppColors.whiteColor.withOpacity(
                                    0.45,
                                  ),
                                  // contentPadding: EdgeInsets.all(8),
                                  hintText: "Search".tr,
                                  hintStyle: AppStyles.poppins14w400darkGrey2,
                                ),
                              ),
                            ),
                          ),
                          10.horizontalSpace,
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.favouriteView);
                            },
                            child: Container(
                              height: 47,
                              width: 44,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor.withOpacity(0.45),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: AppColors.lightBlue,
                                  width: 1,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(
                                      0xff1E5DA1,
                                    ).withValues(alpha: 0.15),
                                    offset: Offset(0, 4),
                                    blurRadius: 10,
                                    spreadRadius: 0,
                                  ),
                                ],
                              ),
                              child: SvgPicture.asset(
                                AppSvgs.heartSvg,
                                height: 30.h,
                                color: AppColors.blackColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: CoursesViewModel.coursesList.length,
                  // padding: EdgeInsets.only(top: 30),
                  itemBuilder: (context, mainIndex) {
                    return CustomCategoryList(
                      categoryName:
                          CoursesViewModel.coursesList[mainIndex].categoryName,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            CoursesViewModel
                                .coursesList[mainIndex]
                                .courses
                                .length,
                        itemBuilder: (context, nestedIndex) {
                          final course =
                              CoursesViewModel
                                  .coursesList[mainIndex]
                                  .courses[nestedIndex];
                          final courseCategory =
                              CoursesViewModel
                                  .coursesList[mainIndex]
                                  .categoryName;
                          final courseTitle = course.title;
                          final courseImage = course.backgroundImage;
                          final courseDurations = course.duration;
                          final timelineMinutes = course.timeLine.minutes;
                          final timelineSeconds = course.timeLine.seconds;
                          final courses = CoursesAddingFavModel(
                            categoryName: courseCategory,
                            title: courseTitle,
                            imagePath: courseImage,
                            courseDurations: courseDurations,
                            favIcon: AppSvgs.heartSvg,
                          );

                          return CustomListviewItem(
                            course: courses,
                            onTap: () {
                              Get.toNamed(
                                AppRoutes.coursesDetailView,
                                arguments: {
                                  'title': courseTitle,
                                  'category': courseCategory,
                                  'backgroundImage': courseImage,
                                  'courseDurations': courseDurations,
                                  'courseTimelineMinutes': timelineMinutes,
                                  'courseTimelineSeconds': timelineSeconds,
                                  'selectedCourseIndex': nestedIndex,
                                  'categoryIndex': mainIndex,
                                },
                              );
                            },
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              // ),
              // CustomCategoryList(
              //     categoryName: CoursesViewModel.coursesList[0].categoryName,
              //     child: ListView.builder(
              //       padding: EdgeInsets.only(top: 10.h),
              //       scrollDirection: Axis.horizontal,
              //       itemCount: CoursesViewModel.coursesList[0].courses.length,
              //       itemBuilder: (context, index) {
              //         final course = CoursesViewModel.coursesList[0].courses[index];
              //         final courseCategory = CoursesViewModel.coursesList[0].categoryName;
              //         final courseTittle = course.title;
              //         final courseImage = course.backgroundImage;
              //         final courseDurations = course.duration;
              //         final timelineMinutes = course.timeLine.minutes;
              //         final timelineSeconds = course.timeLine.seconds;
              //         final courses = CoursesAddingFavModel(
              //           categoryName: courseCategory,
              //           title: courseTittle,
              //           imagePath: courseImage,
              //           courseDurations: courseDurations,
              //           favIcon: AppSvgs.heartSvg,
              //         );
              //         return CustomListviewItem(
              //           course: courses,
              //           onTap: () {
              //             Get.toNamed(
              //               AppRoutes.coursesDetailView,
              //               arguments: {
              //                 'title': courseTittle,
              //                 'category': courseCategory,
              //                 'backgroundImage': courseImage,
              //                 'courseDurations': courseDurations,
              //                 'courseTimelineMinutes': timelineMinutes,
              //                 'courseTimelineSeconds': timelineSeconds,
              //                 'selectedCourseIndex': index,
              //                 'categoryIndex': 0,
              //               },
              //             );
              //           },
              //         );
              //       },
              //     )),
              //
              // 10.verticalSpace,
              // CustomCategoryList(
              //     categoryName: CoursesViewModel.coursesList[1].categoryName,
              //     child: ListView.builder(
              //       padding: EdgeInsets.only(top: 10.h),
              //       scrollDirection: Axis.horizontal,
              //       itemCount: CoursesViewModel.coursesList[1].courses.length,
              //       itemBuilder: (context, index) {
              //         final course = CoursesViewModel.coursesList[1].courses[index];
              //         final courseCategory = CoursesViewModel.coursesList[1].categoryName;
              //         final courseTittle = course.title;
              //         final courseImage = course.backgroundImage;
              //         final courseDurations = course.duration;
              //         final timelineMinutes = course.timeLine.minutes;
              //         final timelineSeconds = course.timeLine.seconds;
              //         final courses = CoursesAddingFavModel(
              //           categoryName: courseCategory,
              //           title: courseTittle,
              //           imagePath: courseImage,
              //           courseDurations: courseDurations,
              //           favIcon: AppSvgs.heartSvg,
              //         );
              //         return CustomListviewItem(
              //           course: courses,
              //           onTap: () {
              //             Get.toNamed(
              //               AppRoutes.coursesDetailView,
              //               arguments: {
              //                 'title': courseTittle,
              //                 'category': courseCategory,
              //                 'backgroundImage': courseImage,
              //                 'courseDurations': courseDurations,
              //                 'courseTimelineMinutes': timelineMinutes,
              //                 'courseTimelineSeconds': timelineSeconds,
              //                 'selectedCourseIndex': index,
              //                 'categoryIndex': 1,
              //               },
              //             );
              //           },
              //         );
              //       },
              //     )),
            ],
          ),
        ),
      ),
    );
  }
}
