import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:obs/app/routes/app_pages.dart';

class VerifyController extends GetxController {
  //TODO: Implement VerifyController

  late Map arg = {};
  final RxString _email = ''.obs;
  get email => _email;
  final errorStr = ''.obs;
  final formKey = GlobalKey<FormState>();
  final code = TextEditingController();

  @override
  void onInit() {
    arg = Get.arguments;
    _email.value = arg['email'];
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

  void verify(){
    try{
      if (code.text == arg['code']){
        Get.toNamed(Routes.RESET_PASSOWRD, arguments: _email.value);
      }else{
        errorStr.value = 'Invalid Code';
        update();
      }
    }catch(e){
      Get.snackbar("Error", e.toString());
    }
  }

}
