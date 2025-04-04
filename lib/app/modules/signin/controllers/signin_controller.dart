import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';
import '../providers/signin_provider.dart';

class SigninController extends GetxController {
  //TODO: Implement SigninController
  final _provider = Get.put(SigninProvider());
  RxBool isLoading = false.obs;
  RxBool isSecure = true.obs;
  final _storage = GetStorage();

  @override
  void onInit() {
    // TODO: implement onInit
    readStorage();
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
              isLoading(false);
              _storage.write('login', value['data'][0]);
              readStorage();
              Get.offAllNamed(Routes.MAIN_SCREEN);
          }
        }
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

}
