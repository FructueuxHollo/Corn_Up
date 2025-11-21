import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final Color primary = Colors.green.shade700;

  static final ThemeData lightTheme = ThemeData(
    primaryColor: primary,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(centerTitle: true),
  );
}
