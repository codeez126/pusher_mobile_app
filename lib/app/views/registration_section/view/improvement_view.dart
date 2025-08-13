import 'dart:async';
import 'dart:ui';

import 'package:base_project/app/routes/app_routes.dart';
import 'package:base_project/app/views/registration_section/model/improvement_model.dart';
import 'package:base_project/core/constants/app_svgs.dart';
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
  Set<String> showIconFor = {}; // Tracks categories where icon should show

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

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
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
                      final isSelected = selectedCategories.contains(category.title);
                      final showIcon = showIconFor.contains(category.title);

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (isSelected) {
                              selectedCategories.remove(category.title);
                              showIconFor.remove(category.title);
                            } else {
                              selectedCategories.add(category.title);
                            }
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(category.image),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(color: AppColors.whiteColor, width: 0.5.w),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 8,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.only(bottom: 10.sp),
                                child: AnimatedAlign(
                                  duration: Duration(milliseconds: 600),
                                  curve: Curves.easeInOut,
                                  alignment: isSelected ? Alignment.center : Alignment.bottomCenter,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.sp),
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
                                      child: AnimatedContainer(
                                        duration: Duration(milliseconds: 800),
                                        curve: Curves.easeInOut,
                                        alignment: Alignment.center,
                                        width: 140.w,
                                        height: isSelected
                                            ? MediaQuery.of(context).size.height - 640
                                            : 60.h,
                                        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.2),
                                          borderRadius: BorderRadius.circular(20.sp),
                                        ),
                                        child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                            category.title,
                                            style: TextStyle(
                                              fontSize: 18.sp,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              shadows: [
                                                Shadow(offset: Offset(0, 1), blurRadius: 2, color: Colors.black26),
                                              ],
                                            ),
                                          ),
                                        ),
                                        onEnd: () {
                                          if (isSelected && !showIcon) {
                                            Future.delayed(Duration(milliseconds: 100), () {
                                              setState(() {
                                                showIconFor.add(category.title);
                                              });
                                            });
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              AnimatedPositioned(
                                duration: Duration(milliseconds: 600),
                                curve: Curves.easeInOut,
                                top: isSelected ? 15 : 10,
                                right: isSelected ? 10 : 52,
                                child: AnimatedRotation(
                                  alignment: Alignment.center,
                                  turns: isSelected ? 0.12 : 1,
                                  duration: Duration(milliseconds: 700),
                                  curve: Curves.easeInOut,
                                  child: SvgPicture.asset(
                                    AppSvgs.plusSvg,
                                  ),
                                ),
                              )

                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              /// Next Button
              Padding(
                padding: EdgeInsets.all(20),
                child: CustomAppButton(
                  onTap: handleNext,
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
    Utils.toastMessage('${'Selected'.tr} : ${selectedCategories.join(', ')}');
    Get.toNamed(AppRoutes.personalGoalsView);
  }
}
