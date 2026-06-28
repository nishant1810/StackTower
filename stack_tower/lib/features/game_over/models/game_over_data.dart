class GameOverData {
  final int score;
  final int bestScore;
  final int coinsEarned;

  const GameOverData({
    required this.score,
    required this.bestScore,
    required this.coinsEarned,
  });

  bool get isNewRecord => score >= bestScore;

  int get stars {
    if (score >= 500) return 3;
    if (score >= 250) return 2;
    if (score >= 100) return 1;
    return 0;
  }

  String get rank {
    if (score >= 1000) return 'LEGEND';
    if (score >= 750) return 'MASTER';
    if (score >= 500) return 'EXPERT';
    if (score >= 250) return 'PRO';
    if (score >= 100) return 'ROOKIE';
    return 'BEGINNER';
  }

  Map<String, dynamic> toJson() {
    return {
      'score': score,
      'bestScore': bestScore,
      'coinsEarned': coinsEarned,
    };
  }

  factory GameOverData.fromJson(
      Map<String, dynamic> json,
      ) {
    return GameOverData(
      score: json['score'] ?? 0,
      bestScore: json['bestScore'] ?? 0,
      coinsEarned: json['coinsEarned'] ?? 0,
    );
  }

  GameOverData copyWith({
    int? score,
    int? bestScore,
    int? coinsEarned,
  }) {
    return GameOverData(
      score: score ?? this.score,
      bestScore: bestScore ?? this.bestScore,
      coinsEarned: coinsEarned ?? this.coinsEarned,
    );
  }
}