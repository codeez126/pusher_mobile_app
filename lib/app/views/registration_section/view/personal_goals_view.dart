import 'package:base_project/app/views/registration_section/controller/improvement_controller.dart';
import 'package:base_project/app/views/registration_section/model/improvement_response_model.dart';
import 'package:base_project/core/widgets/custom_app_button.dart';
import 'package:base_project/core/widgets/custom_registration_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_fonts_and_styles.dart';
import '../../../../core/constants/app_images.dart';
import '../controller/persona_goals_controller.dart';

class PersonalGoalsView extends StatelessWidget {
  final PersonalGoalsController controller =
  Get.put(PersonalGoalsController());

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>?;

    if (args != null) {
      final ImprovementController improvementController =
      Get.find<ImprovementController>();

      final selectedIds = List<int>.from(args['selectedCategoryIds'] ?? []);
      final selectedCategories =
      improvementController.getSelectedCategories(selectedIds);
      controller.initCategories(selectedCategories, selectedIds);
    }

    return Scaffold(
      body: Container(
        width: 1.sw,
        height: 1.sh,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.splashBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              CustomRegistrationAppBar(isPersonalGoals: true),
              10.verticalSpace,
              Expanded(
                child: Obx(() {
                  if (controller.selectedCategories.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.info_outline,
                              color: Colors.white, size: 48),
                          16.verticalSpace,
                          Text(
                            'No improvement categories selected',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                            ),
                          ),
                          16.verticalSpace,
                          CustomAppButton(
                            onTap: () => Get.back(),
                            text: 'Go Back'.tr,
                            textStyle: AppStyles.poppins16w600white,
                          ),
                        ],
                      ),
                    );
                  }

                  return ListView(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    children: controller.selectedCategories
                        .map((c) => buildCategorySection(c))
                        .toList(),
                  );
                }),
              ),
              10.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: CustomAppButton(
                  onTap: controller.submitGoals,
                  text: "Next".tr,
                  textStyle: AppStyles.poppins16w700white,
                ),
              ),
              10.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCategorySection(Data category) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white, width: 1),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.sp),
          child: Column(
            children: category.questions?.map((q) {
              return buildQuestionSection(q);
            }).toList() ??
                [Text('No questions available')],
          ),
        ),
      ),
    );
  }

  Widget buildQuestionSection(Questions question) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (question.question?.isNotEmpty ?? false)
            Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Text(question.question!,
                    style: AppStyles.poppins14w700white),
              ),
            ),
          Column(
            children: question.options?.map((options) {
              return Obx(() {
                final isSelected =
                controller.isSelected(question.id!, options.id!);
                return Padding(
                  padding: EdgeInsets.only(bottom: 5,top: 2),
                  child: GestureDetector(
                    onTap: () => controller.toggleAnswer(question.id!, options.id!),
                    child: Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Colors.white
                                : Colors.transparent,
                            border: Border.all(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: isSelected
                              ? Icon(Icons.check,
                              color: Color(0xFF4682B4), size: 14)
                              : null,
                        ),
                        12.horizontalSpace,
                        Expanded(
                          child: Text(options.optionText ?? 'Unknown Option',
                              style: AppStyles.poppins14w600white),
                        ),
                      ],
                    ),
                  ),
                );
              });
            }).toList() ??
                [],
          ),
        ],
      ),
    );
  }
}
