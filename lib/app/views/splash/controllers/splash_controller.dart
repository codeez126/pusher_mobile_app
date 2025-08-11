import 'dart:async';

import 'package:base_project/app/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    splashCountDown();
  }

  splashCountDown() {
    Future.delayed(const Duration(seconds: 10), () {
       Get.offNamed(AppRoutes.onboardingView);
    });
  }
}
