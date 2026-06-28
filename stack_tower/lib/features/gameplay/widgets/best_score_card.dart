import 'package:flutter/material.dart';

class BestScoreCard extends StatelessWidget {
  const BestScoreCard({
    super.key,
    required this.bestScore,
  });

  final int bestScore;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 88,
      left: 16,
      child: Container(
        width: 150,
        height: 60,
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.4),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: Colors.purpleAccent,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.purpleAccent.withOpacity(0.35),
              blurRadius: 16,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          children: [
            const Icon(
              Icons.workspace_premium,
              color: Colors.amber,
              size: 24,
            ),

            const SizedBox(width: 10),

            Expanded(
              child: Text(
                _formatScore(bestScore),
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatScore(int value) {
    return value.toString().replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'),
          (match) => ',',
    );
  }
}