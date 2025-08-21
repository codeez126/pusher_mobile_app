import 'dart:ui';

import 'package:base_project/core/widgets/courses_view/custom_listview_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/Constants/app_colors.dart';
import '../../../../core/constants/app_fonts_and_styles.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/constants/app_svgs.dart';
import '../controller/favorites_controller.dart';


class FavouriteView extends StatelessWidget {
  FavouriteView({super.key});

  final FavoritesController favoritesController = Get.put(FavoritesController());

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
                alignment: Alignment.topCenter,
                children: [
                  Container(height: 180.h),
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.only(bottom: 30.h),
                    height: 130.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(50.sp),
                      ),
                      color: AppColors.yellow,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(AppSvgs.heartSvg,color: AppColors.darkGrey2,),
                        5.horizontalSpace,
                        Text(
                          "Favorites".tr,
                          style: AppStyles.poppins20w600darkGrey2,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        Get.back();
                        print('tapped');
                      },
                      child: Image.asset(AppImages.backImage, height: 130.h),
                    ),
                  ),
                ],
              ),
              10.verticalSpace,

              Obx(() {
                if (favoritesController.favorites.isEmpty) {
                  return Center(child: Text("No favorites yet".tr));
                }
                return SizedBox(
                  height: 270.h,
                  child: ListView.builder(
                    scrollDirection:Axis.horizontal,
                    itemCount: favoritesController.favorites.length,
                    itemBuilder: (context, index) {
                      final course = favoritesController.favorites[index];
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: CustomListviewItem(
                              course: course, onTap: (){},
                          )),
                          5.verticalSpace,
                          Container(
                            margin: EdgeInsets.only(left: 10.w),
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(25.sp),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
                            child: Text(
                              course.categoryName,
                              style: AppStyles.poppins12w700darkGrey2,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
