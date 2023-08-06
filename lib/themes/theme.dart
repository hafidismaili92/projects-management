import 'package:flutter/material.dart';
import 'package:project_management/constants/assets.dart';

class AppTheme {
  Color mainColor;
  AppTheme({required this.mainColor});
  /*static ThemeData get mainTheme => ThemeData(
      fontFamily: Font.poppins,
      useMaterial3: true,
      colorSchemeSeed: kAppColorSeeds["red"],
      scrollbarTheme: ScrollbarThemeData(
        thumbVisibility: MaterialStateProperty.all<bool>(true),
      ));*/
  ThemeData get light => ThemeData(
      fontFamily: Font.poppins,
      useMaterial3: true,
      colorSchemeSeed: mainColor,
      brightness: Brightness.light);
  ThemeData get dark => ThemeData(
      fontFamily: Font.poppins,
      useMaterial3: true,
      brightness: Brightness.dark,
      colorSchemeSeed: mainColor);
}
