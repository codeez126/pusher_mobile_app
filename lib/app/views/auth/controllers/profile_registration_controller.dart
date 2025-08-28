import 'package:base_project/app/routes/app_routes.dart';
import 'package:base_project/app/views/auth/model/update_profile_response_model.dart';
import 'package:base_project/core/Managers/PrefManager.dart';
import 'package:base_project/core/network/networking_managar.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/api_urls.dart';
import '../../../../core/utils/utils.dart';


class ProfileRegistrationController extends GetxController {

  final firstNameController = TextEditingController().obs;
  final lastNameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final NetworkManager networkManager = NetworkManager();
  var  profileModel = UpdateProfileResponseModel().obs;
  int selectedGender = 1;
  String gender = 'Male';
  bool agreeToTerms = false;
  String check = 'Other';
  var selectedDay = '01'.obs;
  var selectedMonth = '01'.obs;
  var selectedYear = DateTime.now().year.toString().obs;

  var isDayDropdownOpen = false.obs;
  var isMonthDropdownOpen = false.obs;
  var isYearDropdownOpen = false.obs;


  @override
  void onInit() {
    super.onInit();
    loadDOB();
  }


  Future<void> updateProfile() async {
    if (firstNameController.value.text.isEmpty) {
      Utils.toastMessage('Enter Your First Name');
      return;
    }
    if (lastNameController.value.text.isEmpty) {
      Utils.toastMessage('Enter Your Last Name');
      return;
    }

    String dob =
        "${selectedYear.value}-${selectedMonth.value.padLeft(2, '0')}-${selectedDay.value.padLeft(2, '0')}";

    Map data = {
      "first_name": firstNameController.value.text,
      "last_name": lastNameController.value.text,
      "dob": dob,
      "gender": selectedGender
    };

    Utils.showLoader();

    dio.Response? response = await networkManager.callApi(
      urlEndPoint: ApiEndpoints.apiUpdateProfileEndPoint,
      method: HttpMethod.post,
      body: data,
    );

    if (response != null) {
      final model = UpdateProfileResponseModel.fromJson(response.data);
      profileModel.value = model;
      try {
        if (model.status == true) {
          print("Model Message: ${model.message}");

          PrefManager.save("firstName", model.data!.user!.firstName);
          PrefManager.save("lastName", model.data!.user!.lastName);
          PrefManager.save("dob", model.data!.user!.dob);
          PrefManager.save("gender", model.data!.user!.gender);

          Utils.toastMessage("${model.message}");
          Get.toNamed(AppRoutes.improvementView);
        } else {
          print("Failed: ${model.message}");
          Utils.toastMessage(model.message ?? "Update failed");
        }
      } catch (stackTrace, error) {
        print("Error : $stackTrace");
        print("Error : $error");
        print("Error : ${model.errors}");
      }
    } else {
      print("Unsuccessful Update: No response");
      Utils.toastMessage("Unable to Update, please check your connection.");
    }
  }
  Future<void> updateProfileEditView({
    required String firstName,
    required String lastName,
    required int gender,
  }) async {

    if (firstName.isEmpty) {
      Utils.toastMessage('Enter Your First Name');
      return;
    }
    if (lastName.isEmpty) {
      Utils.toastMessage('Enter Your Last Name');
      return;
    }
    String dob =
        "${selectedYear.value}-${selectedMonth.value.padLeft(2, '0')}-${selectedDay.value.padLeft(2, '0')}";

    Map data = {
      "first_name": firstName,
      "last_name": lastName,
      "dob": dob,
      "gender": gender,
    };

    Utils.showLoader();

    dio.Response? response = await networkManager.callApi(
      urlEndPoint: ApiEndpoints.apiUpdateProfileEndPoint,
      method: HttpMethod.post,
      body: data,
    );

    if (response != null) {
      final model = UpdateProfileResponseModel.fromJson(response.data);
      try {
        if (model.status == true) {
          PrefManager.setIsLogin(true);
          PrefManager.save("firstName", model.data!.user!.firstName);
          PrefManager.save("lastName", model.data!.user!.lastName);
          PrefManager.save("dob", model.data!.user!.dob);
          PrefManager.save("gender", model.data!.user!.gender);

          Utils.toastMessage("${model.message}");
        } else {
          Utils.toastMessage(model.message ?? "Update failed");
        }
      } catch (e) {
        print("Error updating profile: $e");
      }
    } else {
      Utils.toastMessage("Unable to Update, please check your connection.");
    }
  }



  void loadDOB() async {
    final dob = await PrefManager.read("dob");
    if (dob != null && dob.isNotEmpty) {
      final parts = dob.split("-");
      if (parts.length == 3) {
        selectedYear.value = parts[0];
        selectedMonth.value = parts[1];
        selectedDay.value = parts[2];
      }
    }
  }

  void saveDOB() {
    if (selectedYear.value.isNotEmpty &&
        selectedMonth.value.isNotEmpty &&
        selectedDay.value.isNotEmpty) {
      final dob =
          "${selectedYear.value}-${selectedMonth.value.padLeft(2, '0')}-${selectedDay.value.padLeft(2, '0')}";
      PrefManager.save("dob", dob);
      print("DOB Saved: $dob");
    }
  }



}
