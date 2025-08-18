import 'dart:ui';

import 'package:base_project/app/routes/app_routes.dart';
import 'package:base_project/app/views/courses_section/controller/courses_controller.dart';
import 'package:base_project/core/widgets/courses_view/custom_category_list.dart';
import 'package:base_project/core/widgets/courses_view/custom_listview_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/Constants/app_colors.dart';
import '../../../../core/constants/app_fonts_and_styles.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/constants/app_svgs.dart';
import '../controller/favorites_controller.dart';
import '../model/course_model.dart';

class CoursesView extends StatelessWidget {
  CoursesView({super.key});

  final CoursesController coursesController = Get.put(CoursesController());

  @override
  Widget build(BuildContext context) {
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
                                  keyboardType: TextInputType.phone,
                                  style: AppStyles.poppins12w600darkGrey2,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Search',
                                    hintStyle: AppStyles.poppins12w600darkGrey2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        10.horizontalSpace,
                        GestureDetector(
                          onTap: (){
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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomCategoryList(
                        categoryName: "For You",
                        child: ListView.builder(
                          padding: EdgeInsets.only(top: 10.h),
                          scrollDirection: Axis.horizontal,
                          itemCount: coursesController.forYouCategoryTittleList.length,
                          itemBuilder: (context, index) {
                            final course = Course(
                              categoryName: "For You",
                              title: coursesController.forYouCategoryTittleList[index],
                              imagePath: coursesController.forYouBackgroundImages[index],
                              favIcon: AppSvgs.heartSvg,
                            );
                            return CustomListviewItem(course: course);
                          },
                        ),
                      ),
                      CustomCategoryList(
                        categoryName: "Financial",
                        child: ListView.builder(
                          padding: EdgeInsets.only(top: 10.h),
                          scrollDirection: Axis.horizontal,
                          itemCount: coursesController.financialCategoryTittleList.length,
                          itemBuilder: (context, index) {
                            final course = Course(
                              categoryName: "Financial",
                              title: coursesController.financialCategoryTittleList[index],
                              imagePath: coursesController.financialBackgroundImages[index],
                              favIcon: AppSvgs.heartSvg,
                            );
                            return CustomListviewItem(course: course);
                          },
                        ),
                      ),

                      // CustomCategoryList(
                      //   categoryName: "For You",
                      //   child: ListView.builder(
                      //     padding: EdgeInsets.only(top: 10.h),
                      //     scrollDirection: Axis.horizontal,
                      //     itemCount:
                      //         coursesController.coursesBackgroundImages.length,
                      //     itemBuilder: (context, index) {
                      //       return CustomListviewItem(
                      //         tittle: coursesController.forYouCategoryTittleList[index],
                      //         coursesBackgroundImages:
                      //             coursesController
                      //                 .forYouBackgroundImages[index],
                      //         favIcon: AppSvgs.heartSvg,
                      //       );
                      //     },
                      //   ),
                      // ),
                      // 10.verticalSpace,
                      // CustomCategoryList(
                      //   categoryName: "Financial",
                      //   child: ListView.builder(
                      //     padding: EdgeInsets.only(top: 10.h),
                      //     scrollDirection: Axis.horizontal,
                      //     itemCount:
                      //         coursesController.coursesBackgroundImages.length,
                      //     itemBuilder: (context, index) {
                      //       return CustomListviewItem(
                      //         tittle: coursesController.financialCategoryTittleList[index],
                      //         coursesBackgroundImages:
                      //             coursesController
                      //                 .financialBackgroundImages[index],
                      //         favIcon: AppSvgs.heartSvg,
                      //       );
                      //     },
                      //   ),
                      // ),
                      // 10.verticalSpace,
                      // CustomCategoryList(
                      //   categoryName: "Self Improvement",
                      //   child: ListView.builder(
                      //     padding: EdgeInsets.only(top: 10.h),
                      //     scrollDirection: Axis.horizontal,
                      //     itemCount:
                      //         coursesController.coursesBackgroundImages.length,
                      //     itemBuilder: (context, index) {
                      //       return CustomListviewItem(
                      //         tittle: coursesController.selfImprovementCategoryTittleList[index],
                      //         coursesBackgroundImages:
                      //             coursesController
                      //                 .selfImprovementsBackgroundImages[index],
                      //         favIcon: AppSvgs.heartSvg,
                      //       );
                      //     },
                      //   ),
                      // ),
                      // 10.verticalSpace,
                      // CustomCategoryList(
                      //   categoryName: "Romantic",
                      //   child: ListView.builder(
                      //     padding: EdgeInsets.only(top: 10.h),
                      //     scrollDirection: Axis.horizontal,
                      //     itemCount:
                      //         coursesController.coursesBackgroundImages.length,
                      //     itemBuilder: (context, index) {
                      //       return CustomListviewItem(
                      //         tittle: coursesController.selfImprovementCategoryTittleList[index],
                      //         coursesBackgroundImages:
                      //             coursesController
                      //                 .romanticBackgroundImages[index],
                      //         favIcon: AppSvgs.heartSvg,
                      //       );
                      //     },
                      //   ),
                      // ),
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
