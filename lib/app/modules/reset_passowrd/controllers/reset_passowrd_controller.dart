import 'package:get/get.dart';
import 'package:obs/app/modules/reset_passowrd/providers/resetpassword_provider.dart';

class ResetPassowrdController extends GetxController {
  //TODO: Implement ResetPassowrdController

  RxBool passwordObscure = true.obs;
  RxBool confirmObscure = true.obs;
  final _provider = Get.put(ResetpasswordProvider());
  String _email = '';
  RxString errorStr = ''.obs;
  RxBool isLoading = false.obs;
  RxBool isSuccess = false.obs;

  @override
  void onInit() {
    _email = Get.arguments;
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

  void setPasswordObscure(){
    passwordObscure.value = !passwordObscure.value;
    update();
  }
  void setConfirmObscure(){
    confirmObscure.value = !confirmObscure.value;
    update();
  }

  void setLoading(bool value){
    isLoading.value = value;
    update();
  }

  Future<void> resetPassword(String password) async{
    try{
      setLoading(true);
      await _provider.reset(password, _email).then((value){
        if (value is String){
          errorStr.value = value;
          update();
        }else{
          if (value['message'] == 'success') {
            isSuccess(true);
            update();
          }
        }
        setLoading(false);
      });
    }catch(e){
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }
}
