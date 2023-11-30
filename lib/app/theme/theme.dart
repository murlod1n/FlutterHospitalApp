import "package:flutter/material.dart";

abstract class AppTheme {
  static ThemeData get light {
    return ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme(),
        fontFamily: "Inter",
        textTheme: _textTheme(),);
  }
}

ColorScheme lightColorScheme() {
  return const ColorScheme(
      primary: Color(0xFFFF0066),
      onPrimary: Colors.white,
      outline: Color(0xFFFF0066),
      secondary: Color(0xFFFF5999),
      secondaryContainer: Color(0xFFFF0066),
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      background: Color(0xFFF8F8F8),
      onBackground: Color(0xFF282F41),
      surface: Colors.white,
      onSurface: Color(0xFF282F41),
      brightness: Brightness.light);
}

TextTheme _textTheme() {
  return const TextTheme(
      labelLarge: TextStyle(
        color: Color(0xFF282F41),
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
      labelMedium: TextStyle(
        color: Color(0xFF7C8085),
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        color: Color(0xFF282F41),
        fontSize: 16,
        fontWeight: FontWeight.w300,
      ),
      titleSmall: TextStyle(
          color: Color(0xFF7D8186), fontSize: 14, fontWeight: FontWeight.w300));
}
