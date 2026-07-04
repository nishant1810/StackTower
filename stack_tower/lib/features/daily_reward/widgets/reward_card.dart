import 'package:flutter/material.dart';
import 'package:stack_tower/core/assets/app_assets.dart';

import '../models/daily_reward.dart';

class RewardCard extends StatelessWidget {
  final DailyReward reward;
  final bool isClaimed;
  final bool isCurrent;

  const RewardCard({
    super.key,
    required this.reward,
    required this.isClaimed,
    required this.isCurrent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 4,
              vertical: 4,
            ),
            child: Column(
              children: [
                Text(
                  'DAY ${reward.day}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.8,
                  ),
                ),

                const Spacer(),

                Transform.scale(
                  scale: 1.35,
                  child: Image.asset(
                    _assetPath(),
                    height: 42,
                    fit: BoxFit.contain,
                  ),
                ),

                const Spacer(),

                Text(
                  reward.amount.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
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
                  color: Colors.black.withOpacity(0.20),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Center(
                  child: Image.asset(
                    AppAssets.claimedBadge,
                    width: 56,
                    height: 56,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  String _assetPath() {
    switch (reward.type) {
      case RewardType.coins:
        return AppAssets.coinIcon;

      case RewardType.crystalPurple:
        return AppAssets.crystalPurple;

      case RewardType.crystalBlue:
        return AppAssets.crystalBlue;

      case RewardType.chest:
        return AppAssets.rewardChest;
    }
  }
}