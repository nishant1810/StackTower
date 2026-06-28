import 'package:flutter/foundation.dart';

import '../models/leaderboard_entry.dart';

class LeaderboardController extends ChangeNotifier {
  List<LeaderboardEntry> entries = [];

  Future<void> loadLeaderboard(int userBestScore) async {
    entries = [
      LeaderboardEntry(
        rank: 1,
        name: 'TowerKing',
        score: 250,
      ),
      LeaderboardEntry(
        rank: 2,
        name: 'StackMaster',
        score: 210,
      ),
      LeaderboardEntry(
        rank: 3,
        name: 'SkyBuilder',
        score: 185,
      ),
      LeaderboardEntry(
        rank: 4,
        name: 'You',
        score: userBestScore,
        isUser: true,
      ),
      LeaderboardEntry(
        rank: 5,
        name: 'BlockHero',
        score: 120,
      ),
    ];

    notifyListeners();
  }
}