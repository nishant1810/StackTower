import 'dart:developer';

import 'package:games_services/games_services.dart';

import '../../services/storage_service.dart';
import 'play_games_constants.dart';

class Leaderboards {
  Leaderboards._();

  static final instance = Leaderboards._();

  static const _lastUploadedKey =
      "leaderboard_last_uploaded";

  //----------------------------------------------------------
  // Submit Score
  //----------------------------------------------------------

  Future<void> submitScore(int score) async {
    final uploaded =
    await StorageService.getInt(
      _lastUploadedKey,
      defaultValue: 0,
    );

    if (score <= uploaded) {
      return;
    }

    try {
      await GamesServices.submitScore(
        score: Score(
          androidLeaderboardID:
          PlayGamesConstants
              .leaderboardBestScore,
          value: score,
        ),
      );

      await StorageService.setInt(
        _lastUploadedKey,
        score,
      );

      log(
        "Leaderboard Updated : $score",
      );
    } catch (e) {
      log(
        "Leaderboard Upload Failed : $e",
      );
    }
  }

  //----------------------------------------------------------
  // Show Native Leaderboard
  //----------------------------------------------------------

  Future<void> showLeaderboard() async {
    try {
      await GamesServices.showLeaderboards(
        androidLeaderboardID:
        PlayGamesConstants
            .leaderboardBestScore,
      );
    } catch (e) {
      log(
        "Show Leaderboard Failed : $e",
      );
    }
  }
}