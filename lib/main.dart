import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:obs/app/constants/appLocale.dart';
import 'package:obs/app/constants/appMode.dart';
import 'package:obs/app/constants/app_constant.dart';
import 'package:obs/app/modules/users/controllers/users_controller.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(
    GetBuilder<UsersController>(
      init: UsersController(),
      builder: (controller) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Application",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        //localization
        translations: Messages(),
        locale: controller.lang.value == 'kh'
            ? Locale('kh', 'KM')
            : Locale('en', 'US'),
        fallbackLocale: Locale('en', 'US'),
        theme: controller.isDarkmode.value ? darkTheme : lightTheme,
      ),
    ),
  );
}
