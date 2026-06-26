import 'package:flutter/foundation.dart';

import '../../../services/storage_service.dart';
import '../models/daily_reward.dart';

class DailyRewardService extends ChangeNotifier {
  DailyRewardService._();

  static final instance = DailyRewardService._();

  final List<int> rewards = [
    100,
    150,
    200,
    300,
    400,
    500,
    1000,
  ];

  int currentDay = 1;

  bool canClaim = false;

  Future<void> initialize() async {
    currentDay =
    await StorageService.getRewardDay();

    canClaim =
    await StorageService.canClaimReward();

    notifyListeners();
  }

  List<DailyReward> get days {
    return List.generate(
      rewards.length,
          (index) {
        final day = index + 1;

        return DailyReward(
          day: day,
          coins: rewards[index],
          claimed: day < currentDay,
          current:
          canClaim &&
              day == currentDay,
        );
      },
    );
  }

  Future<int> claimReward() async {
    if (!canClaim) {
      return 0;
    }

    final reward =
    rewards[currentDay - 1];

    final coins =
    await StorageService.getCoins();

    await StorageService.setCoins(
      coins + reward,
    );

    await StorageService.markRewardClaimed();

    currentDay++;

    if (currentDay > 7) {
      currentDay = 1;
    }

    await StorageService.setRewardDay(
      currentDay,
    );

    canClaim = false;

    notifyListeners();

    return reward;
  }
}