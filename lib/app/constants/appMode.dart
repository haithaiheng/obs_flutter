import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:obs/app/constants/app_constant.dart';

String _fontFamily =
    GetStorage().read('lang') == 'kh' ? "KantumruyPro" : "Poppins";

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.thirdColor,
  fontFamily: _fontFamily,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: AppColors.thirdColor,
    selectedItemColor: AppColors.secondaryColor,
    unselectedItemColor: AppColors.primaryColor,
  ),
  iconTheme: IconThemeData(
    color: AppColors.priceColor,
    size: 18,
  ),
  dialogTheme: DialogThemeData(
    backgroundColor: AppColors.darkcardColor,
  ),
  cardTheme: CardTheme(
    color: AppColors.darkcardColor,
  ),
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
    labelMedium: TextStyle(
      fontSize: 16,
      color: AppColors.secondaryColor,
    ),
    labelSmall: TextStyle(
      fontSize: 14,
      color: AppColors.secondaryColor,
    ),
  ),
);

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.secondaryColor,
  fontFamily: _fontFamily,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: AppColors.secondaryColor,
    selectedItemColor: AppColors.primaryColor,
    unselectedItemColor: AppColors.secondaryColor,
  ),
  iconTheme: IconThemeData(
    color: AppColors.primaryColor,
    size: 18,
  ),
  dialogTheme: DialogThemeData(
    backgroundColor: AppColors.secondaryColor,
  ),
  cardTheme: CardTheme(
    color: AppColors.lightcardColor,
  ),
  primaryColor: AppColors.lightcardColor,
  primaryTextTheme: TextTheme(
    labelLarge: TextStyle(
      fontSize: 24,
      color: AppColors.primaryColor,
      fontWeight: FontWeight.w700,
    ),
  ),
  textTheme: TextTheme(
    headlineLarge: TextStyle(
        fontSize: 24, color: AppColors.thirdColor, fontWeight: FontWeight.w900),
    headlineMedium: TextStyle(
        fontSize: 20, color: AppColors.thirdColor, fontWeight: FontWeight.w700),
    headlineSmall: TextStyle(
        fontSize: 18,
        color: AppColors.secondaryColor,
        fontWeight: FontWeight.w700),
    labelMedium: TextStyle(
      fontSize: 16,
      color: AppColors.secondaryColor,
    ),
  ),
);
