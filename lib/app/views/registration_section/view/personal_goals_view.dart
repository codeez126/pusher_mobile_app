import 'package:base_project/app/routes/app_routes.dart';
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
  @override
  _PersonalGoalsViewState createState() => _PersonalGoalsViewState();
}

class _PersonalGoalsViewState extends State<PersonalGoalsView> {
  Set<String> selectedGoals = {};
  Set<String> categories = {};

  final Map<String, Map<String, dynamic>> goalCategories = {
    'fitness'.tr: {
      'title'.tr: 'What\'s Your Fitness Goals ?'.tr,
      'icon'.tr: '💪',
      'goals'.tr: [
        'Improve fitness'.tr,
        'Start a new sport'.tr,
        'Build muscle mass'.tr,
        'Lose weight'.tr,
      ],
    },
    'motivation'.tr: {
      'title'.tr: 'What\'s Your Motivation Goals ?'.tr,
      'icon'.tr: '🔥',
      'goals'.tr: [
        'Find sense of inspiration'.tr,
        'Avoid procrastination'.tr,
        'Improve planning and organization'.tr,
        'Set realistic goals'.tr,
      ],
    },

    'relationship'.tr: {
      'title'.tr: 'What\'s Your Relationship Goals ?'.tr,
      'icon'.tr: '💕',
      'goals'.tr: [
        'Improve communication'.tr,
        'Spend more quality time together'.tr,
        'Resolve issues and strengthen the bond'.tr,
        'Learn and grow as a couple'.tr,
      ],
    },

  };

  @override
  void initState() {
    super.initState();
    categories.addAll(goalCategories.keys);
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
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  children: goalCategories.entries.map((entry) {
                    return buildGoalCategory(entry.key, entry.value);
                  }).toList(),
                ),
              ),
              10.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: CustomAppButton(
                  onTap: () {
                    handleNext();
                  },
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
  Widget buildGoalCategory(String categoryKey, Map<String, dynamic> categoryData) {
    final isExpanded = categories.contains(categoryKey);
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.white.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isExpanded
                      ? categories.remove(categoryKey)
                      : categories.add(categoryKey);
                });
              },
              child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 5.w),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.2),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(categoryData['icon'.tr],),
                            5.horizontalSpace,
                            Text(
                              categoryData['title'.tr],
                              style: AppStyles.poppins14w700white
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 16,
                ),
                child: Column(
                  children: List.generate(
                    categoryData['goals'.tr].length,
                        (index) {
                      final goal = categoryData['goals'.tr][index];
                      final isSelected = selectedGoals.contains(goal);

                      return Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              final categoryGoals = categoryData['goals'.tr] as List<String>;
                              final selectedInCategory = selectedGoals
                                  .where((g) => categoryGoals.contains(g))
                                  .length;

                              if (isSelected) {
                                selectedGoals.remove(goal);
                              } else if (selectedInCategory < 3) {
                                selectedGoals.add(goal);
                              } else {
                                Utils.toastMessage('You can select up to 3 goals per category');
                              }
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
                                    width: 2,
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
                              SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  goal,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: isSelected
                                        ? FontWeight.w500
                                        : FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void handleNext() {
    if (selectedGoals.isEmpty) {
      print('$selectedGoals');
      Utils.toastMessage('Please select at least one goal'.tr);
      return;
    }

    Map<String, List<String>> goalsByCategory = {};
    goalCategories.forEach((categoryKey, categoryData) {
      final categoryGoals = categoryData['goals'.tr] as List<String>;
      final selectedInCategory = selectedGoals
          .where((selectedGoal) => categoryGoals.contains(selectedGoal))
          .toList();

      if (selectedInCategory.isNotEmpty) {
        goalsByCategory[categoryData['title'.tr]] = selectedInCategory;
      }
    });

    print('Selected Goals by Category:'.tr);
    goalsByCategory.forEach((category, goals) {
      print('$category: ${goals.join(', ')}');
    });

    Utils.toastMessage('${'Selected'.tr}${selectedGoals.length} goals'.tr);
    Get.toNamed(AppRoutes.premiumSubscriptionView);
  }
}
