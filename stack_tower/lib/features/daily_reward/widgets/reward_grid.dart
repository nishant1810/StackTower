import 'package:flutter/material.dart';

import '../models/daily_reward.dart';
import 'featured_reward_card.dart';
import 'reward_card.dart';

class RewardGrid extends StatelessWidget {
  final List<DailyReward> rewards;
  final int currentDay;
  final bool canClaim;

  const RewardGrid({
    super.key,
    required this.rewards,
    required this.currentDay,
    required this.canClaim,
  });

  bool _isClaimed(int day) => day < currentDay;

  bool _isCurrent(int day) =>
      day == currentDay && canClaim;

  Widget _buildRewardCard(int index) {
    return RewardCard(
      reward: rewards[index],
      isClaimed: _isClaimed(index + 1),
      isCurrent: _isCurrent(index + 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (rewards.length < 7) {
      return const Center(
        child: Text(
          'Invalid reward data',
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    return Column(
      children: [
        Flexible(
          child: Row(
            children: List.generate(
              4,
                  (index) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: _buildRewardCard(index),
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 8),

        Flexible(
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: _buildRewardCard(4),
                ),
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: _buildRewardCard(5),
                ),
              ),

              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: FeaturedRewardCard(
                    reward: rewards[6],
                    isClaimed: _isClaimed(7),
                    isCurrent: _isCurrent(7),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}