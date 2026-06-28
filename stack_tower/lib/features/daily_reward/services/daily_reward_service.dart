import 'package:shared_preferences/shared_preferences.dart';

class DailyRewardService {
  static const String lastClaimDateKey =
      'daily_reward_last_claim';

  static const String rewardDayKey =
      'daily_reward_day';

  static const String coinsKey = 'coins';

  Future<int> getCurrentDay() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getInt(rewardDayKey) ?? 1;
  }

  Future<bool> canClaimReward() async {
    final prefs = await SharedPreferences.getInstance();

    final lastClaim =
    prefs.getString(lastClaimDateKey);

    if (lastClaim == null) {
      return true;
    }

    final lastDate =
    DateTime.parse(lastClaim);

    final now = DateTime.now();

    return now.difference(lastDate).inDays >= 1;
  }

  Future<int> claimReward(int rewardAmount) async {
    final prefs = await SharedPreferences.getInstance();

    final currentCoins =
        prefs.getInt(coinsKey) ?? 0;

    await prefs.setInt(
      coinsKey,
      currentCoins + rewardAmount,
    );

    await prefs.setString(
      lastClaimDateKey,
      DateTime.now().toIso8601String(),
    );

    int currentDay =
        prefs.getInt(rewardDayKey) ?? 1;

    currentDay++;

    if (currentDay > 7) {
      currentDay = 1;
    }

    await prefs.setInt(
      rewardDayKey,
      currentDay,
    );

    return rewardAmount;
  }
}