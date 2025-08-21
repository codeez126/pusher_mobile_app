import 'package:get/get.dart';

class ViewingTheChallengeController extends GetxController{


  final List<String> challengesNames = [
    "Track Your Spending".tr,
    "Long-Term Planning & Review".tr,
    "Listen To A Financial Podcast".tr,
    "Set SMART Financial Goals".tr,
  ];
  final List<String> challengesDescriptions = [
    "Listen to your favorite music for 30 minutes".tr,
    "Complete a 45-minute workout session".tr,
    "Take a cold shower for at least 5 minutes".tr,
    "Drink a protein shake after your workout".tr,
  ];

  final List<String> challengesInstructions = [
    "Choose a playlist or album you love and enjoy the music".tr,
    "Follow a workout routine that suits your fitness level".tr,
    "Adjust the water temperature to cold and stay under for 5 minutes".tr,
    "Mix your protein powder with water or milk and drink it post-workout".tr,
  ];
  bool selectedPlan = false;
  bool selectedChallenge = false;


}