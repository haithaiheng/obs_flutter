// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:obs/app/constants/app_constant.dart';

class CustomTheme{
  static final String _storage = GetStorage().read("lang");
  static String font = _storage == 'en' ? "Poppins" : "KantumruyPro";

  ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.thirdColor,
    fontFamily: font,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.thirdColor,
      selectedItemColor: AppColors.secondaryColor,
      unselectedItemColor: AppColors.primaryColor,
    ),
    primaryIconTheme: IconThemeData(
      color: AppColors.primaryColor,
      size: 18,
    ),
    iconTheme: IconThemeData(
      color: AppColors.priceColor,
      size: 18,
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: AppColors.thirdColor,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: AppColors.priceColor,
        )),
    dialogBackgroundColor: AppColors.darkcardColor,
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.darkcardColor,
    ),
    // cardTheme: CardTheme(
    //   color: AppColors.darkcardColor,
    // ),
    primaryColor: AppColors.priceColor,
    primaryTextTheme: TextTheme(
      labelLarge: TextStyle(
        fontSize: 24,
        color: AppColors.priceColor,
        fontWeight: FontWeight.w700,
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
          fontSize: 24,
          color: AppColors.secondaryColor,
          fontWeight: FontWeight.w900),
      headlineMedium: TextStyle(
          fontSize: 20,
          color: AppColors.secondaryColor,
          fontWeight: FontWeight.w700),
      headlineSmall: TextStyle(
          fontSize: 18,
          color: AppColors.secondaryColor,
          fontWeight: FontWeight.w700),
      //label for dialog
      labelLarge: TextStyle(
        fontSize: 14,
        color: AppColors.secondaryColor,
      ),
      labelMedium: TextStyle(
        fontSize: 14,
        color: AppColors.secondaryColor,
      ),
      labelSmall: TextStyle(
        fontSize: 12,
        color: AppColors.secondaryColor,
      ),
    ),
  );

  ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.secondaryColor,
    fontFamily: font,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.secondaryColor,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.secondaryColor,
    ),
    primaryIconTheme: IconThemeData(
      color: AppColors.primaryColor,
      size: 18,
    ),
    iconTheme: IconThemeData(
      color: AppColors.primaryColor,
      size: 18,
    ),
    appBarTheme: AppBarTheme(backgroundColor: AppColors.secondaryColor),
    dialogBackgroundColor: AppColors.secondaryColor,
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.secondaryColor,
    ),
    // cardTheme: CardTheme(
    //   color: AppColors.lightcardColor,
    // ),
    primaryColor: AppColors.lightcardColor,
    primaryTextTheme: TextTheme(
      labelLarge: TextStyle(
        fontSize: 24,
        color: AppColors.primaryColor,
        fontWeight: FontWeight.w700,
      ),
    ),
    textTheme: TextTheme(
      //title of each screen
      headlineLarge: TextStyle(
          fontSize: 24, color: AppColors.thirdColor, fontWeight: FontWeight.w900),
      headlineMedium: TextStyle(
          fontSize: 20, color: AppColors.thirdColor, fontWeight: FontWeight.w700),
      //for button label
      headlineSmall: TextStyle(
          fontSize: 18,
          color: AppColors.secondaryColor,
          fontWeight: FontWeight.w700),
      //label for dialog
      labelLarge: TextStyle(
        fontSize: 14,
        color: AppColors.thirdColor,
      ),
      labelMedium: TextStyle(
        fontSize: 14,
        color: AppColors.thirdColor,
      ),
      labelSmall: TextStyle(
        fontSize: 12,
        color: AppColors.thirdColor,
      ),
    ),
  );
}
