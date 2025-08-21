import 'package:base_project/core/constants/app_images.dart';

class VouchersAndCoinsModel {
  final String challengeName;
  final String backgroundImage;
  final String challengeTime;
  final String trainerName;
  final String trainerDescription;
  final String courseDescription;
  final int points;
  final List<String> tasks;

  const VouchersAndCoinsModel({
    required this.challengeName,
    required this.backgroundImage,
    required this.challengeTime,
    required this.trainerName,
    required this.trainerDescription,
    required this.courseDescription,
    required this.points,
    required this.tasks,

  });

  static const List<VouchersAndCoinsModel> challenges = [
    VouchersAndCoinsModel(
      challengeName: "Financial",
      backgroundImage: AppImages.challengeBackgroundImage1,
      challengeTime: "30",
      trainerName: "Paz Flaysher ",
      trainerDescription: "Professional Crypto Entrepreneur and Trader",
      courseDescription: "Join the Financial and Economical Challenges with a Professional Crypto Entrepreneur and Trader",
      points: 200,
      tasks: [
        "Track Your Spending",
        "Create a Simple Budget",
        "Set SMART Financial Goals",
      ],
    ),

    VouchersAndCoinsModel(
      challengeName: "Fit",
      backgroundImage: AppImages.challengeBackgroundImage1,
      challengeTime: "20",
      trainerName: "Bar Pahima",
      trainerDescription: "Professional trainer, Instagram influencer",
      courseDescription: "Join the Body Fitness Challenges with a Professional trainer, Instagram influencer",
      points: 150,
      tasks: [
        "Long-Term Planning & Review",
        "Learn About Investments",
        "Automate Your Savings",
      ],
    ),

    VouchersAndCoinsModel(
      challengeName: "Economic",
      backgroundImage: AppImages.challengeBackgroundImage1,
      challengeTime: "20",
      trainerName: "Paz Robert",
      trainerDescription: "Professional Crypto Entrepreneur and Trader",
      courseDescription: "Boost your money mindset with actionable financial habits.",
      points: 150,
      tasks: [
        "Listen To A Financial Podcast",
        "Read a Finance Article",
        "Reflect on Daily Expenses",
      ],
    ),
  ];
}
