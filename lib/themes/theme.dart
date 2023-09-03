import 'package:flutter/material.dart';
import 'package:project_management/constants/assets.dart';

TextTheme textTheme = TextTheme(
  displayLarge:
      TextStyle(fontSize: 93, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  displayMedium:
      TextStyle(fontSize: 58, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  displaySmall: TextStyle(fontSize: 47, fontWeight: FontWeight.w400),
  headlineMedium:
      TextStyle(fontSize: 33, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  headlineSmall: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),
  titleLarge:
      TextStyle(fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  titleMedium:
      TextStyle(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
  titleSmall:
      TextStyle(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  bodyLarge:
      TextStyle(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyMedium:
      TextStyle(fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  labelLarge:
      TextStyle(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
  bodySmall:
      TextStyle(fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  labelSmall:
      TextStyle(fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);

class AppTheme {
  Color mainColor;
  AppTheme({required this.mainColor});

  ThemeData get light => ThemeData(
      fontFamily: Font.poppins,
      textTheme: textTheme,
      useMaterial3: true,
      colorSchemeSeed: mainColor,
      brightness: Brightness.light);
  ThemeData get dark => ThemeData(
      fontFamily: Font.poppins,
      textTheme: textTheme,
      useMaterial3: true,
      brightness: Brightness.dark,
      colorSchemeSeed: mainColor);
}
