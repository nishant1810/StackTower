import 'package:flutter/material.dart';
import 'package:stack_tower/core/assets/app_assets.dart';

import '../models/daily_reward.dart';

class FeaturedRewardCard extends StatelessWidget {
  final DailyReward reward;
  final bool isClaimed;
  final bool isCurrent;

  const FeaturedRewardCard({
    super.key,
    required this.reward,
    required this.isClaimed,
    required this.isCurrent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: const Color(0xFFFFC857),
          width: isCurrent ? 4 : 3,
        ),
        boxShadow: isCurrent
            ? [
          BoxShadow(
            color: const Color(0xFFFFC857)
                .withOpacity(0.35),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ]
            : null,
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              8,
              8,
              8,
              8,
            ),
            child: Column(
              children: [
                Text(
                  'DAY ${reward.day}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1,
                  ),
                ),

                const SizedBox(height: 8),

                Expanded(
                  child: Center(
                    child: Transform.scale(
                      scale: 1.7,
                      child: Image.asset(
                        AppAssets.rewardChest,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  reward.amount.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),

          if (isClaimed)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.30),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Center(
                  child: Image.asset(
                    AppAssets.claimedBadge,
                    width: 90,
                    height: 90,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}