import 'dart:math';

import '../models/leaderboard_entry.dart';

class LeaderboardController {
  List<LeaderboardEntry> entries = [];

  Future<void> loadLeaderboard(int userBestScore) async {
    final random = Random();

    final generated = [
      LeaderboardEntry(
        rank: 0,
        name: 'You',
        score: userBestScore,
        isUser: true,
      ),
    ];

    final names = [
      'TowerKing',
      'SkyBuilder',
      'BlockHero',
      'NeonStack',
      'CubeMaster',
      'TowerX',
      'StackPro',
      'GravityGod',
      'PixelBuilder',
    ];

    for (final name in names) {
      final variation = random.nextInt(120) - 60;

      generated.add(
        LeaderboardEntry(
          rank: 0,
          name: name,
          score: max(1, userBestScore + variation),
        ),
      );
    }

    generated.sort((a, b) => b.score.compareTo(a.score));

    entries = [];

    for (int i = 0; i < generated.length; i++) {
      entries.add(
        LeaderboardEntry(
          rank: i + 1,
          name: generated[i].name,
          score: generated[i].score,
          isUser: generated[i].isUser,
        ),
      );
    }
  }
}