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

          const SizedBox(height: 12),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.monetization_on,
                color: Color(0xFFFFC247),
                size: 32,
              ),

              const SizedBox(width: 8),

              Text(
                '$coins',
                style: const TextStyle(
                  color: Color(0xFFFFC247),
                  fontSize: 38,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: rewardClaimed
                  ? Colors.green.withOpacity(0.15)
                  : const Color(0xFFFFC247)
                  .withOpacity(0.15),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              rewardClaimed
                  ? '✓ BONUS CLAIMED'
                  : 'WATCH AD FOR +$coins BONUS COINS',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: rewardClaimed
                    ? Colors.greenAccent
                    : const Color(0xFFFFC247),
                fontSize: 12,
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}