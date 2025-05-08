import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MainController extends GetxController{

  final storage = GetStorage();
  late RxString lang = 'en'.obs;
  late RxBool isDarkMode = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    readMode();
    readLanguage();
    super.onInit();
  }
  void writeLanguage(String language) {
    storage.write('lang', language);
    lang.value = language;
    update();
  }

  void writeMode(bool mode) {
    storage.write('mode', mode);
    isDarkMode.value = mode;
    update();
  }

  void readMode() {
    final isMode = storage.read('mode');
    if (isMode != null){
      isDarkMode(isMode);
    }
    update();
  }

  void readLanguage() {
    final storedLang = storage.read('lang');
    if (storedLang != null){
      lang.value = storedLang;
    }
    update();
  }
}