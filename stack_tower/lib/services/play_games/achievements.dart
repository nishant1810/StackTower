import 'dart:developer';

import 'package:games_services/games_services.dart';

import '../../services/storage_service.dart';
import 'play_games_constants.dart';

class PlayGamesAchievements {
  PlayGamesAchievements._();

  static final instance =
  PlayGamesAchievements._();

  //----------------------------------------------------------
  // Unlock
  //----------------------------------------------------------

  Future<void> unlock(
      String achievementId,
      ) async {
    final unlocked =
    await StorageService.getBool(
      achievementId,
      defaultValue: false,
    );

    if (unlocked) {
      return;
    }

    try {
      await GamesServices.unlock(
        achievement: Achievement(
          androidID: achievementId,
        ),
      );

      await StorageService.setBool(
        achievementId,
        true,
      );

      log(
        "Achievement Unlocked : $achievementId",
      );
    } catch (e) {
      log(
        "Achievement Unlock Failed : $e",
      );
    }
  }

  //----------------------------------------------------------
  // Increment
  //----------------------------------------------------------

  Future<void> increment(
      String achievementId,
      int steps,
      ) async {
    try {
      await GamesServices.increment(
        achievement: Achievement(
          androidID: achievementId,
          steps: steps,
        ),
      );
    } catch (e) {
      log(
        "Achievement Increment Failed : $e",
      );
    }
  }

  //----------------------------------------------------------
  // Native Screen
  //----------------------------------------------------------

  Future<void> showAchievements() async {
    try {
      await GamesServices.showAchievements();
    } catch (e) {
      log(
        "Show Achievements Failed : $e",
      );
    }
  }
}