import 'package:get/get.dart';

import '../model/course_add_fav_model.dart';

class FavoritesController extends GetxController {
  var favorites = <CoursesAddingFavModel>[].obs;

  void toggleFavorite(CoursesAddingFavModel course) {
    if (favorites.any((c) => c.title == course.title)) {
      favorites.removeWhere((c) => c.title == course.title);
    } else {
      favorites.add(course);
    }
  }

  bool isFavorite(String title) {
    return favorites.any((c) => c.title == title);
  }
}


