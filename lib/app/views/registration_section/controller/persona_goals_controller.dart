import 'package:base_project/app/routes/app_routes.dart';
import 'package:base_project/app/views/registration_section/model/improvement_response_model.dart';
import 'package:base_project/core/Managers/PrefManager.dart';
import 'package:base_project/core/constants/api_urls.dart';
import 'package:base_project/core/network/networking_managar.dart';
import 'package:base_project/core/utils/utils.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class PersonalGoalsController extends GetxController {
  final NetworkManager networkManager = NetworkManager();

  RxMap<int, List<int>> selectedAnswers = <int, List<int>>{}.obs;
  RxList<Data> selectedCategories = <Data>[].obs;
  RxSet<int> expandedCategories = <int>{}.obs;

  void initCategories(List<Data> categories, List<int> selectedCategoryIds) {
    selectedCategories.assignAll(categories);
    expandedCategories.addAll(selectedCategoryIds);

    for (var category in selectedCategories) {
      if (category.questions != null) {
        for (var q in category.questions!) {
          selectedAnswers[q.id!] = [];
        }
      }
    }
  }

  void toggleAnswer(int questionId, int optionId) {
    final current = selectedAnswers[questionId] ?? [];

    if (current.contains(optionId)) {
      current.remove(optionId);
    } else {
      current.add(optionId);
    }

    selectedAnswers[questionId] = List<int>.from(current);
  }

  bool isSelected(int questionId, int optionId) {
    return selectedAnswers[questionId]?.contains(optionId) ?? false;
  }

  Future<void> submitGoals() async {
    final hasSelections = selectedAnswers.values.any(
      (answers) => answers.isNotEmpty,
    );

    if (!hasSelections) {
      Utils.toastMessage('Please select at least one goal'.tr);
      return;
    }

    List<Map<String, dynamic>> programs = [];

    for (var category in selectedCategories) {
      List<int> categoryOptionIds = [];

      if (category.questions != null) {
        for (var optionsIds in category.questions!) {
          categoryOptionIds.addAll(selectedAnswers[optionsIds.id] ?? []);
        }
      }

      if (categoryOptionIds.isNotEmpty) {
        programs.add({
          'program_id': category.id,
          'option_ids': categoryOptionIds,
        });
      }
    }

    final requestBody = {"programs": programs};
    if (kDebugMode) {
      print('API Body: $requestBody');
    }

    try {
      dio.Response? response = await networkManager.callApi(
        urlEndPoint: ApiEndpoints.apiStoreUserImprovementsProgramsEndPoint,
        method: HttpMethod.post,
        body: requestBody,
      );

      if (response != null && response.statusCode == 200) {
        print('API Success: ${response.data}');
        Utils.toastMessage('Goals saved successfully!'.tr);

        PrefManager.setIsLogin(true);

        int totalSelections = selectedAnswers.values
            .map((list) => list.length)
            .fold(0, (prev, curr) => prev + curr);

        Utils.toastMessage('Selected $totalSelections goals'.tr);
        Get.offAllNamed(AppRoutes.wellDoneView);
      } else {
        Utils.toastMessage('Something went wrong. Please try again.'.tr);
      }
    } catch (e) {
      print('API Error: $e');
      Utils.toastMessage('Failed to save goals'.tr);
    }
  }
}
