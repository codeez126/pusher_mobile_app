import 'package:base_project/app/views/registration_section/model/improvement_response_model.dart';
import 'package:base_project/core/network/networking_managar.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

import '../../../../core/constants/api_urls.dart';
import '../../../../core/utils/utils.dart';

class ImprovementController extends GetxController {
  NetworkManager networkManager = NetworkManager();
  var improvementModel = ImprovementsResponseModel().obs;
  var isLoading = false.obs;
  var hasError = false.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    //TODO load when the controller initialized
    // getImprovements();
  }

  Future<void> getImprovements() async {
    isLoading.value = true;
    hasError.value = false;
    errorMessage.value = '';

    Map data = {
      "first_name": "Furqan",
      "last_name": "Ahmed",
      "dob": "1995-08-25",
      "gender": 1
    };

    try {
      dio.Response? response = await networkManager.callApi(
        urlEndPoint: ApiEndpoints.apiImprovementProgramsEndPoint,
        method: HttpMethod.post,
        body: data,
      );

      if (response != null) {
        final model = ImprovementsResponseModel.fromJson(response.data);
        improvementModel.value = model;

        if (model.status == true) {
          print("Status: ${model.status}");
          print("Message: ${model.message}");
          print("Data count: ${model.data?.length ?? 0}");

          if (model.data != null && model.data!.isNotEmpty) {
            print("Data is Not Empty message: ${model.message}");
            //Utils.toastMessage("${model.message}");
            return;
          } else {
            hasError.value = true;
            errorMessage.value = "No improvement categories found";
          }
        } else {
          hasError.value = true;
          errorMessage.value = model.message ?? "Failed to load data";
          //Utils.toastMessage(errorMessage.value);
        }
      } else {
        hasError.value = true;
        errorMessage.value = "Network error occurred";
        //Utils.toastMessage("Network error occurred");
      }
    } catch (e) {
      hasError.value = true;
      errorMessage.value = "An error occurred: $e";
      print("Error: $e");
      //Utils.toastMessage("Failed to load improvement categories");
    } finally {
      isLoading.value = false;
    }
  }

  List<Data> getSelectedCategories(List<int> selectedIds) {
    if (improvementModel.value.data == null) return [];

    return improvementModel.value.data!
        .where((category) => selectedIds.contains(category.id))
        .toList();
  }

  Future<void> refreshData() async {
    await getImprovements();
  }

  bool hasQuestions(int categoryId) {
    final category = improvementModel.value.data
        ?.firstWhereOrNull((cat) => cat.id == categoryId);
    return category?.questions != null && category!.questions!.isNotEmpty;
  }

  List<Questions>? getQuestionsForCategory(int categoryId) {
    final category = improvementModel.value.data
        ?.firstWhereOrNull((cat) => cat.id == categoryId);
    return category?.questions;
  }

  String? getOptionText(int questionId, int optionId) {
    for (var category in improvementModel.value.data ?? []) {
      if (category.questions != null) {
        for (var question in category.questions!) {
          if (question.id == questionId && question.options != null) {
            final option = question.options!.firstWhereOrNull((opt) => opt.id == optionId);
            return option?.optionText;
          }
        }
      }
    }
    return null;
  }

  String? getQuestionText(int questionId) {
    for (var category in improvementModel.value.data ?? []) {
      if (category.questions != null) {
        for (var question in category.questions!) {
          if (question.id == questionId) {
            return question.question;
          }
        }
      }
    }
    return null;
  }

  Map<String, dynamic> validateAndPrepareResponses(Map<int, List<int>> selectedAnswers, List<int> categoryIds) {
    List<Map<String, dynamic>> questionAnswers = [];

    selectedAnswers.forEach((questionId, optionIds) {
      if (optionIds.isNotEmpty) {
        questionAnswers.add({
          'question_id': questionId,
          'selected_option_ids': optionIds,
        });
      }
    });

    return {
      'improvement_category_ids': categoryIds,
      'question_answers': questionAnswers,
      'timestamp': DateTime.now().toIso8601String(),
    };
  }
}