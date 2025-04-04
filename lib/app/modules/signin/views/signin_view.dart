import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:obs/app/modules/forgot/views/forgot_view.dart';
import 'package:obs/app/routes/app_pages.dart';

import '../../../constants/app_constant.dart';
import '../controllers/signin_controller.dart';

class SigninView extends GetView<SigninController> {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _email = TextEditingController();
    final _password = TextEditingController();
    return GetBuilder<SigninController>(
        init: SigninController(),
        builder: (controller){
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
                key: _formKey,
                child: Wrap(
                  runSpacing: 10,
                  alignment: WrapAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/Logo.png',
                      scale: 2.5,
                    ),
                    TextFormField(
                      controller: _email,
                      cursorHeight: 20,
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
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email is required";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _password,
                      cursorHeight: 20,
                      obscureText: controller.isSecure.value,
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
                              controller.isSecure.value = !controller.isSecure.value;
                            },
                            icon: Icon(Icons.remove_red_eye_outlined)),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      validator: (value){
                        if (value == null || value.isEmpty){
                          return "Password is required";
                        }
                        return null;
                      },
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.FORGOT);
                        },
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(color: AppColors.primaryColor),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
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
                        onPressed: ()  {
                          if (_formKey.currentState!.validate()){

                            controller.login(_email.text, _password.text);
                              _formKey.currentState!.reset();
                          }
                        },
                        child: controller.isLoading.value ? Transform.scale(scale: 0.2, child: CircularProgressIndicator(),) : Text(
                          "Sign In",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?"),
                        TextButton(
                            onPressed: () {
                              Get.offAllNamed(Routes.SIGNUP);
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(color: AppColors.primaryColor),
                            )),
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
