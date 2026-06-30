import 'package:flutter/material.dart';

class AchievementModel {
  final String id;
  final String title;
  final String description;
  final IconData icon;

  final int target;
  final int progress;

  final bool unlocked;

  const AchievementModel({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.target,
    required this.progress,
    required this.unlocked,
  });

  double get progressPercent {
    if (target == 0) return 0;

    final value = progress / target;

    if (value > 1) {
      return 1;
    }

    return value;
  }
}