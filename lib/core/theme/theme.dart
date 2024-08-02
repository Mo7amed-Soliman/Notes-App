import 'package:flutter/material.dart';
import 'package:notes_app/core/helper/utils/constants.dart';

ThemeData getDarkTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: kprimaryColor,
    scaffoldBackgroundColor: backgroundColor,
    fontFamily: 'Poppins',
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: kprimaryColor,
      foregroundColor: Colors.black,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: InputBorder.none,
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
    ),
  );
}
