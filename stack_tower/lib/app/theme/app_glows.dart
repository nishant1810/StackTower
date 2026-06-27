import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppGlows {
  static List<BoxShadow> blue = [
    BoxShadow(
      color: AppColors.neonBlue.withValues(alpha: .45),
      blurRadius: 25,
      spreadRadius: 2,
    ),
  ];

  static List<BoxShadow> purple = [
    BoxShadow(
      color: AppColors.neonPurple.withValues(alpha: .45),
      blurRadius: 25,
      spreadRadius: 2,
    ),
  ];

  static List<BoxShadow> gold = [
    BoxShadow(
      color: AppColors.cyberGold.withValues(alpha: .40),
      blurRadius: 25,
      spreadRadius: 2,
    ),
  ];
}