import 'dart:math';

import 'package:flutter/material.dart';

class AppLayout {
  AppLayout._();

  static Size screen(BuildContext context) {
    return MediaQuery.sizeOf(context);
  }

  static double width(BuildContext context) {
    return screen(context).width;
  }

  static double height(BuildContext context) {
    return screen(context).height;
  }

  static bool isTablet(BuildContext context) {
    return width(context) >= 700;
  }

  static double scale(BuildContext context) {
    final w = width(context);

    return min(
      max(w / 390.0, 0.85),
      1.35,
    );
  }

  static double spacing(
      BuildContext context,
      double value,
      ) {
    return value * scale(context);
  }

  static double font(
      BuildContext context,
      double size,
      ) {
    return size * scale(context);
  }

  static double icon(
      BuildContext context,
      double size,
      ) {
    return size * scale(context);
  }
}