import 'package:flutter/material.dart';

class BestScoreCard extends StatelessWidget {
  final int bestScore;

  const BestScoreCard({
    super.key,
    required this.bestScore,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 70,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF10244B),
            Color(0xFF081528),
          ],
        ),
        border: Border.all(
          color: const Color(0xFF4CAFFF),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'BEST SCORE',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 11,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            bestScore.toString(),
            style: const TextStyle(
              color: Color(0xFFD9F2FF),
              fontSize: 26,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}