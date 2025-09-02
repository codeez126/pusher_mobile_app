import 'package:base_project/core/Managers/PrefManager.dart';
import 'package:get/get.dart';

import '../../auth/model/login_model.dart';

class ProfileViewController extends GetxController {
  /// Reactive user object (nullable at first)
  final Rxn<UserModel> user = Rxn<UserModel>();

  @override
  void onInit() {
    super.onInit();
    loadUser();
  }

  Future<void> loadUser() async {
    final storedUser = await PrefManager.getUser();
    if (storedUser != null) {
      user.value = storedUser;
    }
  }
}
