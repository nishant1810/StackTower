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
      decoration: isCurrent
          ? BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFFFC857),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFFC857)
                .withOpacity(0.35),
            blurRadius: 16,
            spreadRadius: 1,
          ),
        ],
      )
          : null,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 4,
              vertical: 4,
            ),
            child: Column(
              mainAxisAlignment:
              MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'DAY ${reward.day}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.8,
                  ),
                ),

                Image.asset(
                  _assetPath(),
                  height: 42,
                  fit: BoxFit.contain,
                ),

                Text(
                  reward.amount.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
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
                  color: Colors.black.withOpacity(0.25),
                  borderRadius:
                  BorderRadius.circular(18),
                ),
                child: Center(
                  child: Image.asset(
                    AppAssets.claimedBadge,
                    width: 56,
                    height: 56,
                    fit: BoxFit.contain,
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