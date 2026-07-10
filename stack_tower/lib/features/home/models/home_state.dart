import 'package:flutter/foundation.dart';

@immutable
class HomeState {
  const HomeState({
    required this.playerName,
    required this.level,
    required this.xp,
    required this.xpRequired,
    required this.coins,
    required this.gems,
    required this.bestScore,
    required this.dailyRewardAvailable,
  });

  final String playerName;
  final int level;

  /// Current XP
  final int xp;

  /// XP needed for next level
  final int xpRequired;

  final int coins;
  final int gems;
  final int bestScore;
  final bool dailyRewardAvailable;

  double get progress =>
      xpRequired == 0 ? 0 : xp / xpRequired;

  HomeState copyWith({
    String? playerName,
    int? level,
    int? xp,
    int? xpRequired,
    int? coins,
    int? gems,
    int? bestScore,
    bool? dailyRewardAvailable,
  }) {
    return HomeState(
      playerName: playerName ?? this.playerName,
      level: level ?? this.level,
      xp: xp ?? this.xp,
      xpRequired: xpRequired ?? this.xpRequired,
      coins: coins ?? this.coins,
      gems: gems ?? this.gems,
      bestScore: bestScore ?? this.bestScore,
      dailyRewardAvailable:
      dailyRewardAvailable ?? this.dailyRewardAvailable,
    );
  }

  @override
  String toString() {
    return 'HomeState('
        'playerName: $playerName, '
        'level: $level, '
        'xp: $xp, '
        'xpRequired: $xpRequired, '
        'coins: $coins, '
        'gems: $gems, '
        'bestScore: $bestScore, '
        'dailyRewardAvailable: $dailyRewardAvailable'
        ')';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is HomeState &&
            playerName == other.playerName &&
            level == other.level &&
            xp == other.xp &&
            xpRequired == other.xpRequired &&
            coins == other.coins &&
            gems == other.gems &&
            bestScore == other.bestScore &&
            dailyRewardAvailable ==
                other.dailyRewardAvailable;
  }

  @override
  int get hashCode => Object.hash(
    playerName,
    level,
    xp,
    xpRequired,
    coins,
    gems,
    bestScore,
    dailyRewardAvailable,
  );
}