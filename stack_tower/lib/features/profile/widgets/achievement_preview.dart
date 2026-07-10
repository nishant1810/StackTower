import 'package:flutter/material.dart';

class AchievementPreview extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool unlocked;

  const AchievementPreview({
    super.key,
    required this.title,
    required this.icon,
    required this.unlocked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: unlocked
            ? Colors.amber.withOpacity(.15)
            : Colors.white.withOpacity(.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: unlocked
              ? Colors.amber
              : Colors.white10,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 32,
            color: unlocked
                ? Colors.amber
                : Colors.grey,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}