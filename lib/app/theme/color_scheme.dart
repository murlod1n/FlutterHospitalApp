import "package:flutter/material.dart";

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
      brightness: Brightness.light
  );
}