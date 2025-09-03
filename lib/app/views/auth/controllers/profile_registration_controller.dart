import 'dart:io';

import 'package:base_project/app/routes/app_routes.dart';
import 'package:base_project/app/views/auth/model/update_profile_response_model.dart';
import 'package:base_project/app/views/profile_section/controller/profile_view_controller.dart';
import 'package:base_project/core/Managers/PrefManager.dart';
import 'package:base_project/core/network/networking_managar.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/api_urls.dart';
import '../../../../core/utils/utils.dart';
import '../model/user_model.dart';


class ProfileRegistrationController extends GetxController {

  final firstNameController = TextEditingController().obs;
  final lastNameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final NetworkManager networkManager = NetworkManager();
  var  profileModel = UpdateProfileResponseModel().obs;
  final ProfileViewController profileViewController =Get.put(ProfileViewController());


  int selectedGender = 1;
  String gender = 'Male';
  bool agreeToTerms = false;
  String check = 'Other';
  var selectedDay = '01'.obs;
  var selectedMonth = '01'.obs;
  var selectedYear = DateTime.now().year.toString().obs;
  Rx<File?> photoUrl = Rx<File?>(null);
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
      Utils.toastMessage('Enter Your First Name'.tr);
      return;
    }
    if (lastNameController.value.text.isEmpty) {
      Utils.toastMessage('Enter Your Last Name'.tr);
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
      final responseData = response.data['data']['user'];
      profileModel.value = model;
      try {
        if (model.status == true && model.data != null) {
          final updatedUser = UserModel.fromJson(responseData);

          await PrefManager.saveUser(updatedUser);

          Utils.toastMessage(model.message ?? "Profile updated".tr);
          Get.toNamed(AppRoutes.improvementView);
        } else {
          Utils.toastMessage(model.message ?? "Update failed".tr);
        }
      } catch (e, stack) {
        print("Update Profile Error: $e");
        print(stack);
      }
    } else {
      print("Unsuccessful Update: No response");
      Utils.toastMessage("Unable to Update, please check your connection.".tr);
    }
  }
  Future<void> updateProfileEditView({
    required String firstName,
    required String lastName,
    required int gender,
  }) async {

    if (firstName.isEmpty) {
      Utils.toastMessage('Enter Your First Name'.tr);
      return;
    }
    if (lastName.isEmpty) {
      Utils.toastMessage('Enter Your Last Name'.tr);
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
      final responseData = response.data['data']['user'];
      try {
        if (model.status == true && model.data != null) {
          PrefManager.setIsLogin(true);

          final updatedUser = UserModel.fromJson(responseData);

          await profileViewController.updateUser(updatedUser);
          //await PrefManager.saveUser(updatedUser);

          Utils.toastMessage(model.message ?? "Profile updated".tr);
        } else {
          Utils.toastMessage(model.message ?? "Update failed".tr);
        }
      } catch (e) {
        print("Error updating profile: $e");
      }
    } else {
      Utils.toastMessage("Unable to Update, please check your connection.".tr);
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
