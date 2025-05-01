import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constants/app_constant.dart';
import '../controllers/verify_controller.dart';

class VerifyView extends GetView<VerifyController> {
  const VerifyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
              key: controller.formKey,
              child: SizedBox(
                height: Get.height * 0.5,
                child: Column(
                  spacing: 10,
                  // alignment: WrapAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/Logo.png',
                      scale: 3,
                    ),
                    Align(
                      // alignment: Alignment.center,
                      child: Text(
                        "verify_code".tr,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor,
                            fontSize: 22),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(text: "enter_code_from_email".tr, style: TextStyle(color: Colors.black54)),
                          TextSpan(text: controller.email.value, style: TextStyle(color: Colors.black38))
                        ],
                      ),
                    ),
                    TextFormField(
                      controller: controller.code,
                      cursorHeight: 20,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "enter_code".tr,
                        labelText: "code".tr,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "required_code".tr;
                        }
                        return null;
                      },
                    ),
                    Container(
                      width: Get.width,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            AppColors.primaryColor,
                            Color(0xFFd16469)
                          ]),
                          borderRadius: BorderRadius.circular(50)),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape:
                                WidgetStatePropertyAll<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            side: WidgetStatePropertyAll(BorderSide.none),
                            foregroundColor:
                                WidgetStatePropertyAll(Colors.white),
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.transparent),
                            shadowColor:
                                WidgetStatePropertyAll(Colors.transparent)),
                        onPressed: () {
                          if (controller.formKey.currentState!.validate()) {
                            controller.verify();
                          }
                        },
                        child: Text(
                          "verify_code".tr,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    controller.errorStr.value != ''
                        ? Text(
                            controller.errorStr.value,
                            style: TextStyle(color: Colors.red),
                          )
                        : SizedBox(),
                    Divider(),
                    TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          "back".tr,
                          style: TextStyle(color: AppColors.primaryColor),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
