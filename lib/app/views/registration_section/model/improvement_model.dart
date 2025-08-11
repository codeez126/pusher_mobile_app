import 'package:base_project/core/constants/app_images.dart';

class ImprovementModel {
  final String title;
  final String image;

  ImprovementModel({
    required this.title,
    required this.image,
  });

  static final List<ImprovementModel> categories = [
    ImprovementModel(
      title: 'Fitness',
      image: AppImages.fitness,
    ),
    ImprovementModel(
      title: 'Relationship',
      image: AppImages.relationship,
    ),
    ImprovementModel(
      title: 'Motivation',
      image: AppImages.motivation,
    ),
    ImprovementModel(
      title: 'Financial',
      image: AppImages.financial,
    ),
    ImprovementModel(
      title: 'Social',
      image: AppImages.social,
    ),
    ImprovementModel(
      title: 'Balance',
      image: AppImages.balance,
    ),
  ];
}
