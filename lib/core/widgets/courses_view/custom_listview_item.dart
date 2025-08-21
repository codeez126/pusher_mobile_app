import 'package:base_project/core/widgets/courses_view/custom_course_duration_container.dart';
import 'package:base_project/core/widgets/daily_course_view/custom_audio_waveform_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../app/views/courses_section/controller/favorites_controller.dart';
import '../../../app/views/courses_section/model/course_add_fav_model.dart';
import '../../Constants/app_colors.dart';
import '../../constants/app_fonts_and_styles.dart';
import '../../constants/app_svgs.dart';

class CustomListviewItem extends StatelessWidget {
  final CoursesAddingFavModel course;
  final Function onTap;
  final FavoritesController favoritesController = Get.put(FavoritesController());

  CustomListviewItem({
    super.key,
    required this.course,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final favIcon = AppSvgs.heartFavSvg;
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        alignment: Alignment.bottomCenter,
        height: 170.h,
        width: 233.w,
        decoration: BoxDecoration(
          color: AppColors.yellow,
          borderRadius: BorderRadius.circular(25.sp),
        ),
        margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              course.title,
              maxLines: 1,
              textAlign: TextAlign.center,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.poppins12w700white,
            ),
            5.verticalSpace,
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.sp),
                image: DecorationImage(
                  image: AssetImage(course.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
              height: 180.h,
              padding: EdgeInsets.all(8.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Favorite Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Obx(() {
                        final isFav = favoritesController.isFavorite(course.title);
                        return GestureDetector(
                          onTap: () {
                            favoritesController.toggleFavorite(course);
                          },
                          child: SvgPicture.asset(
                            isFav?AppSvgs.heartFavSvg:AppSvgs.heartSvg,
                            height: 30.h,
                            color: isFav?AppColors.yellow:AppColors.whiteColor,
                          ),
                        );
                      }),
                    ],
                  ),

                  const Spacer(),
                  CustomAudioWaveformPlayer(
                    isTimerEnabled: false,
                    height: 50.h,
                    buttonHeight: 50.h,
                    buttonWidth: 50.w,
                    isAudioContainerBackground: true,
                    isBackgroundContainerEnabled: false,
                    backgroundColor: Colors.transparent,
                  ),
                  10.verticalSpace,
                  CustomCourseDurationContainer(text: course.courseDurations),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
