import 'package:flutter/material.dart';

class Responsive {
  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double w(
      BuildContext context,
      double percent,
      ) {
    return screenWidth(context) * percent;
  }

  static double h(
      BuildContext context,
      double percent,
      ) {
    return screenHeight(context) * percent;
  }

  static double sp(
      BuildContext context,
      double size,
      ) {
    final width = screenWidth(context);

    return size * (width / 390);
  }
}