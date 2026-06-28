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
        color: Colors.transparent,
        border: Border.all(
          color: const Color(0xFFFFC857),
          width: 3,
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              8,
              4,
              8,
              6,
            ),
            child: Column(
              children: [
                const Text(
                  'DAY 7',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1,
                  ),
                ),

                const SizedBox(height: 2),

                Expanded(
                  flex: 6,
                  child: Center(
                    child: Transform.scale(
                      scale: 1.8,
                      child: Image.asset(
                        AppAssets.rewardChest,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),

                Text(
                  reward.amount.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                ),

                const SizedBox(height: 2),
              ],
            ),
          ),

          if (isClaimed)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.35),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Center(
                  child: Image.asset(
                    AppAssets.claimedBadge,
                    width: 90,
                    height: 90,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}