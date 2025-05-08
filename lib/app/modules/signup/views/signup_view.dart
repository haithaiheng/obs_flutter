import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:obs/app/constants/app_constant.dart';
import 'package:obs/app/routes/app_pages.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupController>(
        init: SignupController(),
        builder: (controller){
      return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              AppColors.primaryColor,
              Color(0xFFd16469)
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            image: DecorationImage(
                image: AssetImage("assets/images/b-app.png"),
                // fit: BoxFit.cover,
                alignment: Alignment.bottomCenter,
                repeat: ImageRepeat.noRepeat
            ),
          ),
          padding: const EdgeInsets.all(15),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
              ),
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
              child: Form(
                key: controller.formKey,
                child: Wrap(
                  // spacing: 10,
                  runSpacing: 10,
                  alignment: WrapAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/Logo.png',
                      scale: 2.5,
                    ),
                    TextFormField(
                      controller: controller.firstname,
                      decoration: InputDecoration(
                          hintText: "enter_fristname".tr,
                          labelText: "firstname".tr,
                          prefixIcon: Icon(
                            Icons.person,
                            color: AppColors.primaryColor,
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.primaryColor,
                                  style: BorderStyle.solid

                              ),
                              borderRadius: BorderRadius.circular(50))),
                      validator: (value){
                        if (value == null || value.isEmpty){
                          return "required_firstname".tr;
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: controller.lastname,
                      decoration: InputDecoration(
                          hintText: "enter_lastname".tr,
                          labelText: "lastname".tr,
                          prefixIcon: Icon(
                            Icons.person,
                            color: AppColors.primaryColor,
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.primaryColor,
                              ),
                              borderRadius: BorderRadius.circular(50))),
                      validator: (value){
                        if (value == null || value.isEmpty){
                          return "required_lastname".tr;
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: controller.email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: "enter_address".tr,
                          labelText: "email".tr,
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: AppColors.primaryColor,
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.primaryColor,
                              ),
                              borderRadius: BorderRadius.circular(50))),
                      validator: (value){
                        if (value == null || value.isEmpty){
                          return "required_email".tr;
                        }else if(!emailValidate(value)){
                          return "Email is not valid";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: controller.password,
                      obscureText: controller.passwordObscure.value,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: "enter_password".tr,
                          labelText: "password".tr,
                          prefixIcon: Icon(
                            Icons.lock_outline_rounded,
                            color: AppColors.primaryColor,
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                controller.setPasswordObscure();
                              },
                              icon: Icon(Icons.remove_red_eye_outlined)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.primaryColor,
                              ),
                              borderRadius: BorderRadius.circular(50))),
                      validator: (value){
                        if (value == null || value.isEmpty){
                          return "required_password".tr;
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      obscureText: controller.confirmObscure.value,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: "enter_confirmpassword".tr,
                          labelText: "confirmpassword".tr,
                          prefixIcon: Icon(
                            Icons.lock_outline_rounded,
                            color: AppColors.primaryColor,
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                controller.setConfirmObscure();
                              },
                              icon: Icon(Icons.remove_red_eye_outlined)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.primaryColor,
                              ),
                              borderRadius: BorderRadius.circular(50))),
                      validator: (value){
                        if (value == null || value.isEmpty){
                          return "required_confirmpassword".tr;
                        }else if(value != controller.password.text){
                          return "Confirm password is not match";
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
                          if (controller.formKey.currentState!.validate()){
                            await controller.createAccount();
                          }
                        },
                        child: Text("signup".tr, style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                    ),
                    controller.errorStr.value != null ? Text(controller.errorStr.value, style: TextStyle(color: Colors.red),) : SizedBox(),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("have_account".tr),
                        TextButton(onPressed: () {
                          Get.offAllNamed(Routes.SIGNIN);
                        }, child: Text("signin".tr,style: TextStyle(color: AppColors.primaryColor),)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
bool emailValidate(String value){
  final result = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(value);
  print(result);
  if (result){
    return true;
  }
  return false;
}