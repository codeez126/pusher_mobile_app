import 'package:base_project/app/routes/app_routes.dart';
import 'package:base_project/core/widgets/Notifocation_view/custom_notification_by_day.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/Constants/app_colors.dart';
import '../../../../core/constants/app_fonts_and_styles.dart';
import '../../../../core/constants/app_images.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Container(
        height: double.infinity,
        width: double.infinity,
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
                          child: SvgPicture.asset(AppImages.backImage,height: 120.h,),
                          // Image.asset(
                          //   AppImages.imageBackIcon,
                          //   height: 120.h,
                          // ),
                        ),
                      ),
                      Positioned(
                        bottom: 35,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(AppImages.notificationBellSvg),
                                10.horizontalSpace,
                                Text(
                                  'Notifications'.tr,
                                  style: AppStyles.poppins20w600darkGrey2,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            10.verticalSpace,
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    InkWell(
                    onTap: (){
                      Get.toNamed(AppRoutes.bottomNavNavigation);
                    },
                    child: CustomNotificationByDay(weekday: 'TODAY'.tr)),
                    16.verticalSpace,
                    CustomNotificationByDay(weekday: 'YESTERDAY'.tr),
                    16.verticalSpace,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
