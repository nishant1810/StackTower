import 'package:flutter/material.dart';

class ComboCard extends StatelessWidget {
  const ComboCard({
    super.key,
    required this.combo,
  });

  final int combo;

  Color get comboColor {
    if (combo >= 30) return const Color(0xFFFFD700); // Gold
    if (combo >= 20) return const Color(0xFFCE93D8); // Soft Purple
    if (combo >= 10) return const Color(0xFFFFB74D); // Amber
    if (combo >= 5) return const Color(0xFFFFCC80); // Light Amber
    return const Color(0xFFFFE0B2); // Warm Cream
  }

  String get comboTitle {
    if (combo >= 30) return 'LEGEND';
    if (combo >= 20) return 'UNSTOPPABLE';
    if (combo >= 10) return 'AMAZING';
    if (combo >= 5) return 'GREAT';
    return 'COMBO';
  }

  @override
  Widget build(BuildContext context) {
    final color = comboColor;

    return Container(
      height: 68,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.18),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: color.withOpacity(0.5),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.15),
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            comboTitle,
            style: TextStyle(
              color: color,
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.5,
            ),
          ),

          const SizedBox(height: 1),

          Text(
            'x$combo',
            style: TextStyle(
              color: color,
              fontSize: 24,
              fontWeight: FontWeight.w900,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}