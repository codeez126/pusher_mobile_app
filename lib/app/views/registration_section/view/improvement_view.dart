import 'dart:async';
import 'dart:ui';

import 'package:base_project/app/routes/app_routes.dart';
import 'package:base_project/app/views/registration_section/controller/improvement_controller.dart';
import 'package:base_project/core/constants/app_svgs.dart';
import 'package:base_project/core/utils/utils.dart';
import 'package:base_project/core/widgets/custom_app_button.dart';
import 'package:base_project/core/widgets/custom_registration_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/Constants/app_colors.dart';
import '../../../../core/constants/app_fonts_and_styles.dart';
import '../../../../core/constants/app_images.dart';

class ImprovementView extends StatefulWidget {
  const ImprovementView({super.key});

  @override
  _ImprovementViewState createState() => _ImprovementViewState();
}

class _ImprovementViewState extends State<ImprovementView> {
  final ImprovementController improvementController = Get.put(ImprovementController());


  @override
  void initState() {
    super.initState();
    improvementController.getImprovements();
  }

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
                child: Obx(() {
                  if (improvementController.improvementModel.value.data == null) {
                    return SizedBox();
                  }
                  final categories = improvementController.improvementModel.value.data ?? [];
                  if (categories.isEmpty) {
                    return Center(
                      child: Text(
                        'No improvement categories available',
                        style: AppStyles.poppins16w600white,
                      ),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 15,
                        childAspectRatio: 1.2,
                      ),
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final category = categories[index];

                        final categoryId = category.id ?? -1; // fallback ID
                        final categoryTitle = category.title ?? 'Unknown Category';
                        final categoryImage = category.image;

                        final isSelected = improvementController.selectedCategoryIds.contains(categoryId);
                        final showIcon = improvementController.showIconFor.contains(categoryId);

                        return Container(
                          decoration: BoxDecoration(
                            image: categoryImage != null
                                ? DecorationImage(
                              image: NetworkImage(categoryImage),
                              fit: BoxFit.cover,
                            )
                                : null, // if no image, just no background
                            color: Colors.black26, // fallback background if no image
                            borderRadius: BorderRadius.circular(35),
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
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                  bottom: isSelected ? 0.sp : 10.sp,
                                ),
                                child: AnimatedAlign(
                                  duration: Duration(milliseconds: 600),
                                  curve: Curves.easeInOut,
                                  alignment: isSelected ? Alignment.center : Alignment.bottomCenter,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.sp),
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                        sigmaY: 10,
                                        sigmaX: 10,
                                      ),
                                      child: AnimatedContainer(
                                        duration: Duration(milliseconds: 800),
                                        curve: Curves.easeInOut,
                                        alignment: Alignment.center,
                                        width: 140.w,
                                        height: isSelected
                                            ? MediaQuery.of(context).size.height - 640
                                            : 50.h,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10.w,
                                          vertical: 10.h,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.2),
                                          borderRadius: BorderRadius.circular(20.sp),
                                        ),
                                        child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                            categoryTitle,
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: true,
                                            style: AppStyles.poppins16w700white,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        onEnd: () {
                                          if (isSelected && !showIcon) {
                                            Future.delayed(
                                              Duration(milliseconds: 100),
                                                  () {
                                                setState(() {
                                                  improvementController.showIconFor.add(categoryId);
                                                });
                                              },
                                            );
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
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (isSelected) {
                                          improvementController.selectedCategoryIds.remove(categoryId);
                                          improvementController.showIconFor.remove(categoryId);
                                        } else {
                                          improvementController.selectedCategoryIds.add(categoryId);
                                        }
                                      });
                                    },
                                    child: SvgPicture.asset(
                                      AppSvgs.plusSvg,
                                      colorFilter: ColorFilter.mode(
                                        isSelected ? AppColors.redColor : AppColors.whiteColor,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                }),
              ),
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
    if (improvementController.selectedCategoryIds.isEmpty) {
      Utils.toastMessage('Please select at least one category to improve'.tr);
      return;
    }
    final selectedCategories =
        improvementController.improvementModel.value.data!
            .where((category) => improvementController.selectedCategoryIds.contains(category.id))
            .map((category) => category.title ?? 'Unknown')
            .toList();
    Utils.toastMessage('${'Selected'.tr} : ${selectedCategories.join(', ')}');
    Get.toNamed(
      AppRoutes.personalGoalsView,
      arguments: {
        'selectedCategoryIds': improvementController.selectedCategoryIds.toList(),
        'selectedCategories': selectedCategories,
      },
    );
  }
}
