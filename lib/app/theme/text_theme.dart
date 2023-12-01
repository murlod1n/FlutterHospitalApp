import "package:flutter/material.dart";

TextTheme textTheme() {
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
      labelSmall: TextStyle(
        color: Color(0xFF7D8186),
        fontSize: 10,
        fontWeight: FontWeight.w300,
      ),
      titleMedium: TextStyle(
        color: Color(0xFF282F41),
        fontSize: 16,
        fontWeight: FontWeight.w300,
      ),
      titleSmall: TextStyle(
          color: Color(0xFF7D8186),
          fontSize: 14,
          fontWeight: FontWeight.w300
      )
  );
}