import 'package:flutter/material.dart';

class BestScoreDisplay
    extends StatelessWidget {
  final int bestScore;

  const BestScoreDisplay({
    super.key,
    required this.bestScore,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'BEST SCORE',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 18,
            letterSpacing: 2,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 8),

        Text(
          bestScore.toString(),
          style: const TextStyle(
            color: Color(0xFFB7E7FF),
            fontSize: 38,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}