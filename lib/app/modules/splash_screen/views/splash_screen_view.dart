import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:obs/app/constants/app_constant.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: Get.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primaryColor.withOpacity(0.7),
              AppColors.primaryColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: 0,
              child: Image.asset(
                "assets/images/b-app.png",
                width: Get.width,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/Logo.png",
                  width: Get.width * 0.7,
                ),
                CircularProgressIndicator.adaptive(
                  valueColor: AlwaysStoppedAnimation(
                    Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
