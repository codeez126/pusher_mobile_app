

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../core/constants/app_images.dart';

class MotivationalVideosController extends GetxController{

  RxBool isFavourite = false.obs;
  List<String> images=[
    AppImages.motivationalVideoBackgroundOne,
    AppImages.motivationalVideoBackgroundTwo,
    AppImages.motivationalVideoBackgroundThree,
    AppImages.motivationalVideoBackgroundFour,
    AppImages.motivationalVideoBackgroundOne,
    AppImages.motivationalVideoBackgroundTwo,
    AppImages.motivationalVideoBackgroundThree,
    AppImages.motivationalVideoBackgroundFour,
  ];

  void  addOrRemoveFav(){
    isFavourite.value = !isFavourite.value;
  }

}