import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:obs/app/constants/appLocale.dart';
import 'package:obs/app/constants/app_constant.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  await GetStorage.init();
  var language = GetStorage().read('lang');
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      //localization
      translations: Messages(),
      locale: language == 'kh' ? Locale('kh', 'KM') : Locale('en', 'US'),
      fallbackLocale: Locale('en', 'US'),
      theme: ThemeData(
          fontFamily:
              language == 'kh' ? AppFonts.khmerFont : AppFonts.englishFont),
    ),
  );
}
