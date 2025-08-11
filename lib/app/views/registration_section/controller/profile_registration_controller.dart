

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileRegistrationController extends GetxController{

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  String selectedGender = 'Male';
  String selectedDay = '00';
  String selectedMonth = '00';
  String selectedYear = '2024';
  bool agreeToTerms = false;
  String check = 'Other';

}