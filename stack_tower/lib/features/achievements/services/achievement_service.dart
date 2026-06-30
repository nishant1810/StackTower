import '../../../core/services/storage/storage_service.dart';
import '../models/achievement_ids.dart';

class AchievementService {
  static Future<void> checkAchievements({
    required int gamesPlayed,
    required int perfectPlacements,
    required int highestCombo,
    required int coins,
    required List<String> unlockedThemes,
  }) async {
    if (gamesPlayed >= 1) {
      await StorageService.unlockAchievement(
        AchievementIds.firstStack,
      );
    }

    if (gamesPlayed >= 25) {
      await StorageService.unlockAchievement(
        AchievementIds.builder,
      );
    }

    if (gamesPlayed >= 50) {
      await StorageService.unlockAchievement(
        AchievementIds.architect,
      );
    }

    if (gamesPlayed >= 100) {
      await StorageService.unlockAchievement(
        AchievementIds.towerMaster,
      );
    }

    if (perfectPlacements >= 50) {
      await StorageService.unlockAchievement(
        AchievementIds.perfectAim,
      );
    }

    if (highestCombo >= 10) {
      await StorageService.unlockAchievement(
        AchievementIds.comboKing,
      );
    }

    if (coins >= 5000) {
      await StorageService.unlockAchievement(
        AchievementIds.coinCollector,
      );
    }

    if (unlockedThemes.length >= 5) {
      await StorageService.unlockAchievement(
        AchievementIds.themeHunter,
      );
    }
  }
}