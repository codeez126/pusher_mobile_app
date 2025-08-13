


import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneLoginController extends GetxController{

  final TextEditingController phoneController = TextEditingController();
  final List<Map<String, String>> countryList = [
    {'code': '+93', 'flag': '🇦🇫', 'name': 'Afghanistan'},
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

  final RxString selectedCode = '+972'.obs;

  final isClickedCountryCode = false.obs;

}