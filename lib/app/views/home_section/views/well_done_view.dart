import 'package:base_project/app/routes/app_routes.dart';
import 'package:base_project/core/constants/app_fonts_and_styles.dart';
import 'package:base_project/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class WellDoneView extends StatelessWidget {
  const WellDoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(onTap: (){
                  crossClick();
                },child: Image.asset(AppImages.closeImage,height: 120.h,))
              ],
            ),
            Text('Well Done'.tr,style: AppStyles.urbanistBold32White900,),
            20.verticalSpace,
            SvgPicture.asset(AppImages.completed),
            20.verticalSpace,
            Text('We hope you got some \nmotivation today'.tr,style: AppStyles.poppins24w300white,textAlign: TextAlign.center,),
            40.verticalSpace,
            GestureDetector(
              onTap: (){
                goNext();
              },
              child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(AppImages.star,height: 30.h,),
                  10.horizontalSpace,
                  Text(
                      'Upgrade Now'.tr,
                      style: AppStyles.poppins14w700white
                  ),
                ],
              ),
                        ),
            )
          ],
        ),
      ),
    );
  }

  void crossClick() {
    Get.back();
  }

  void goNext() {
    print('Next');
    //Get.toNamed(AppRoutes.notificationsView);
    Get.toNamed(AppRoutes.bottomNavNavigation);
  }
}
