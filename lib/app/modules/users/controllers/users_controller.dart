import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:obs/app/routes/app_pages.dart';

class UsersController extends GetxController {
  final storage = GetStorage();
  final RxString _profile = ''.obs;

  RxString get profile => _profile;

  @override
  void onInit() {
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
}
