import 'package:flutter/material.dart';

class LevelProgressBar extends StatelessWidget {
  final double progress;

  const LevelProgressBar({
    super.key,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: LinearProgressIndicator(
        value: progress,
        minHeight: 12,
      ),
    );
  }
}