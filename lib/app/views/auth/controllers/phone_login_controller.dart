
import 'dart:async';

import 'package:base_project/app/routes/app_routes.dart';
import 'package:base_project/app/views/auth/model/google_login_response_model.dart';
import 'package:base_project/app/views/auth/model/user_model.dart';
import 'package:base_project/app/views/auth/model/register_phone_number_model.dart';
import 'package:base_project/app/views/auth/model/send_otp_response_model.dart';
import 'package:base_project/core/Managers/PrefManager.dart';
import 'package:base_project/core/constants/api_urls.dart';
import 'package:base_project/core/network/networking_managar.dart';
import 'package:base_project/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:google_sign_in/google_sign_in.dart';

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
  var googleModel = GoogleLoginResponseModel().obs;
  var sendOtpModel = SendOtpResponseModel().obs;
  var verifyOtpModel = VerifyOtpResponseModel().obs;
  final isClickedCountryCode = false.obs;
  final RxBool loading = false.obs;
  final RxString errorToShow ="".obs;
  final RxBool successCondition =false.obs;
  final RxBool showContainer =false.obs;
  static final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'profile',
    ],
  );


  var isButtonEnabled = true.obs;
  var remainingSeconds = 0.obs;
  Timer? _timer;

  void startCooldown() {
    isButtonEnabled.value = false;
    remainingSeconds.value = 30;

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      remainingSeconds.value--;

      if (remainingSeconds.value <= 0) {
        isButtonEnabled.value = true;
        timer.cancel();
      }
    });
  }

  Future<void> checkUserModel() async {
    final user = await PrefManager.getUser();
    print("User Data: $user");
    print("User FirstName: ${user?.firstName}");
    print("User LastName: ${user?.lastName}");
    print("User isRegister: ${user?.isRegistered}");
    print("User isOnboard: ${user?.isOnboarded}");
    print("User Phone: ${user?.phone}");
    print("User ProfileImage: ${user?.profileImage}");
    print("User Gender: ${user?.gender}");
    print("User DOB: ${user?.dob}");
    print("User Email: ${user?.email}");
  }

  void verifyOtp(String phone) async {
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
        final model = VerifyOtpResponseModel.fromJson(response.data);
        verifyOtpModel.value=model;
        final responseData = response.data["data"]['user'];
        if (model.status == true) {
          print("Status : ${model.status}");
          print("Message : ${model.message}");
          print("Token : ${model.data?.token}");

          PrefManager.setToken(model.data!.token.toString());
          final user = UserModel.fromJson(responseData);
          await PrefManager.saveUser(user);


          errorToShow.value = model.message.toString();
          showContainer.value=true;
          successCondition.value =true;


          final register = model.data?.user?.isRegistered;
          final onBoarding = model.data?.user?.isOnboarded;

          print("Registered Or Not : $register");
          if(register==0){
            Future.delayed(Duration(seconds: 2),(){
              Get.toNamed(AppRoutes.profileRegistrationView);
            });
          }else if(onBoarding==0) {
            Future.delayed(Duration(seconds: 2),(){
              Get.toNamed(AppRoutes.improvementView);
            });
          }else{
            Future.delayed(Duration(seconds: 2),(){
              Get.toNamed(AppRoutes.bottomNavNavigation);
            });
          }
        } else {
          print("Otp Verification Failed: ${model.message}");
          successCondition.value =false;
          errorToShow.value = model.message.toString();
          Utils.toastMessage(model.message ?? "Otp verification failed".tr);
        }
      } else {
        print("No response from server");
        successCondition.value =false;
        errorToShow.value = "Unable to verify OTP, please try again".tr;
        Utils.toastMessage("Unable to verify OTP, please try again".tr);
      }
    } catch (e) {
      print("Error verifying OTP: $e");
      successCondition.value =false;
      errorToShow.value = "Error verifying OTP: $e";
      Utils.toastMessage("${"Error verifying OTP".tr}: $e");
    }
  }

  void sendOtp() async {

    String phone = selectedCode.value.replaceAll('+', '') + phoneController.value.text;

    Map<String, dynamic> data = {"phone": phone};

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
          Utils.toastMessage(model.message.toString());
          Get.toNamed(AppRoutes.otpVerificationView,arguments: {
            'phoneNumber': phoneController.value.text,
          });
        } else {
          Utils.toastMessage(model.message ?? "Failed to send OTP".tr);
        }
      } catch (e) {
        print("Error parsing OTP response: $e");
        Utils.toastMessage("Error parsing OTP response".tr);
      }
    } else {
      Utils.toastMessage("No response while sending OTP".tr);
    }
  }

  void googleRegister(String email, var authId,displayName) async {

    if (email.isEmpty) {
      Utils.toastMessage('Email Not Found'.tr);
      return;
    }

    Utils.showLoader();

    List<String> nameParts = displayName.split(' ');
    String firstName = nameParts.isNotEmpty ? nameParts[0] : "";
    String lastName = nameParts.length > 1 ? nameParts.sublist(1).join(' ') : "";
    String dob ="1995-10-20";
    int gender =1;
    Map<String, dynamic> data = {
      "auth_type": "google",
      "email": email,
      "auth_id": authId.toString(),
      "first_name": firstName,
      "last_name": lastName,
      "dob": dob,
      "gender": gender
    };

    print('Sending Google Register Data: $data');

    dio.Response? response = await networkManager.callApi(
      urlEndPoint: ApiEndpoints.apiRegisterEndPoint,
      method: HttpMethod.post,
      body: data,
    );

    loading.value = false;

    if (response != null) {
      final model = GoogleLoginResponseModel.fromJson(response.data);
      googleModel.value = model;

      try {
        if (model.status == true) {
          print("Register Successful Message: ${model.message}");
          Utils.toastMessage("Registration successful!".tr);
          phoneController.value.clear();

          PrefManager.setToken(model.data!.token.toString());
          PrefManager.setIsLogin(true);
          PrefManager.save("firstName", firstName);
          PrefManager.save("lastName", lastName);
          PrefManager.save("dob", dob);
          PrefManager.save("gender", gender);
          Get.toNamed(AppRoutes.bottomNavNavigation);

        } else {
          print("Register Failed: ${model.message}");
          Utils.toastMessage(model.message ?? "Registration failed".tr);
          if (model.errors != null) {
            print("Registration Errors: ${model.errors}");
          }
        }
      } catch (error, stackTrace) {
        print("Error parsing response: $error");
        print("Stack Trace: $stackTrace");
        print("Model Errors: ${model.errors}");
        Utils.toastMessage("Registration failed. Please try again.".tr);
      }
    } else {
      print("Unsuccessful Register: No response");
      Utils.toastMessage("Unable to register, please check your connection.".tr);
    }
  }

  Future<GoogleSignInAccount?> googleSignInTry() async {
    try {
      await googleSignIn.signOut();

      print(" Starting fresh Google Sign-In...");
      GoogleSignInAccount? account = await googleSignIn.signIn();

      if (account != null) {
        final GoogleSignInAuthentication auth = await account.authentication;

        print(" Sign-in successful!");
        print("Account ID: ${account.id}");
        print("Account Email: ${account.email}");
        print("Account DisplayName: ${account.displayName}");
        print("Account PhotoUrl: ${account.photoUrl}");
        print("Access Token: ${auth.accessToken}");
        print("ID Token: ${auth.idToken}");

        final email = account.email;
        final authId = account.id;
        final displayName = account.displayName ?? "";
        final photoUrl = account.photoUrl ?? "";
        final accessToken = auth.accessToken ?? "";

        PrefManager.save('photoUrl', photoUrl);
        PrefManager.save('authId', auth.idToken);

        googleRegister(email, authId, displayName);

        return account;
      } else {
        print(" User cancelled sign-in");
        return null;
      }
    } on PlatformException catch (error) {
      print(" PlatformException during Google Sign-In:");
      print("Code: ${error.code}");
      print("Message: ${error.message}");
      print("Details: ${error.details}");

      switch (error.code) {
        case 'sign_in_failed':
          print("🔧 Troubleshooting steps:");
          print("1. Check SHA-1/SHA-256 fingerprints in Google Cloud Console");
          print("2. Verify package name matches Google Cloud Console");
          print("3. Ensure google-services.json is properly configured");
          print("4. Check if Google Sign-In API is enabled");
          Utils.toastMessage("Sign-in configuration error. Please try again.".tr);
          break;
        case 'network_error':
          print(" Check your internet connection");
          Utils.toastMessage("Network error. Please check your connection.".tr);
          break;
        case 'sign_in_canceled':
          print(" User cancelled the sign-in process");
          Utils.toastMessage("Sign-in cancelled.".tr);
          break;
        default:
          print(" Unknown error occurred");
          Utils.toastMessage("Sign-in failed. Please try again.".tr);
      }
      return null;
    } catch (error, stackTrace) {
      print("Unexpected error during Google Sign-In:");
      print("Error: $error");
      print("Stack Trace: $stackTrace");
      Utils.toastMessage("An unexpected error occurred. Please try again.".tr);
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      await googleSignIn.signOut();
      print(" Successfully signed out");
    } catch (error) {
      print(" Error during sign-out: $error");
    }
  }

  Future<void> disconnect() async {
    try {
      await googleSignIn.disconnect();
      print("Successfully disconnected");
    } catch (error) {
      print("Error during disconnect: $error");
    }
  }

}
