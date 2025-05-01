import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:obs/app/routes/app_pages.dart';

import '../../../constants/app_constant.dart';
import '../controllers/reset_passowrd_controller.dart';

class ResetPassowrdView extends GetView<ResetPassowrdController> {
  const ResetPassowrdView({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _password = TextEditingController();
    final _confirm = TextEditingController();
    return GetBuilder<ResetPassowrdController>(
        init: ResetPassowrdController(),
        builder: (controller) => Scaffold(
              body: Scaffold(
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
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20),
                      child: controller.isSuccess.value
                          ? SizedBox(
                        height: Get.height*0.4,
                            child: Column(
                                spacing: 20,
                                // alignment: WrapAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/Logo.png',
                                    scale: 2,
                                  ),
                                  Align(
                                    child: Text(
                                      "success".tr,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.primaryColor,
                                          fontSize: 22,),
                                    ),
                                  ),
                                  Text("successfully".tr),
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
                                          shape: WidgetStatePropertyAll<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                          ),
                                          side: WidgetStatePropertyAll(
                                              BorderSide.none),
                                          foregroundColor: WidgetStatePropertyAll(
                                              Colors.white),
                                          backgroundColor: WidgetStatePropertyAll(
                                              Colors.transparent),
                                          shadowColor: WidgetStatePropertyAll(
                                              Colors.transparent)),
                                      onPressed: () {
                                        Get.offAllNamed(Routes.SIGNIN);
                                      },
                                      child: Text(
                                        "signin".tr,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                          )
                          : Form(
                              key: _formKey,
                              child: SizedBox(
                                height: Get.height * 0.62,
                                child: Column(
                                  spacing: 10,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/Logo.png',
                                      scale: 2,
                                    ),
                                    Text(
                                      "reset_password".tr,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.primaryColor,
                                          fontSize: 22),
                                    ),
                                    Text("enter_new_password".tr),
                                    TextFormField(
                                      controller: _password,
                                      cursorHeight: 20,
                                      obscureText:
                                          controller.passwordObscure.value,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        hintText: "enter_password".tr,
                                        labelText: "password".tr,
                                        prefixIcon: Icon(
                                          Icons.lock_outline,
                                          color: AppColors.primaryColor,
                                        ),
                                        suffixIcon: IconButton(
                                            onPressed: () {
                                              controller.setPasswordObscure();
                                            },
                                            icon: Icon(
                                                Icons.remove_red_eye_outlined)),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: AppColors.primaryColor,
                                          ),
                                          borderRadius: BorderRadius.circular(50),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "required_password".tr;
                                        }
                                        return null;
                                      },
                                    ),
                                    TextFormField(
                                      controller: _confirm,
                                      obscureText:
                                          controller.confirmObscure.value,
                                      cursorHeight: 20,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        hintText: "enter_confirmpassword".tr,
                                        labelText: "confirmpassword".tr,
                                        prefixIcon: Icon(
                                          Icons.lock_outline,
                                          color: AppColors.primaryColor,
                                        ),
                                        suffixIcon: IconButton(
                                            onPressed: () {
                                              controller.setConfirmObscure();
                                            },
                                            icon: Icon(
                                                Icons.remove_red_eye_outlined)),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: AppColors.primaryColor,
                                          ),
                                          borderRadius: BorderRadius.circular(50),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "required_confirmpassword".tr;
                                        }else if (value != _password.text){
                                          return "Confirm Password is not match";
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
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                            shape: WidgetStatePropertyAll<
                                                RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                            ),
                                            side: WidgetStatePropertyAll(
                                                BorderSide.none),
                                            foregroundColor:
                                                WidgetStatePropertyAll(
                                                    Colors.white),
                                            backgroundColor:
                                                WidgetStatePropertyAll(
                                                    Colors.transparent),
                                            shadowColor: WidgetStatePropertyAll(
                                                Colors.transparent)),
                                        onPressed: () {
                                          if (_formKey.currentState!.validate()) {
                                            if (controller.isLoading.value)
                                              return;
                                            controller
                                                .resetPassword(_password.text);
                                            _formKey.currentState!.reset();
                                          }
                                        },
                                        child: controller.isLoading.value
                                            ? Transform.scale(
                                                scale: 0.5,
                                                child:
                                                    CircularProgressIndicator(),
                                              )
                                            : Text(
                                                "send".tr,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold),
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
                                          style: TextStyle(
                                              color: AppColors.primaryColor),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                    ),
                  ),
                ),
              ),
            ));
  }
}
