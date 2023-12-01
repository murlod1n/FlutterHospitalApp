import "package:flutter/material.dart";

import "color_scheme.dart";
import "text_theme.dart";


abstract class AppTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      colorScheme: lightColorScheme(),
      fontFamily: "Inter",
      textTheme: textTheme()
    );
  }
}
