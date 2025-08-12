import 'dart:ui';

import 'package:base_project/app/routes/app_routes.dart';
import 'package:base_project/app/views/registration_section/model/improvement_model.dart';
import 'package:base_project/core/utils/utils.dart';
import 'package:base_project/core/widgets/custom_app_button.dart';
import 'package:base_project/core/widgets/custom_registration_app_bar.dart';
import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/Constants/app_colors.dart';
import '../../../../core/constants/app_fonts_and_styles.dart';
import '../../../../core/constants/app_images.dart';

class ImprovementView extends StatefulWidget {
  @override
  _ImprovementViewState createState() => _ImprovementViewState();
}

class _ImprovementViewState extends State<ImprovementView> {
  Set<String> selectedCategories = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 1.sh,
        width: 1.sw,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.splashBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              CustomRegistrationAppBar(
                isTitle: true,
                title: '',
                subtitle: '',
                isImprovement: true,
              ),
              /// =======================================Categories Grid========================================
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 15,
                      childAspectRatio: 1.2,
                    ),
                    itemCount: ImprovementModel.categories.length,
                    itemBuilder: (context, index) {
                      final category = ImprovementModel.categories[index];
                      final isSelected = selectedCategories.contains(
                        category.title,
                      );
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (isSelected) {
                              selectedCategories.remove(category.title);
                            } else {
                              selectedCategories.add(category.title);
                            }
                            print(selectedCategories);
                            handleNext();
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(category.image),
                              fit: BoxFit.fill,
                              filterQuality: FilterQuality.low,
                            ),
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                              color: AppColors.whiteColor,
                              width: 0.5.w,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 8,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SvgPicture.asset(AppImages.plusSvg),
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Blur(
                                      blurColor: AppColors.whiteColor,
                                      borderRadius: BorderRadius.circular(32.r),
                                      blur: 10.sp,
                                      child: Container(
                                        width: 140.w,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10.w,
                                          vertical: 20.h,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      category.title,
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                  ],
                                ),
                                15.verticalSpace,
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: CustomAppButton(
                  onTap: () {
                    Get.toNamed(AppRoutes.personalGoalsView);
                  },
                  text: 'Next'.tr,
                  textStyle: AppStyles.poppins16w600white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void handleNext() {
    if (selectedCategories.isEmpty) {
      Utils.toastMessage('Please select at least one category to improve'.tr);
      return;
    }

    // Handle navigation to next screen
    print('${'Selected categories'.tr} : ${selectedCategories.toList()}');

    Utils.toastMessage('${'Selected'.tr} : ${selectedCategories.join(', ')}');
  }
}
