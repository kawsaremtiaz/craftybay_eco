import 'package:flutter/material.dart';
import 'colors.dart';

class CraftyBayAppThemeData {
  static ThemeData lightThemeData = ThemeData(
    primarySwatch: MaterialColor(
      CraftyBayAppColors.primaryColor.value,
      CraftyBayAppColors.craftyBayColor,
    ),
    primaryColor: CraftyBayAppColors.primaryColor,

    // Progress indicator loader style
    progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: CraftyBayAppColors.primaryColor),

    // Title and body text style
    textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: TextStyle(fontSize: 14)),

    // Input decoration field style
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(color: Colors.black38),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: CraftyBayAppColors.primaryColor)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CraftyBayAppColors.primaryColor)),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CraftyBayAppColors.primaryColor)),
      errorBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
    ),

    // Elevated button style
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          backgroundColor: CraftyBayAppColors.primaryColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 14),
          textStyle: const TextStyle(letterSpacing: 0.5)),
    ),
    // Text button style
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: CraftyBayAppColors.primaryColor
      )
    ),
    // appbar Style
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(fontSize: 18, color: Colors.black),
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 5
    )
  );
}
