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
                  Container(height: 140.h),
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
                    bottom: 10,
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 290.w,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.45),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: AppColors.lightBlue,
                              width: 1.w,
                            ),
                          ),
                          child: Row(
                            children: [
                              10.horizontalSpace,
                              Image.asset(
                                AppImages.searchIconCoursesDarkGery2,
                                height: 30.h,
                              ),
                              10.horizontalSpace,
                              SizedBox(
                                width: 100.w,
                                child: TextField(
                                  keyboardType: TextInputType.text,
                                  style: AppStyles.poppins12w600darkGrey2,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Search".tr,
                                    hintStyle: AppStyles.poppins12w600darkGrey2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        10.horizontalSpace,
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.favouriteView);
                          },
                          child: Container(
                            height: 60.h,
                            width: 50.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor.withOpacity(0.45),
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: AppColors.lightBlue,
                                width: 1.w,
                              ),
                            ),
                            child: SvgPicture.asset(
                              AppSvgs.heartSvg,
                              height: 30.h,
                              color: AppColors.darkGrey2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: CoursesViewModel.coursesList.length,
                itemBuilder: (context, mainIndex) {
                  return CustomCategoryList(
                    categoryName: CoursesViewModel.coursesList[mainIndex].categoryName,
                    child: ListView.builder(
                      padding: EdgeInsets.only(top: 10.h,bottom: 10.sp),
                      scrollDirection: Axis.horizontal,
                      itemCount: CoursesViewModel.coursesList[mainIndex].courses.length,
                      itemBuilder: (context, nestedIndex) {
                        final course = CoursesViewModel.coursesList[mainIndex].courses[nestedIndex];
                        final courseCategory = CoursesViewModel.coursesList[mainIndex].categoryName;
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
            ]
          ),
        ),
      ),
    );
  }
}
