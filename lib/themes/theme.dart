import 'package:flutter/material.dart';
import 'package:project_management/constants/assets.dart';

/// all custom application theme
const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF262837),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFEADDFF),
  onPrimaryContainer: Color(0xFF21005D),
  secondary: Color(0xFF625B71),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFE8DEF8),
  onSecondaryContainer: Color(0xFF1D192B),
  tertiary: Color(0xFF7D5260),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFFFD8E4),
  onTertiaryContainer: Color(0xFF31111D),
  error: Color(0xFFB3261E),
  onError: Color(0xFFFFFFFF),
  errorContainer: Color(0xFFF9DEDC),
  onErrorContainer: Color(0xFF410E0B),
  outline: Color(0xFF79747E),
  background: Color(0xFFFFFBFE),
  onBackground: Color(0xFF1C1B1F),
  surface: Color(0xFFFFFBFE),
  onSurface: Color(0xFF1C1B1F),
  surfaceVariant: Color(0xFFE7E0EC),
  onSurfaceVariant: Color(0xFF49454F),
  inverseSurface: Color(0xFF313033),
  onInverseSurface: Color(0xFFF4EFF4),
  inversePrimary: Color(0xFFD0BCFF),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF936BFF),
  outlineVariant: Color(0xFF2f2f4b),
  scrim: Color(0xFF000000),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFD0BCFF),
  onPrimary: Color(0xFF381E72),
  primaryContainer: Color(0xFF4F378B),
  onPrimaryContainer: Color(0xFFEADDFF),
  secondary: Color(0xFFCCC2DC),
  onSecondary: Color(0xFF332D41),
  secondaryContainer: Color(0xFF4A4458),
  onSecondaryContainer: Color(0xFFE8DEF8),
  tertiary: Color(0xFFEFB8C8),
  onTertiary: Color(0xFF492532),
  tertiaryContainer: Color(0xFF633B48),
  onTertiaryContainer: Color(0xFFFFD8E4),
  error: Color(0xFFF2B8B5),
  onError: Color(0xFF601410),
  errorContainer: Color(0xFF8C1D18),
  onErrorContainer: Color(0xFFF9DEDC),
  outline: Color(0xFF938F99),
  background: Color(0xFF1C1B1F),
  onBackground: Color(0xFFE6E1E5),
  surface: Color(0xFF1C1B1F),
  onSurface: Color(0xFFE6E1E5),
  surfaceVariant: Color(0xFF49454F),
  onSurfaceVariant: Color(0xFFCAC4D0),
  inverseSurface: Color(0xFFE6E1E5),
  onInverseSurface: Color(0xFF313033),
  inversePrimary: Color(0xFF6750A4),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFD0BCFF),
  outlineVariant: Color(0xFF49454F),
  scrim: Color(0xFF000000),
);

class AppTheme {
  /// default application theme
  // static ThemeData get dark => ThemeData(
  //       fontFamily: Font.poppins,
  //       primaryColorDark: const Color.fromRGBO(111, 88, 255, 1),
  //       primaryColor: const Color.fromRGBO(128, 109, 255, 1),
  //       primaryColorLight: const Color.fromRGBO(159, 84, 252, 1),
  //       brightness: Brightness.dark,
  //       primarySwatch: Colors.deepPurple,
  //       elevatedButtonTheme: ElevatedButtonThemeData(
  //           style: ElevatedButton.styleFrom(
  //         backgroundColor: const Color.fromRGBO(128, 109, 255, 1),
  //       ).merge(
  //         ButtonStyle(elevation: MaterialStateProperty.all(0)),
  //       )),
  //       canvasColor: const Color.fromRGBO(31, 29, 44, 1),
  //       cardColor: const Color.fromRGBO(38, 40, 55, 1),
  //     );
  // static ThemeData get light => ThemeData(
  //       fontFamily: Font.poppins,
  //       primaryColorDark: const Color.fromRGBO(111, 88, 255, 1),
  //       primaryColor: Colors.deepPurple,
  //       primaryColorLight: const Color.fromRGBO(159, 84, 252, 1),
  //       brightness: Brightness.dark,
  //       primarySwatch: Colors.deepPurple,
  //       elevatedButtonTheme: ElevatedButtonThemeData(
  //           style: ElevatedButton.styleFrom(
  //         backgroundColor: const Color.fromRGBO(128, 109, 255, 1),
  //       ).merge(
  //         ButtonStyle(elevation: MaterialStateProperty.all(0)),
  //       )),
  //       canvasColor: const Color.fromRGBO(255, 255, 255, 1.0),
  //       cardColor: const Color.fromRGBO(232, 227, 226, 1.0),
  //     );
  static ThemeData get light => ThemeData(
      fontFamily: Font.poppins,
      useMaterial3: true,
      colorScheme: lightColorScheme);
  static ThemeData get dark => ThemeData(
      fontFamily: Font.poppins,
      useMaterial3: true,
      colorScheme: darkColorScheme);

// you can add other custom theme in this class like  light theme, dark theme ,etc.

// example :
// static ThemeData get light => ThemeData();

// static ThemeData get dark => ThemeData();
}
