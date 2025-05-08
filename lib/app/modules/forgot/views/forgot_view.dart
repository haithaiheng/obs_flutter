import 'dart:math';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constants/app_constant.dart';
import '../controllers/forgot_controller.dart';

class ForgotView extends GetView<ForgotController> {
  const ForgotView({super.key});
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final email = TextEditingController();
    return GetBuilder<ForgotController>(
        init: ForgotController(),
        builder: (controller)=>Scaffold(
      body:Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [AppColors.primaryColor, Color(0xFFd16469)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
          image: DecorationImage(
              image: AssetImage("assets/images/b-app.png"),
              // fit: BoxFit.cover,
              alignment: Alignment.bottomCenter,
              repeat: ImageRepeat.noRepeat),
        ),
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
            child: Form(
              key: formKey,
              child: SizedBox(
                height: Get.height*0.5,
                child: Column(
                  spacing: 10,
                  // alignment: WrapAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/Logo.png',
                      scale: 3,
                      // height: 40,
                    ),
                    Text("forgot_password".tr, style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.primaryColor, fontSize: 22),),
                    Text("enter_email_to_reset".tr),
                    TextFormField(
                      controller: email,
                      cursorHeight: 20,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "enter_email".tr,
                        labelText: "email".tr,
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: AppColors.primaryColor,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "required_email".tr;
                        }
                        return null;
                      },
                    ),
                    Container(
                      width: Get.width,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [AppColors.primaryColor, Color(0xFFd16469)]),
                          borderRadius: BorderRadius.circular(50)),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            side: WidgetStatePropertyAll(BorderSide.none),
                            foregroundColor: WidgetStatePropertyAll(Colors.white),
                            backgroundColor:
                            WidgetStatePropertyAll(Colors.transparent),
                            shadowColor:
                            WidgetStatePropertyAll(Colors.transparent)),
                        onPressed: () async {
                          if (formKey.currentState!.validate()){
                            if (controller.isLoading.value) return;
                            await controller.forgotPassword(email.text);
                            formKey.currentState!.reset();
                          }
                        },
                        child: controller.isLoading.value ? Transform.scale(scale: 0.5, child: CircularProgressIndicator(),) : Text(
                          "SEND",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    controller.errorStr.value != '' ? Text(controller.errorStr.value, style: TextStyle(color: Colors.red),) : SizedBox(),
                    Divider(),
                    TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          "Back",
                          style: TextStyle(color: AppColors.primaryColor),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
