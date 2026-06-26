class DailyReward {
  const DailyReward({
    required this.day,
    required this.coins,
    this.claimed = false,
    this.current = false,
  });

  final int day;

  final int coins;

  final bool claimed;

  final bool current;

  DailyReward copyWith({
    bool? claimed,
    bool? current,
  }) {
    return DailyReward(
      day: day,
      coins: coins,
      claimed: claimed ?? this.claimed,
      current: current ?? this.current,
    );
  }
}