import 'package:base_project/core/constants/app_svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Constants/app_colors.dart';
import '../../constants/app_fonts_and_styles.dart';
import '../../constants/app_images.dart';
import '../premium_subscrption_view/custom_feature_item.dart';
import '../premium_subscrption_view/custom_upgrade_button.dart';

class CustomPremiumBox extends StatelessWidget {
  CustomPremiumBox({super.key,
  required this.plan,
  required this.onTap,
  });

  bool plan;
  Function onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          margin: EdgeInsets.only(bottom: 16, left: 10.w, right: 10.w),
          decoration: BoxDecoration(
            color:
            plan
                ? AppColors.whiteColor.withOpacity(0.30)
                : AppColors.yellow.withOpacity(0),
            image: DecorationImage(
              image: AssetImage(AppImages.premiumPackageBackground),
            ),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color:
              plan
                  ? AppColors.whiteColor.withOpacity(0.30)
                  : Colors.white.withOpacity(0),
              width: 2,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              50.verticalSpace,
              Text('Premium'.tr, style: AppStyles.poppins16w700white),
              CustomFeatureItem(
                text: 'Unlock Extra Challenges For 30 Days'.tr,
                isSvgImage: true,
                svgImage: AppSvgs.lockSvg,
                textStyle: AppStyles.poppins12w300white,
              ),
              CustomFeatureItem(
                text:
                "Get the complete progress for yourself with premium challenges".tr,
                textStyle: AppStyles.poppins14w700white,
              ),
              const SizedBox(height: 12), // small gap
              CustomUpgradeButton(
                text: "Upgrade from 20\$".tr,
                image: AppImages.premiumStar,
                color: AppColors.lightBlue,
                onTap: (){
                  onTap();
                },
              ),
            ],
          ),
        ),
        Positioned(top: 0,right: 0,child: SvgPicture.asset(AppSvgs.premiumPusherStarSvg))
      ],
    );
  }
}
