import 'package:flutter/material.dart';

class CoinRewardCard extends StatelessWidget {
  final int coins;

  const CoinRewardCard({
    super.key,
    required this.coins,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'COINS EARNED',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.5,
          ),
        ),

        const SizedBox(height: 8),

        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.monetization_on,
              color: Color(0xFFFFC247),
              size: 30,
            ),

            const SizedBox(width: 8),

            Text(
              '$coins',
              style: const TextStyle(
                color: Color(0xFFFFC247),
                fontSize: 34,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ],
    );
  }
}