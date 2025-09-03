import 'package:get/get.dart';
import 'package:base_project/core/Managers/PrefManager.dart';
import 'package:base_project/app/views/auth/model/user_model.dart';

class ProfileViewController extends GetxController {
  var user = Rxn<UserModel>();

  @override
  void onInit() {
    super.onInit();
    loadUser();
  }

  Future<void> loadUser() async {
    user.value = await PrefManager.getUser();
  }

  Future<void> updateUser(UserModel newUser) async {
    await PrefManager.saveUser(newUser);
    user.value = newUser;
  }

  Future<void> clearUser() async {
    await PrefManager.clearUser();
    user.value = null;
  }
}
