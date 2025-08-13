

import 'package:get/get.dart';

class PusherChallengeController extends GetxController{

  final List<String> taskNames = [
    "Listening To Music".tr,
    "45 Minutes Workout".tr,
    "Cold Shower".tr,
    "Protein Shake".tr,
  ];
  final List<String> taskDescriptions = [
    "Listen to your favorite music for 30 minutes".tr,
    "Complete a 45-minute workout session".tr,
    "Take a cold shower for at least 5 minutes".tr,
    "Drink a protein shake after your workout".tr,
  ];
 // make for instructions
  final List<String> taskInstructions = [
    "Choose a playlist or album you love and enjoy the music".tr,
    "Follow a workout routine that suits your fitness level".tr,
    "Adjust the water temperature to cold and stay under for 5 minutes".tr,
    "Mix your protein powder with water or milk and drink it post-workout".tr,
  ];


  bool selectedPlan = false;
  bool selectedChallenge = false;



}