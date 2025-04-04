import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:obs/app/routes/app_pages.dart';

import '../providers/signup_provider.dart';

class SignupController extends GetxController {
  //TODO: Implement SignupController

  final _provider = Get.put(SignupProvider());
  final errorStr = ''.obs;
  final formKey = GlobalKey<FormState>();
  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  final passwordObscure = true.obs;
  final confirmObscure = true.obs;

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

  void createAccount() async{
    try{
      Map body = {
        "no":getRandomString(20),
        "first":firstname.text,
        "last":lastname.text,
        "email":email.text,
        "pwd":password.text,
        "bio":"N/A"
      };
      await _provider.signup(body).then((value){
        if (value is String){
          errorStr.value = value;
        }else{
          if (value['message'] == 'add'){
            Get.offAllNamed(Routes.SIGNIN);
          }
        }
      });
    }catch(e){
      Get.snackbar("Message", e.toString());
    }
  }

  void setPasswordObscure(){
    passwordObscure.value = !passwordObscure.value;
    update();
  }
  void setConfirmObscure(){
    confirmObscure.value = !confirmObscure.value;
    update();
  }

  static const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

}
