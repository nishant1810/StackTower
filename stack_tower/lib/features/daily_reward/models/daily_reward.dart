enum RewardType {
  coins,
  crystalPurple,
  crystalBlue,
  chest,
}

class DailyReward {
  final int day;
  final String title;

  final int amount;
  final RewardType type;

  final bool isBonus;
  final bool isClaimed;

  const DailyReward({
    required this.day,
    required this.title,
    required this.amount,
    required this.type,
    this.isBonus = false,
    this.isClaimed = false,
  });

  String get displayAmount {
    switch (type) {
      case RewardType.coins:
        return '$amount Coins';

      case RewardType.crystalPurple:
        return '$amount Purple Crystals';

      case RewardType.crystalBlue:
        return '$amount Blue Crystals';

      case RewardType.chest:
        return 'Mystery Chest';
    }
  }

  String get assetPath {
    switch (type) {
      case RewardType.coins:
        return 'assets/images/daily_reward/coin.png';

      case RewardType.crystalPurple:
        return 'assets/images/daily_reward/crystal_purple.png';

      case RewardType.crystalBlue:
        return 'assets/images/daily_reward/crystal_blue.png';

      case RewardType.chest:
        return 'assets/images/daily_reward/chest.png';
    }
  }
}