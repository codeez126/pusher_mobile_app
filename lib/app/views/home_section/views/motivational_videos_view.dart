import 'dart:ui';
import 'package:base_project/app/views/home_section/controller/motivational_videos_controller.dart';
import 'package:base_project/core/constants/app_svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../core/Constants/app_colors.dart';
import '../../../../core/constants/app_fonts_and_styles.dart';
import '../../../../core/constants/app_images.dart';

class MotivationalVideosView extends StatelessWidget {
  MotivationalVideosView({super.key});

  final MotivationalVideosController motivationalVideosController = Get.put(MotivationalVideosController());

  @override
  Widget build(BuildContext context) {
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
        child: Stack(
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(50.sp),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      height: 100.h,
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
                            bottom: 10,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(AppSvgs.arrowDown_x2Svg),
                                5.horizontalSpace,
                                RichText(text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Motivation Video Mix".tr,
                                      style: AppStyles.poppins14w300darkGrey2
                                    ),
                                    TextSpan(
                                      text: "All Videos".tr,
                                      style: AppStyles.poppins14w700darkGrey2
                                    )
                                  ]
                                )),
                                5.horizontalSpace,
                                SvgPicture.asset(AppSvgs.arrowDown_x2Svg),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                10.verticalSpace,
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: motivationalVideosController.images.length,
                    itemBuilder: (context, index) {
                      final images = motivationalVideosController.images;
                      final fav = motivationalVideosController.isFavourite.value;
                   return Container(
                     height: 160.h,
                     margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(20.r),
                       color: AppColors.darkGrey2.withOpacity(0.85),
                     ),
                     child: Row(
                       children: [
                         Container(
                           width: 140.w,
                           height: MediaQuery.of(context).size.height,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.only(
                               topLeft: Radius.circular(20.r),
                               bottomLeft: Radius.circular(20.r),
                             ),
                           ),
                           child: ClipRRect(
                             borderRadius: BorderRadius.only(
                               topLeft: Radius.circular(20.r),
                               bottomLeft: Radius.circular(20.r),
                             ),
                             child: Image.asset(
                               images[index],
                               fit: BoxFit.cover,
                             ),
                           ),
                         ),
                         Expanded(
                           child: Padding(
                             padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 15.h),
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Text(
                                   '"Change Your Mind"'.tr,
                                   style: AppStyles.poppins14w700whiteItalic,
                                 ),
                                 Container(
                                   padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 1.h),
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(12.sp),
                                     color: AppColors.whiteColor.withOpacity(0.40),
                                   ),
                                   child: Text(
                                     'By Sam Mor - Mental Adviser'.tr,
                                     style: AppStyles.poppins12w300white,
                                   ),
                                 ),
                                 10.verticalSpace,
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     GestureDetector(
                                       onTap: (){
                                         //motivationalVideosController.addOrRemoveFav();
                                       },
                                       child: fav?SvgPicture.asset(AppSvgs.heartFavSvg,height: 30.h,):SvgPicture.asset(
                                         AppSvgs.heartSvg,
                                       ),
                                     ),
                                     GestureDetector(
                                       onTap: (){
                                         print('Play');

                                       },
                                       child: Container(
                                         height: 40.w,
                                         width: 40.w,
                                         alignment: Alignment.center,
                                         decoration: BoxDecoration(
                                           shape: BoxShape.circle,
                                           color: AppColors.whiteColor.withOpacity(0.15),
                                           border: Border.all(
                                             color: AppColors.whiteColor,
                                             width: 1,
                                           ),
                                         ),
                                         child: SvgPicture.asset(
                                           AppSvgs.playSvg,
                                           height: 15.h,
                                         ),
                                       ),
                                     ),
                                   ],
                                 )

                               ],
                             ),
                           ),
                         ),
                       ],
                     ),
                   );
                  },),
                )
              ],
            ),
            Positioned(
              left: 0,
              top: 80.h,
              child: InkWell(
                onTap: () => Get.back(),
                child: SvgPicture.asset(
                  AppSvgs.backImageSvg,
                  height: 120.h,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
