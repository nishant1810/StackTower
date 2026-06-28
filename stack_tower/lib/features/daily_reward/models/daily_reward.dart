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

  const DailyReward({
    required this.day,
    required this.title,
    required this.amount,
    required this.type,
  });
}