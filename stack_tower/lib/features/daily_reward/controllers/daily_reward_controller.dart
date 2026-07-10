import 'package:flutter/material.dart';

import '../models/daily_reward.dart';
import '../services/daily_reward_service.dart';

class DailyRewardController extends ChangeNotifier {
  DailyRewardController();

  final DailyRewardService _service = DailyRewardService();

  bool isLoading = true;
  bool canClaim = false;

  int currentDay = 1;

  List<DailyReward> rewards = const [
    DailyReward(
      day: 1,
      title: 'Coins',
      amount: 50,
      type: RewardType.coins,
    ),
    DailyReward(
      day: 2,
      title: 'Purple Crystal',
      amount: 5,
      type: RewardType.crystalPurple,
    ),
    DailyReward(
      day: 3,
      title: 'Coins',
      amount: 100,
      type: RewardType.coins,
    ),
    DailyReward(
      day: 4,
      title: 'Blue Crystal',
      amount: 10,
      type: RewardType.crystalBlue,
    ),
    DailyReward(
      day: 5,
      title: 'Coins',
      amount: 150,
      type: RewardType.coins,
    ),
    DailyReward(
      day: 6,
      title: 'Purple Crystal',
      amount: 15,
      type: RewardType.crystalPurple,
    ),
    DailyReward(
      day: 7,
      title: 'Premium Chest',
      amount: 500,
      type: RewardType.chest,
    ),
  ];

  Future<void> initialize() async {
    isLoading = true;
    notifyListeners();

    try {
      currentDay = await _service.getCurrentDay();
      canClaim = await _service.canClaimReward();
    } catch (e) {
      debugPrint('DailyReward Init Error: $e');
    }

    isLoading = false;
    notifyListeners();
  }

  Future<int?> claimReward() async {
    if (!canClaim) {
      return null;
    }

    try {
      final reward = rewards[currentDay - 1];

      final amount = await _service.claimReward(
        reward.amount,
      );

      currentDay = await _service.getCurrentDay();

      canClaim = await _service.canClaimReward();

      notifyListeners();

      return amount;
    } catch (e) {
      debugPrint('Claim Reward Error: $e');
      return null;
    }
  }

  bool isClaimed(int day) {
    return day < currentDay;
  }

  bool isCurrent(int day) {
    return day == currentDay;
  }

  bool isLocked(int day) {
    return day > currentDay;
  }

  DailyReward getReward(int day) {
    return rewards.firstWhere(
          (reward) => reward.day == day,
    );
  }
}