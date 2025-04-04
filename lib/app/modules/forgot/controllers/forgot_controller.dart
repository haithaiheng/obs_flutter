import 'package:get/get.dart';
import 'package:obs/app/constants/app_constant.dart';
import 'package:obs/app/modules/forgot/providers/forgot_provider.dart';

import '../../../routes/app_pages.dart';

class ForgotController extends GetxController {
  //TODO: Implement ForgotController
final _provider = Get.put(ForgotProvider());
  RxString errorStr = ''.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
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
  void setLoading (bool value){
    isLoading.value = value;
    update();
  }

  void forgotPassword(String email) async {
    setLoading(true);
    try{
      await _provider.forgot(email).then((value){
        if (value is String){
          errorStr.value = value;
          update();
          // Get.snackbar("message".tr,value,
          //     snackPosition: SnackPosition.BOTTOM);
        }else{
          if (value['message'] == 'success') {
            Get.toNamed(Routes.VERIFY, arguments: {'email':email,'code':value['code']});
          }
        }
        setLoading(false);
        // update();
      });

    }catch(e){

      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM, colorText: AppColors.secondaryColor);
    }

  }
}
