import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: const Color(0xFF2E7D32),
      colorScheme: const ColorScheme.light(
        primary: Color(0xFF2E7D32),
        secondary: Color(0xFFF9A825),
        background: Color(0xFFF5F5F5),
      ),
      fontFamily: 'Roboto',
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF2E7D32),
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xFF2E7D32),
        foregroundColor: Colors.white,
      ),
    );
  }
}