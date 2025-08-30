import 'dart:async';

import 'package:base_project/app/routes/app_routes.dart';
import 'package:base_project/app/views/image_picker/views/image_picker_example.dart';
import 'package:base_project/core/widgets/image_picker_widget.dart';
import 'package:get/get.dart';

import '../../../../core/Managers/PrefManager.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    splashCountDown();
  }

  splashCountDown() {
    Future.delayed(const Duration(seconds: 10), () {
      Get.offNamed(/*PrefManager.isLogin()?AppRoutes.bottomNavNavigation:*/AppRoutes.onboardingView);
    });
  }
}
