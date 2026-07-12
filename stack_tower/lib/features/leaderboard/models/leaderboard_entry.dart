class LeaderboardEntry {
  final String name;
  final String? photoUrl;
  final int score;
  final int rank;
  final bool isUser;

  const LeaderboardEntry({
    required this.name,
    this.photoUrl,
    required this.score,
    required this.rank,
    this.isUser = false,
  });

  factory LeaderboardEntry.fromFirestore({
    required Map<String, dynamic> data,
    required int rank,
    bool isUser = false,
  }) {
    return LeaderboardEntry(
      name: data['name'] ?? 'Player',
      photoUrl: data['photoUrl'],
      score: data['bestScore'] ?? 0,
      rank: rank,
      isUser: isUser,
    );
  }
}