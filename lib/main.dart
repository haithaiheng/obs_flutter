import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:obs/app/constants/appLocale.dart';

import 'app/Controllers/MainController.dart';
import 'app/constants/appMode.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  await GetStorage.init();
  final controller = Get.put(MainController(), permanent: true);
  runApp(
    Obx(() => GetMaterialApp(
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
          theme: controller.isDarkMode.value
              ? CustomTheme().darkTheme
              : CustomTheme().lightTheme,
          darkTheme: CustomTheme().darkTheme,
        )),
  );
}
