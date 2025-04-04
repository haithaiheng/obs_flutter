import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';

class SplashScreenController extends GetxController {
  //TODO: Implement SplashScreenController

  final _storage = GetStorage();

  @override
  void onInit() {
    checkUserLogin();
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

  void checkUserLogin(){
    try{
      Future.delayed(const Duration(seconds: 2),(){
        final stored = _storage.read('login');
        if (stored != null){
          Get.offAllNamed(Routes.MAIN_SCREEN);
        }else{
          Get.offAllNamed(Routes.SIGNIN);
        }
      });
    }catch(e){
      Get.snackbar("Error", e.toString());
    }
  }
}
