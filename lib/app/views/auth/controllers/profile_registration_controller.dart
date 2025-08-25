import 'package:base_project/app/views/auth/model/update_profile_response_model.dart';
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
  String selectedGender = 'Male';
  String selectedDay = '00';
  String selectedMonth = '00';
  String selectedYear = '2024';
  bool agreeToTerms = false;
  String check = 'Other';


  Future<void> updateProfile() async {
    if (firstNameController.value.text.isEmpty) {
      Utils.toastMessage('Enter Your First Name');
      return;
    }
    if (lastNameController.value.text.isEmpty) {
      Utils.toastMessage('Enter Your Last Name');
      return;
    }
    Map data = {
      "first_name": firstNameController.value.text,
      "last_name": lastNameController.value.text,
      "dob": "$selectedYear-$selectedMonth-$selectedDay",
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
      //registerModel.value = model;
      try {
        if (model.status == true) {
          print("Register Successful Message: ${model.message}");
          //Utils.toastMessage("Register Successfully");
         // phoneController.value.clear();
          //sendOtp();
        } else {
          print("Register Failed: ${model.message}");
          Utils.toastMessage(model.message ?? "Registration failed");
        }
      } catch (stackTrace,error) {
        print("Error : $stackTrace");
        print("Error : $error");
        print("Error : ${model.errors}");
//        Utils.toastMessage("${model.errors}");
      }
    } else {
      print("Unsuccessful Register: No response");
      Utils.toastMessage("Unable to register, please check your connection.");
    }


  }


}
