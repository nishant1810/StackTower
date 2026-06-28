class LeaderboardEntry {
  final String name;
  final int score;
  final int rank;
  final bool isUser;

  const LeaderboardEntry({
    required this.name,
    required this.score,
    required this.rank,
    this.isUser = false,
  });
}