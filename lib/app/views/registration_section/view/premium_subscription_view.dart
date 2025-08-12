import 'package:base_project/app/routes/app_routes.dart';
import 'package:base_project/core/Constants/app_colors.dart';
import 'package:base_project/core/constants/app_fonts_and_styles.dart';
import 'package:base_project/core/constants/app_svgs.dart';
import 'package:base_project/core/utils/utils.dart';
import 'package:base_project/core/widgets/custom_app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_images.dart';

class PremiumSubscriptionView extends StatefulWidget {
  @override
  _PremiumSubscriptionViewState createState() => _PremiumSubscriptionViewState();
}

class _PremiumSubscriptionViewState extends State<PremiumSubscriptionView> {
  String selectedPlan = 'Premium'.tr; // Default selection

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 1.sh,
        width: 1.sw,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.premiumBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20.sp),
                child: Column(
                  children: [
                    SvgPicture.asset(AppSvgs.logo,height: 30.h,),
                    20.verticalSpace,
                    Text(
                      'Say Hello To Your Best Self.'.tr,
                      style: AppStyles.poppins20w600white,
                    ),
                    8.verticalSpace,
                    Text(
                      'Get The Complete Progress For Yourself With'.tr,
                      textAlign: TextAlign.center,
                      style: AppStyles.poppins12w700white
                    ),
                    Text(
                      'Premium Challenges'.tr,
                      textAlign: TextAlign.center,
                      style: AppStyles.poppins12w700white
                    ),
                  ],
                ),
              ),
              20.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    // Premium Plan
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedPlan = 'Premium'.tr;
                          print(selectedPlan);
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        height: 200.h,
                        padding: EdgeInsets.symmetric(horizontal: 20.w,),
                        margin: EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: selectedPlan == 'Premium'.tr? AppColors.whiteColor.withOpacity(0.30):AppColors.yellow.withOpacity(0),
                          image: DecorationImage(image: AssetImage(AppImages.premiumPackageBackground)),
                            borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: selectedPlan == 'Premium'.tr
                              ? AppColors.whiteColor.withOpacity(0.30)
                              : Colors.white.withOpacity(0),
                          width: selectedPlan == 'Premium'.tr ? 2 : 2,
                        ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            50.verticalSpace,
                            Text(
                              'Premium'.tr,
                              style: AppStyles.poppins16w700white
                            ),
                            buildFeatureItem(
                              'Unlock Extra Challenges For 30 Days'.tr,
                            ),
                            buildFeatureItem(
                              'Unlock Access For Pusher Courses'.tr,
                            ),
                            Spacer(),
                            buildUpgradeButton(AppImages.premiumStar, 'Upgrade 20\$'.tr,AppColors.lightBlue),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedPlan = 'Pusher VIP'.tr;
                          print(selectedPlan);
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        height: 210.h,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 20.w,),
                        margin: EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage(AppImages.pusherVipBackground),fit: BoxFit.fill),
                          color: selectedPlan=='Pusher VIP'.tr?AppColors.whiteColor.withOpacity(0.30):AppColors.whiteColor.withOpacity(0),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                             color: selectedPlan == 'Pusher VIP'.tr
                                 ? AppColors.whiteColor.withOpacity(0.30)
                                : AppColors.whiteColor.withOpacity(0),
                            width: selectedPlan == 'Pusher VIP'.tr ? 2 : 2,
                          ),
                        ),
                        child: Column(
                          children: [
                            40.verticalSpace,
                            Text(
                              'Pusher VIP'.tr,
                              style: AppStyles.poppins14w700white
                            ),
                            buildFeatureItem(
                              'Unlock Extra Challenges For 20 Days'.tr,
                              isWhite: true,
                            ),
                            buildFeatureItem(
                              'Unlock Access For Pusher Courses'.tr,
                              isWhite: true,
                            ),
                            buildFeatureItem(
                              'Unlock Mentor Challenge'.tr,
                              isWhite: true,
                            ),
                            Spacer(),
                            buildUpgradeButton(AppImages.premiumStar2, 'Upgrade 50\$'.tr,AppColors.yellow),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.all(20),
                child: CustomAppButton(
                  onTap: (){
                    handleContinue();
                  },
                  text: 'Continue With 7-Day Challenge Trial'.tr,
                  textStyle: AppStyles.poppins14w700white,
                  paddingInsideHorizontal: 10,
                  image: AppImages.premiumStar,
                  isImage: true,
                  isIcon: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFeatureItem(String text, {bool isWhite = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AppImages.lockSvg),
        12.horizontalSpace,
        Text(
          text,
          style: AppStyles.poppins12w700white
        ),
      ],
    );
  }
  Widget buildUpgradeButton(String image,String text,Color color){
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(image,height: 30.h,),
          Text(
              text,
              style: AppStyles.poppins14w700darkGrey2
          ),
        ],
      ),
    );
  }

  void handleContinue() {
    print('Selected Plan: $selectedPlan');
    Utils.toastMessage('Starting 7-Day Challenge Trial with $selectedPlan plan');
    Get.toNamed(AppRoutes.wellDoneView);
  }
}