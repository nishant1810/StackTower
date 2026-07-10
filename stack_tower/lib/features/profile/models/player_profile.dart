class PlayerProfile {
  final String name;
  final int level;
  final int xp;
  final int xpRequired;
  final String avatar;

  final int bestScore;
  final int totalCoins;
  final int gamesPlayed;
  final int highestCombo;
  final int perfectRecord;

  const PlayerProfile({
    required this.name,
    required this.level,
    required this.xp,
    required this.xpRequired,
    required this.avatar,
    required this.bestScore,
    required this.totalCoins,
    required this.gamesPlayed,
    required this.highestCombo,
    required this.perfectRecord,
  });

  /// Progress value for progress bar (0.0 - 1.0)
  double get progress =>
      xpRequired == 0 ? 0 : xp / xpRequired;

  /// Example: "7850 / 10000 XP"
  String get xpText => '$xp / $xpRequired XP';

  /// Example: "25"
  String get levelText => level.toString();

  PlayerProfile copyWith({
    String? name,
    int? level,
    int? xp,
    int? xpRequired,
    String? avatar,
    int? bestScore,
    int? totalCoins,
    int? gamesPlayed,
    int? highestCombo,
    int? perfectRecord,
  }) {
    return PlayerProfile(
      name: name ?? this.name,
      level: level ?? this.level,
      xp: xp ?? this.xp,
      xpRequired: xpRequired ?? this.xpRequired,
      avatar: avatar ?? this.avatar,
      bestScore: bestScore ?? this.bestScore,
      totalCoins: totalCoins ?? this.totalCoins,
      gamesPlayed: gamesPlayed ?? this.gamesPlayed,
      highestCombo: highestCombo ?? this.highestCombo,
      perfectRecord: perfectRecord ?? this.perfectRecord,
    );
  }
}