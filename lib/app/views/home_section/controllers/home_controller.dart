import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var currentIndex = 1.obs;
  final PageController controller = PageController(
    viewportFraction: 0.75,
    initialPage: 1,
  );
}
