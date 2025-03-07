import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:obs/app/constants/appLocale.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      //localization
      translations: Messages(),
      locale: Locale('en', 'US'),
      fallbackLocale: Locale('en', 'US'),
      theme: ThemeData(
          fontFamily:
              Get.locale == Locale('kh', 'KM') ? "KantumruyPro" : "Poppins"),
    ),
  );
}
