import 'package:flutter/material.dart';

class CoinRewardCard extends StatelessWidget {
  final int coins;
  final bool rewardClaimed;

  const CoinRewardCard({
    super.key,
    required this.coins,
    this.rewardClaimed = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
        ),
      ),
      child: Column(
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
                size: 42,
              ),

              const SizedBox(width: 8),

              Text(
                '$coins',
                style: const TextStyle(
                  color: Color(0xFFFFC247),
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}