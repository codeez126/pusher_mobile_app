import 'package:base_project/app/views/bottom_nav_navigation.dart';
import 'package:base_project/app/views/home_section/views/daily_course_view.dart';
import 'package:base_project/app/views/home_section/views/daily_goals_doing_view.dart';
import 'package:base_project/app/views/home_section/views/daily_goals_done_view.dart';
import 'package:base_project/app/views/home_section/views/daily_goals_view.dart';
import 'package:base_project/app/views/home_section/views/motivational_videos_view.dart';
import 'package:base_project/app/views/home_section/views/notification_view.dart';
import 'package:base_project/app/views/home_section/views/pusher_challenge_done_view.dart';
import 'package:base_project/app/views/home_section/views/pusher_challenge_view.dart';
import 'package:base_project/app/views/home_section/views/pusher_challenges_all_completed_view.dart';
import 'package:base_project/app/views/onboarding/view/onboarding_2_view.dart';
import 'package:base_project/app/views/onboarding/view/onboarding_view.dart';
import 'package:base_project/app/views/registration_section/view/improvement_view.dart';
import 'package:base_project/app/views/registration_section/view/personal_goals_view.dart';
import 'package:base_project/app/views/registration_section/view/premium_subscription_view.dart';
import 'package:base_project/app/views/splash/views/splash_view.dart';
import 'package:get/get.dart';
import '../views/home_section/views/well_done_view.dart';
import '../views/registration_section/view/otp_verfication_view.dart';
import '../views/registration_section/view/phone_login_view.dart';
import '../views/registration_section/view/profile_registration_view.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    // Auth
    GetPage(name: AppRoutes.splashView, page: () => SplashView()),
    GetPage(name: AppRoutes.onboardingView, page: () => OnboardingView()),
    GetPage(name: AppRoutes.onboarding2View, page: () => Onboarding2View()),
    GetPage(name: AppRoutes.phoneLogin, page: () => PhoneLogin()),
    GetPage(name: AppRoutes.otpVerificationView, page: () => OtpVerficationView()),
    GetPage(name: AppRoutes.profileRegistrationView, page: () => ProfileRegistrationView()),
    GetPage(name: AppRoutes.improvementView, page: () => ImprovementView()),
    GetPage(name: AppRoutes.personalGoalsView, page: () => PersonalGoalsView()),
    GetPage(name: AppRoutes.premiumSubscriptionView, page: () => PremiumSubscriptionView()),


    GetPage(name: AppRoutes.wellDoneView, page: () => WellDoneView()),
    GetPage(name: AppRoutes.notificationsView, page: () => NotificationsView()),
    GetPage(name: AppRoutes.dailyGoalsView, page: () => DailyGoalsView()),
    GetPage(name: AppRoutes.dailyGoalsDoingView, page: () => DailyGoalsDoingView()),
    GetPage(name: AppRoutes.dailyGoalsDoneView, page: () => DailyGoalsDoneView()),
    GetPage(name: AppRoutes.motivationalVideosView, page: () => MotivationalVideosView()),
    GetPage(name: AppRoutes.dailyCourseView, page: () => DailyCourseView()),
    GetPage(name: AppRoutes.pusherChallengeView, page: () => PusherChallengeView()),
    GetPage(name: AppRoutes.pusherChallengeDoneView, page: () => PusherChallengeDoneView()),
    GetPage(name: AppRoutes.pusherChallengeAllCompletedView, page: () => PusherChallengesAllCompletedView()),


    GetPage(name: AppRoutes.bottomNavNavigation, page: ()=> BottomNavNavigation()),

  ];
}
