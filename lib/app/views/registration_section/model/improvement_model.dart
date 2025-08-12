import 'package:base_project/core/constants/app_images.dart';
import 'package:get/get.dart';

class ImprovementModel {
  final String title;
  final String image;

  ImprovementModel({
    required this.title,
    required this.image,
  });

  static final List<ImprovementModel> categories = [
    ImprovementModel(
      title: 'Fitness'.tr,
      image: AppImages.fitness,
    ),
    ImprovementModel(
      title: 'Relationship'.tr,
      image: AppImages.relationship,
    ),
    ImprovementModel(
      title: 'Motivation'.tr,
      image: AppImages.motivation,
    ),
    ImprovementModel(
      title: 'Financial'.tr,
      image: AppImages.financial,
    ),
    ImprovementModel(
      title: 'Social'.tr,
      image: AppImages.social,
    ),
    ImprovementModel(
      title: 'Balance'.tr,
      image: AppImages.balance,
    ),
  ];
}
