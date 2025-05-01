import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../constants/appMode.dart';
import '../../../routes/app_pages.dart';
import '../providers/signin_provider.dart';

class SigninController extends GetxController {
  //TODO: Implement SigninController
  final _provider = Get.put(SigninProvider());
  RxBool isLoading = false.obs;
  RxBool isSecure = true.obs;
  final _storage = GetStorage();
  RxString isLocale = 'EN'.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    readStorage();
    readLanguage();
    super.onInit();
  }

  void login(String email, String password) async {
    try {
      isLoading(true);
      _provider.login(email, password).then((value) {
        if (value is String) {
          Get.snackbar("message".tr,value,
              snackPosition: SnackPosition.BOTTOM);
        } else {
          if (value['message'] == 'success') {

              _storage.write('login', value['data'][0]);
              readStorage();
              Get.offAllNamed(Routes.MAIN_SCREEN);
          }
        }
        isLoading(false);
      });
      update();
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  void readStorage(){
    final stored = _storage.read('login');
    print("sing: $stored");
  }

  void readLanguage(){
    final stored = _storage.read('lang');
    if (stored == 'en'){
      isLocale.value = 'EN';
    }else{
      isLocale.value = 'KH';
    }
  }

  void changeLanguage(){
    var locale = Locale('en', 'US');
    var language = '';
    if (isLocale.value == 'EN'){
      isLocale.value = 'KH';
      locale = Locale('kh', 'KM');
      language = 'kh';
      CustomTheme.font = "KantumruyPro";
    }else{
      isLocale.value = 'EN';
      language = 'en';
      CustomTheme.font = "Poppins";
    }
    Get.updateLocale(locale);
    _storage.write('lang', language);
    update();
  }

}
