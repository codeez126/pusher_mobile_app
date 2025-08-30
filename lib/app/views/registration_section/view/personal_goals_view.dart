import 'package:base_project/app/routes/app_routes.dart';
import 'package:base_project/app/views/registration_section/controller/improvement_controller.dart';
import 'package:base_project/app/views/registration_section/model/improvement_response_model.dart';
import 'package:base_project/core/utils/utils.dart';
import 'package:base_project/core/widgets/custom_app_button.dart';
import 'package:base_project/core/widgets/custom_registration_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/Constants/app_colors.dart';
import '../../../../core/constants/app_fonts_and_styles.dart';
import '../../../../core/constants/app_images.dart';

class PersonalGoalsView extends StatefulWidget {
  const PersonalGoalsView({super.key});

  @override
  _PersonalGoalsViewState createState() => _PersonalGoalsViewState();
}

class _PersonalGoalsViewState extends State<PersonalGoalsView> {
  final ImprovementController controller = Get.find<ImprovementController>();

  Map<int, List<int>> selectedAnswers = {};
  Set<int> expandedCategories = {};
  List<int> selectedCategoryIds = [];
  List<Data> selectedCategories = [];

  @override
  void initState() {
    super.initState();

    final arguments = Get.arguments as Map<String, dynamic>?;
    if (arguments != null) {
      selectedCategoryIds = List<int>.from(arguments['selectedCategoryIds'] ?? []);
    }
    selectedCategories = controller.getSelectedCategories(selectedCategoryIds);
    expandedCategories.addAll(selectedCategoryIds);
    for (var category in selectedCategories) {
      if (category.questions != null) {
        for (var question in category.questions!) {
          selectedAnswers[question.id!] = [];
        }
      }
    }
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
                isPersonalGoals: true,
              ),
              10.verticalSpace,
              if (selectedCategories.isEmpty)
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: Colors.white,
                          size: 48,
                        ),
                        16.verticalSpace,
                        Text(
                          'No improvement categories selected',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        16.verticalSpace,
                        CustomAppButton(
                          onTap: () => Get.back(),
                          text: 'Go Back'.tr,
                          textStyle: AppStyles.poppins16w600white,
                        ),
                      ],
                    ),
                  ),
                )
              else
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    children: selectedCategories.map((category) {
                      return buildCategorySection(category);
                    }).toList(),
                  ),
                ),

              10.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: CustomAppButton(
                  onTap: handleNext,
                  text: "Next".tr,
                  textStyle: AppStyles.poppins16w700white,
                ),
              ),
              10.verticalSpace
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCategorySection(Data category) {
    final isExpanded = expandedCategories.contains(category.id);
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.white,
            width: 1,
          ),
        ),
        child: Column(
          children: [
            // Category Header
            GestureDetector(
              onTap: () {
                setState(() {
                  if (isExpanded) {
                    expandedCategories.remove(category.id);
                  } else {
                    expandedCategories.add(category.id!);
                  }
                });
              },
              child: Container(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    //TODO for Emoji to be shown or you want the improvement image
                    // if (category.image != null && category.image!.isNotEmpty)
                    //   Container(
                    //     width: 40,
                    //     height: 40,
                    //     alignment: Alignment.center,
                    //     margin: EdgeInsets.only(right: 12),
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(20),
                    //     ),
                    //     child: Image.network(
                    //       category.image!,
                    //       fit: BoxFit.contain,
                    //       errorBuilder: (context, error, stackTrace) {
                    //         return Container(
                    //           decoration: BoxDecoration(
                    //             color: Colors.white.withOpacity(0.2),
                    //             borderRadius: BorderRadius.circular(20),
                    //           ),
                    //           child: Icon(
                    //             Icons.fitness_center,
                    //             color: Colors.white,
                    //             size: 20,
                    //           ),
                    //         );
                    //       },
                    //     ),
                    //   ),

                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(10),
                          // border: Border.all(
                          //   color: Colors.white.withOpacity(0.2),
                          //   width: 1,
                          // ),
                        ),
                        child: Text(
                          'What\'s Your ${category.title ?? 'Goal'} Goals?',
                          style: AppStyles.poppins14w700white,
                        ),
                      ),
                    ),
                    //TODO for drop down
                    // Icon(
                    //   isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                    //   color: Colors.white,
                    // ),
                  ],
                ),
              ),
            ),
            if (isExpanded)
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: Column(
                  children: category.questions?.map((question) {
                    return buildQuestionSection(question);
                  }).toList() ?? [
                    Container(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'No questions available for this category',
                        style: AppStyles.poppins14w500white,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
          ],
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
          if (question.question != null && question.question!.isNotEmpty)
            Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: Text(
                question.question!,
                style: AppStyles.poppins14w700white,
              ),
            ),
          Column(
            children: question.options?.map((option) {
              return buildOptionItem(question.id!, option);
            }).toList() ?? [],
          ),
        ],
      ),
    );
  }

  Widget buildOptionItem(int questionId, Options option) {
    final isSelected = selectedAnswers[questionId]?.contains(option.id) ?? false;
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: GestureDetector(
        onTap: () {
          setState(() {
            final currentSelections = selectedAnswers[questionId] ?? [];
            if (isSelected) {
              currentSelections.remove(option.id);
            } else {
              currentSelections.add(option.id!);
              //TODO for limiting the selection
              // if (currentSelections.length < 3) {
              //   currentSelections.add(option.id!);
              // } else {
              //   Utils.toastMessage('You can select up to 3 options per question');
              //   return;
              // }
            }
            selectedAnswers[questionId] = currentSelections;
          });
        },
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: isSelected ? Colors.white : Colors.transparent,
                border: Border.all(
                  color: Colors.white,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              child: isSelected
                  ? Icon(
                Icons.check,
                color: Color(0xFF4682B4),
                size: 14,
              )
                  : null,
            ),
            12.horizontalSpace,
            Expanded(
              child: Text(
                option.optionText ?? 'Unknown Option',
                style: AppStyles.poppins12w700white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void handleNext() {
    final hasSelections = selectedAnswers.values.any((answers) => answers.isNotEmpty);

    if (!hasSelections) {
      Utils.toastMessage('Please select at least one goal'.tr);
      return;
    }

    Map<String, dynamic> userResponses = {
      'improvement_category_ids': selectedCategoryIds,
      'question_answers': [],
    };

    selectedAnswers.forEach((questionId, optionIds) {
      if (optionIds.isNotEmpty) {
        userResponses['question_answers'].add({
          'question_id': questionId,
          'selected_option_ids': optionIds,
        });
      }
    });

    int totalSelections = selectedAnswers.values
        .map((list) => list.length)
        .fold(0, (prev, curr) => prev + curr);

    print('User Responses: $userResponses');

    Utils.toastMessage('Selected $totalSelections goals'.tr);

    Get.toNamed(
      AppRoutes.wellDoneView,
      arguments: {
        'userResponses': userResponses,
        'selectedCategories': selectedCategories.map((cat) => cat.title).toList(),
        'totalSelections': totalSelections,
      },
    );
  }
}