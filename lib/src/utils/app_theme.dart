import 'package:flutter/material.dart';

class AppTheme {
  static Color primaryColor = Color(Colors.blue[400]!.value);

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
    ),
  );

  static ThemeData lightTheme = ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
    ),
  );

  static ThemeData getTheme({bool isDark = true}) {
    return isDark ? darkTheme : lightTheme;
  }
}
