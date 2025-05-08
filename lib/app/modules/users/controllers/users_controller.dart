import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:obs/app/routes/app_pages.dart';

class UsersController extends GetxController {
  final storage = GetStorage();
  final RxString _profile = ''.obs;
  RxString get profile => _profile;
  final RxString userLogin = ''.obs;

  @override
  void onInit() {
    getUserId();
    readProfile();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void logout() {
    storage.remove('login');
    final isLogin = storage.read('login');
    if (isLogin == null) {
      Get.offAllNamed(Routes.SIGNIN);
    }
  }

  void readProfile() {
    final myJson = storage.read('login');
    if (myJson != null) {
      _profile.value = jsonEncode(myJson);
      update();
    }
  }

  void getUserId() async {
    final isLogin = await storage.read('login');
    userLogin.value = isLogin['user_id'];
    update();
  }
}
