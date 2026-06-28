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

  bool _isClaimed(int day) {
    return day < currentDay;
  }

  bool _isCurrent(int day) {
    return day == currentDay && canClaim;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: List.generate(
              4,
                  (index) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: RewardCard(
                    reward: rewards[index],
                    isClaimed: _isClaimed(index + 1),
                    isCurrent: _isCurrent(index + 1),
                  ),
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 6),

        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: RewardCard(
                    reward: rewards[4],
                    isClaimed: _isClaimed(5),
                    isCurrent: _isCurrent(5),
                  ),
                ),
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: RewardCard(
                    reward: rewards[5],
                    isClaimed: _isClaimed(6),
                    isCurrent: _isCurrent(6),
                  ),
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