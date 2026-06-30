import 'package:flutter/material.dart';

import '../../../core/services/storage/storage_service.dart';
import '../models/achievement_ids.dart';
import '../models/achievement_model.dart';

class AchievementsController {
  Future<List<AchievementModel>> loadAchievements() async {
    final gamesPlayed =
    await StorageService.getGamesPlayed();

    final highestCombo =
    await StorageService.getHighestCombo();

    final perfectPlacements =
    await StorageService.getPerfectPlacements();

    final coins =
    await StorageService.getCoins();

    final unlockedThemes =
    await StorageService.getUnlockedThemes();

    return [
      AchievementModel(
        id: AchievementIds.firstStack,
        title: 'First Stack',
        description: 'Play your first game',
        icon: Icons.flag,
        target: 1,
        progress: gamesPlayed,
        unlocked: gamesPlayed >= 1,
      ),

      AchievementModel(
        id: AchievementIds.builder,
        title: 'Builder',
        description: 'Play 25 games',
        icon: Icons.construction,
        target: 25,
        progress: gamesPlayed,
        unlocked: gamesPlayed >= 25,
      ),

      AchievementModel(
        id: AchievementIds.architect,
        title: 'Architect',
        description: 'Play 50 games',
        icon: Icons.apartment,
        target: 50,
        progress: gamesPlayed,
        unlocked: gamesPlayed >= 50,
      ),

      AchievementModel(
        id: AchievementIds.towerMaster,
        title: 'Tower Master',
        description: 'Play 100 games',
        icon: Icons.emoji_events,
        target: 100,
        progress: gamesPlayed,
        unlocked: gamesPlayed >= 100,
      ),

      AchievementModel(
        id: AchievementIds.perfectAim,
        title: 'Perfect Aim',
        description: 'Get 50 perfect drops',
        icon: Icons.gps_fixed,
        target: 50,
        progress: perfectPlacements,
        unlocked: perfectPlacements >= 50,
      ),

      AchievementModel(
        id: AchievementIds.comboKing,
        title: 'Combo King',
        description: 'Reach combo 10',
        icon: Icons.local_fire_department,
        target: 10,
        progress: highestCombo,
        unlocked: highestCombo >= 10,
      ),

      AchievementModel(
        id: AchievementIds.coinCollector,
        title: 'Coin Collector',
        description: 'Collect 5000 coins',
        icon: Icons.monetization_on,
        target: 5000,
        progress: coins,
        unlocked: coins >= 5000,
      ),

      AchievementModel(
        id: AchievementIds.themeHunter,
        title: 'Theme Hunter',
        description: 'Unlock all themes',
        icon: Icons.palette,
        target: 5,
        progress: unlockedThemes.length,
        unlocked: unlockedThemes.length >= 5,
      ),
    ];
  }
}