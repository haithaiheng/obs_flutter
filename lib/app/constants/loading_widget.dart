import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:obs/app/Controllers/MainController.dart';

import '../modules/users/controllers/users_controller.dart';
import 'app_constant.dart'; // Assuming GetX for state management

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({super.key});

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  final _mainController = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: _mainController.isDarkMode.value
              ? AppColors.darkcardColor
              : AppColors.lightcardColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/loading.gif',
                width: 100,
              ),
              Text(
                "សូមរងចាំ...", // Khmer text for "Please wait..."
                style: TextStyle(
                  fontFamily: AppFonts.khmerFont,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: _mainController.isDarkMode.value
                      ? AppColors.lightcardColor
                      : AppColors.darkcardColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
