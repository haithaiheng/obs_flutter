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
                          hintText: "enter first name",
                          labelText: "First name",
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
                          return "First Name is required";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: controller.lastname,
                      decoration: InputDecoration(
                          hintText: "enter last name",
                          labelText: "Last name",
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
                          return "Last Name is required";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: controller.email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: "enter email address",
                          labelText: "Email",
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
                          return "Email is required";
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
                          hintText: "enter password",
                          labelText: "Password",
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
                          return "Password is required";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      obscureText: controller.confirmObscure.value,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: "enter confirm password",
                          labelText: "Confirm Password",
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
                          return "Confirm password is required";
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
                        onPressed: () {
                          if (controller.formKey.currentState!.validate()){
                            controller.createAccount();
                          }
                        },
                        child: Text("SING UP", style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                    ),
                    controller.errorStr.value != null ? Text(controller.errorStr.value, style: TextStyle(color: Colors.red),) : SizedBox(),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Do you have an account?"),
                        TextButton(onPressed: () {
                          Get.offAllNamed(Routes.SIGNIN);
                        }, child: Text("Sign In",style: TextStyle(color: AppColors.primaryColor),)),
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