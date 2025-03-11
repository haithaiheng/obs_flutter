import 'dart:ffi';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UsersController extends GetxController {
  //TODO: Implement UsersController

  late RxString lang = 'en'.obs;
  late RxBool isDarkmode = false.obs;
  final storage = GetStorage();
  @override
  void onInit() {
    readMode();
    readLanguage();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void writeLanguage(String language) {
    storage.write('lang', language);
    lang.value = language;
    update();
  }

  void readLanguage() {
    lang.value = storage.read('lang');
    update();
  }

  void writeMode(bool mode) {
    storage.write('mode', mode);
    isDarkmode.value = mode;
    update();
  }

  void readMode() {
    isDarkmode.value = storage.read('mode');
    update();
  }
}
