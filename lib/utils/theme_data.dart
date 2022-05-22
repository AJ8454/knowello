import 'package:flutter/material.dart';

class MyTheme {
  static final lightTheme = ThemeData(
    primaryColor: Colors.red,
    fontFamily: 'PoppinsRegular',
    scaffoldBackgroundColor: const Color(0xFF000000),
    progressIndicatorTheme: const ProgressIndicatorThemeData(color: Colors.red),
    appBarTheme: const AppBarTheme(backgroundColor: Color(0xFFA83242)),
  );
}
