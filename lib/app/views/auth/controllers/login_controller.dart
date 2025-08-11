import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../core/network/networking_managar.dart';
import '../../../../core/utils/utils.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  RxBool isOtpSent = true.obs;

  TextEditingController phoneController = TextEditingController();

  Future<void> login(String phone) async {
    try {
      isLoading.value = true;

      // Use dio.FormData to explicitly specify which FormData to use
      dio.FormData formData = dio.FormData.fromMap({"phone": phone});

      dio.Response? response = await NetworkManager().callApi(
        method: HttpMethod.post,
        body: formData,
        urlEndPoint: 'login',
        isFormDataRequest: true,
      );

      if (response != null && response.statusCode == 200) {
        if (response.data['status'] == true) {
          isOtpSent.value = true;
        } else {
          Utils.toastMessage(response.data['message']);
        }
      }
    } catch (e) {
      Utils.toastMessage("Login failed");
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
}
