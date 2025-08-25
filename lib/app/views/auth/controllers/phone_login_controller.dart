import 'package:base_project/app/routes/app_routes.dart';
import 'package:base_project/app/views/auth/model/register_phone_number_model.dart';
import 'package:base_project/app/views/auth/model/send_otp_response_model.dart';
import 'package:base_project/core/constants/api_urls.dart';
import 'package:base_project/core/network/networking_managar.dart';
import 'package:base_project/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get_storage/get_storage.dart';

import '../model/verify_otp_response_model.dart';

class PhoneLoginController extends GetxController {
  final phoneController = TextEditingController().obs;
  final otpTextController = TextEditingController().obs;
  final List<Map<String, String>> countryList = [
    {'code': '+93', 'flag': '🇦🇫', 'name': 'Afghanistan'},
    {'code': '+92', 'flag': '🇵🇰', 'name': 'Pakistan'},
    {'code': '+355', 'flag': '🇦🇱', 'name': 'Albania'},
    {'code': '+213', 'flag': '🇩🇿', 'name': 'Algeria'},
    {'code': '+376', 'flag': '🇦🇩', 'name': 'Andorra'},
    {'code': '+244', 'flag': '🇦🇴', 'name': 'Angola'},
    {'code': '+54', 'flag': '🇦🇷', 'name': 'Argentina'},
    {'code': '+374', 'flag': '🇦🇲', 'name': 'Armenia'},
    {'code': '+61', 'flag': '🇦🇺', 'name': 'Australia'},
    {'code': '+43', 'flag': '🇦🇹', 'name': 'Austria'},
    {'code': '+994', 'flag': '🇦🇿', 'name': 'Azerbaijan'},
    {'code': '+973', 'flag': '🇧🇭', 'name': 'Bahrain'},
    {'code': '+880', 'flag': '🇧🇩', 'name': 'Bangladesh'},
    {'code': '+32', 'flag': '🇧🇪', 'name': 'Belgium'},
    {'code': '+975', 'flag': '🇧🇹', 'name': 'Bhutan'},
    {'code': '+591', 'flag': '🇧🇴', 'name': 'Bolivia'},
    {'code': '+387', 'flag': '🇧🇦', 'name': 'Bosnia & Herzegovina'},
    {'code': '+55', 'flag': '🇧🇷', 'name': 'Brazil'},
    {'code': '+359', 'flag': '🇧🇬', 'name': 'Bulgaria'},
    {'code': '+855', 'flag': '🇰🇭', 'name': 'Cambodia'},
    {'code': '+237', 'flag': '🇨🇲', 'name': 'Cameroon'},
    {'code': '+1', 'flag': '🇨🇦', 'name': 'Canada'},
    {'code': '+56', 'flag': '🇨🇱', 'name': 'Chile'},
    {'code': '+86', 'flag': '🇨🇳', 'name': 'China'},
    {'code': '+57', 'flag': '🇨🇴', 'name': 'Colombia'},
    {'code': '+506', 'flag': '🇨🇷', 'name': 'Costa Rica'},
    {'code': '+385', 'flag': '🇭🇷', 'name': 'Croatia'},
    {'code': '+53', 'flag': '🇨🇺', 'name': 'Cuba'},
    {'code': '+357', 'flag': '🇨🇾', 'name': 'Cyprus'},
    {'code': '+420', 'flag': '🇨🇿', 'name': 'Czech Republic'},
    {'code': '+45', 'flag': '🇩🇰', 'name': 'Denmark'},
    {'code': '+20', 'flag': '🇪🇬', 'name': 'Egypt'},
    {'code': '+503', 'flag': '🇸🇻', 'name': 'El Salvador'},
    {'code': '+372', 'flag': '🇪🇪', 'name': 'Estonia'},
    {'code': '+251', 'flag': '🇪🇹', 'name': 'Ethiopia'},
    {'code': '+358', 'flag': '🇫🇮', 'name': 'Finland'},
    {'code': '+33', 'flag': '🇫🇷', 'name': 'France'},
    {'code': '+49', 'flag': '🇩🇪', 'name': 'Germany'},
    {'code': '+30', 'flag': '🇬🇷', 'name': 'Greece'},
    {'code': '+852', 'flag': '🇭🇰', 'name': 'Hong Kong'},
    {'code': '+36', 'flag': '🇭🇺', 'name': 'Hungary'},
    {'code': '+354', 'flag': '🇮🇸', 'name': 'Iceland'},
    {'code': '+91', 'flag': '🇮🇳', 'name': 'India'},
    {'code': '+62', 'flag': '🇮🇩', 'name': 'Indonesia'},
    {'code': '+98', 'flag': '🇮🇷', 'name': 'Iran'},
    {'code': '+964', 'flag': '🇮🇶', 'name': 'Iraq'},
    {'code': '+353', 'flag': '🇮🇪', 'name': 'Ireland'},
    {'code': '+972', 'flag': '🇮🇱', 'name': 'Israel'},
    {'code': '+39', 'flag': '🇮🇹', 'name': 'Italy'},
    {'code': '+81', 'flag': '🇯🇵', 'name': 'Japan'},
  ];
  final NetworkManager networkManager = NetworkManager();
  final RxString selectedCode = '+92'.obs;
  var registerModel = RegisterPhoneNumberResponseModel().obs;
  var sendOtpModel = SendOtpResponseModel().obs;
  var verifyOtpModel = VerifyOtpReponseModel().obs;
  final isClickedCountryCode = false.obs;
  final RxBool loading = false.obs;

  void register() async {
    final code = selectedCode.value.replaceAll("+", "");
    final phone = phoneController.value.text.trim();
    final phoneWithCode = "$code$phone";
    print('Full Phone: $phoneWithCode');

    // if (phoneWithCode.replaceAll(RegExp(r'\D'), '').length < 8) {
    //   Utils.toastMessage("Invalid phone number");
    //   return;
    // }

    if (phone.isEmpty) {
      Utils.toastMessage('Enter Phone Number');
      return;
    }

    Utils.showLoader();

    Map<String, dynamic> data = {
      "auth_type": "phone",
      "phone": phoneWithCode,
      "first_name": "Ali",
      "last_name": "Jan",
      "dob": "2003-08-20",
      "gender": 1,
    };

    dio.Response? response = await networkManager.callApi(
      urlEndPoint: ApiEndpoints.apiRegisterEndPoint,
      method: HttpMethod.post,
      body: data,
    );
    loading.value = false;
    if (response != null) {
      final model = RegisterPhoneNumberResponseModel.fromJson(response.data);
      registerModel.value = model;
      try {
        if (model.status == true) {
          print("Register Successful Message: ${model.message}");
          //Utils.toastMessage("Register Successfully");
          phoneController.value.clear();
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
  void verifyOtp(String phone) async {
    // final code = selectedCode.value.replaceAll("+", "");
    // final phone = phoneController.value.text.trim();
    // final phoneWithCode = "$code$phone";

    Map<String, dynamic> data = {
      "phone": phone,
      "otp": otpTextController.value.text.trim(),
    };

    try {
      dio.Response? response = await networkManager.callApi(
        urlEndPoint: ApiEndpoints.apiVerifyOtpEndPoint,
        method: HttpMethod.post,
        body: data,
      );

      if (response != null) {
        final model = VerifyOtpReponseModel.fromJson(response.data);
        verifyOtpModel.value=model;
        if (model.status == true) {
          print("Status : ${model.status}");
          print("Message : ${model.message}");
          print("Token : ${model.data?.token}");
          Utils.toastMessage("Otp Verified Successfully");
          final register = model.data?.user?.isRegistered;
          print("Registered Or Not : $register");
          if(register==0){
            Get.toNamed(AppRoutes.profileRegistrationView);
          }else {
            Get.toNamed(AppRoutes.bottomNavNavigation);
          }

        } else {
          print("Otp Verification Failed: ${model.message}");
          Utils.toastMessage(model.message ?? "Otp verification failed");
        }
      } else {
        print("No response from server");
        Utils.toastMessage("Unable to verify OTP, please try again");
      }
    } catch (e) {
      print("Error verifying OTP: $e");
      Utils.toastMessage("Error verifying OTP: $e");
    }
  }

  void sendOtp() async {
    Map<String, dynamic> data = {"phone": phoneController.value.text};

    dio.Response? response = await networkManager.callApi(
      urlEndPoint: ApiEndpoints.apiSendOtpEndPoint,
      method: HttpMethod.post,
      body: data,
    );

    if (response != null) {
      try {
        final model = SendOtpResponseModel.fromJson(response.data);
        sendOtpModel.value = model;
        if (model.status == true) {
          print("Otp Sent Successfully");
          Utils.toastMessage("Otp Sent Successfully: ${model.message}");
          Get.toNamed(AppRoutes.otpVerificationView,arguments: {
            'phoneNumber': phoneController.value.text,
          });
        } else {
          Utils.toastMessage(model.message ?? "Failed to send OTP");
        }
      } catch (e) {
        print("Error parsing OTP response: $e");
        Utils.toastMessage("Error parsing OTP response");
      }
    } else {
      Utils.toastMessage("No response while sending OTP");
    }
  }



}
