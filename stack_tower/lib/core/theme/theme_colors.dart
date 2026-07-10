import 'package:flutter/material.dart';

import '../../features/themes/data/theme_catalog.dart';

class ThemeColors {
  ThemeColors._();

  static List<Color> get(String themeId) {
    return ThemeCatalog.getPalette(themeId);
  }

  static Color primary(String themeId) {
    return get(themeId).first;
  }

  static Color secondary(String themeId) {
    return get(themeId).last;
  }

  static LinearGradient gradient(String themeId) {
    final colors = get(themeId);

    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: colors,
    );
  }

  static BoxShadow glow(
      String themeId, {
        double blur = 24,
        double opacity = 0.5,
      }) {
    return BoxShadow(
      color: primary(themeId).withOpacity(opacity),
      blurRadius: blur,
      spreadRadius: 2,
    );
  }
}