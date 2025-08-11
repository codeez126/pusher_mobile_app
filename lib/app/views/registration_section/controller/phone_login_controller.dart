


import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneLoginController extends GetxController{

  final TextEditingController phoneController = TextEditingController();
  final List<String> countryCodes = ['+972', '+1', '+91'];
  final RxString selectedCode = '+972'.obs;

}