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

    final bestScore =
    await StorageService.getBestScore();

    // final unlockedThemes =
    // await StorageService.getUnlockedThemes();

    return [
      //=========================================================
      // GAMES PLAYED
      //=========================================================

      AchievementModel(
        id: AchievementIds.firstStack,
        title: 'First Stack',
        description: 'Play your first game',
        icon: Icons.flag,
        target: 1,
        progress: gamesPlayed,
        unlocked: gamesPlayed >= 1,
        reward: 25,
        rewardClaimed:
        await StorageService
            .isAchievementRewardClaimed(
          AchievementIds.firstStack,
        ),
      ),

      AchievementModel(
        id: AchievementIds.games10,
        title: 'Getting Started',
        description: 'Play 10 games',
        icon: Icons.sports_esports,
        target: 10,
        progress: gamesPlayed,
        unlocked: gamesPlayed >= 10,
        reward: 50,
        rewardClaimed:
        await StorageService
            .isAchievementRewardClaimed(
          AchievementIds.games10,
        ),
      ),

      AchievementModel(
        id: AchievementIds.builder,
        title: 'Builder',
        description: 'Play 25 games',
        icon: Icons.construction,
        target: 25,
        progress: gamesPlayed,
        unlocked: gamesPlayed >= 25,
        reward: 100,
        rewardClaimed:
        await StorageService
            .isAchievementRewardClaimed(
          AchievementIds.builder,
        ),
      ),

      AchievementModel(
        id: AchievementIds.architect,
        title: 'Architect',
        description: 'Play 50 games',
        icon: Icons.apartment,
        target: 50,
        progress: gamesPlayed,
        unlocked: gamesPlayed >= 50,
        reward: 200,
        rewardClaimed:
        await StorageService
            .isAchievementRewardClaimed(
          AchievementIds.architect,
        ),
      ),

      AchievementModel(
        id: AchievementIds.towerMaster,
        title: 'Tower Master',
        description: 'Play 100 games',
        icon: Icons.emoji_events,
        target: 100,
        progress: gamesPlayed,
        unlocked: gamesPlayed >= 100,
        reward: 500,
        rewardClaimed:
        await StorageService
            .isAchievementRewardClaimed(
          AchievementIds.towerMaster,
        ),
      ),

      AchievementModel(
        id: AchievementIds.games250,
        title: 'Veteran Builder',
        description: 'Play 250 games',
        icon: Icons.cottage,
        target: 250,
        progress: gamesPlayed,
        unlocked: gamesPlayed >= 250,
        reward: 1000,
        rewardClaimed:
        await StorageService
            .isAchievementRewardClaimed(
          AchievementIds.games250,
        ),
      ),

      AchievementModel(
        id: AchievementIds.games500,
        title: 'Tower Addict',
        description: 'Play 500 games',
        icon: Icons.castle,
        target: 500,
        progress: gamesPlayed,
        unlocked: gamesPlayed >= 500,
        reward: 2500,
        rewardClaimed:
        await StorageService
            .isAchievementRewardClaimed(
          AchievementIds.games500,
        ),
      ),

      //=========================================================
      // SCORE
      //=========================================================

      AchievementModel(
        id: AchievementIds.score25,
        title: 'Rookie Climber',
        description: 'Reach score 25',
        icon: Icons.trending_up,
        target: 25,
        progress: bestScore,
        unlocked: bestScore >= 25,
        reward: 50,
        rewardClaimed:
        await StorageService
            .isAchievementRewardClaimed(
          AchievementIds.score25,
        ),
      ),

      AchievementModel(
        id: AchievementIds.score50,
        title: 'Sky Walker',
        description: 'Reach score 50',
        icon: Icons.auto_graph,
        target: 50,
        progress: bestScore,
        unlocked: bestScore >= 50,
        reward: 100,
        rewardClaimed:
        await StorageService
            .isAchievementRewardClaimed(
          AchievementIds.score50,
        ),
      ),

      AchievementModel(
        id: AchievementIds.score100,
        title: 'Cloud Breaker',
        description: 'Reach score 100',
        icon: Icons.cloud,
        target: 100,
        progress: bestScore,
        unlocked: bestScore >= 100,
        reward: 200,
        rewardClaimed:
        await StorageService
            .isAchievementRewardClaimed(
          AchievementIds.score100,
        ),
      ),

      AchievementModel(
        id: AchievementIds.score250,
        title: 'Sky Lord',
        description: 'Reach score 250',
        icon: Icons.flight,
        target: 250,
        progress: bestScore,
        unlocked: bestScore >= 250,
        reward: 500,
        rewardClaimed:
        await StorageService
            .isAchievementRewardClaimed(
          AchievementIds.score250,
        ),
      ),

      AchievementModel(
        id: AchievementIds.score500,
        title: 'Tower God',
        description: 'Reach score 500',
        icon: Icons.rocket_launch,
        target: 500,
        progress: bestScore,
        unlocked: bestScore >= 500,
        reward: 1000,
        rewardClaimed:
        await StorageService
            .isAchievementRewardClaimed(
          AchievementIds.score500,
        ),
      ),

      //=========================================================
      // PERFECT DROPS
      //=========================================================

      AchievementModel(
        id: AchievementIds.perfect10,
        title: 'Sharp Eye',
        description: 'Get 10 perfect drops',
        icon: Icons.center_focus_strong,
        target: 10,
        progress: perfectPlacements,
        unlocked: perfectPlacements >= 10,
        reward: 100,
        rewardClaimed:
        await StorageService
            .isAchievementRewardClaimed(
          AchievementIds.perfect10,
        ),
      ),

      AchievementModel(
        id: AchievementIds.perfectAim,
        title: 'Perfect Aim',
        description: 'Get 50 perfect drops',
        icon: Icons.gps_fixed,
        target: 50,
        progress: perfectPlacements,
        unlocked: perfectPlacements >= 50,
        reward: 250,
        rewardClaimed:
        await StorageService
            .isAchievementRewardClaimed(
          AchievementIds.perfectAim,
        ),
      ),

      AchievementModel(
        id: AchievementIds.perfect100,
        title: 'Precision Master',
        description: 'Get 100 perfect drops',
        icon: Icons.track_changes,
        target: 100,
        progress: perfectPlacements,
        unlocked: perfectPlacements >= 100,
        reward: 1000,
        rewardClaimed:
        await StorageService
            .isAchievementRewardClaimed(
          AchievementIds.perfect100,
        ),
      ),

      //=========================================================
      // COMBO
      //=========================================================

      AchievementModel(
        id: AchievementIds.combo5,
        title: 'Hot Streak',
        description: 'Reach combo 5',
        icon: Icons.local_fire_department,
        target: 5,
        progress: highestCombo,
        unlocked: highestCombo >= 5,
        reward: 75,
        rewardClaimed:
        await StorageService
            .isAchievementRewardClaimed(
          AchievementIds.combo5,
        ),
      ),

      AchievementModel(
        id: AchievementIds.comboKing,
        title: 'Combo King',
        description: 'Reach combo 10',
        icon: Icons.whatshot,
        target: 10,
        progress: highestCombo,
        unlocked: highestCombo >= 10,
        reward: 300,
        rewardClaimed:
        await StorageService
            .isAchievementRewardClaimed(
          AchievementIds.comboKing,
        ),
      ),

      AchievementModel(
        id: AchievementIds.combo15,
        title: 'Combo Beast',
        description: 'Reach combo 15',
        icon: Icons.bolt,
        target: 15,
        progress: highestCombo,
        unlocked: highestCombo >= 15,
        reward: 400,
        rewardClaimed:
        await StorageService
            .isAchievementRewardClaimed(
          AchievementIds.combo15,
        ),
      ),

      AchievementModel(
        id: AchievementIds.combo25,
        title: 'Combo Legend',
        description: 'Reach combo 25',
        icon: Icons.flash_on,
        target: 25,
        progress: highestCombo,
        unlocked: highestCombo >= 25,
        reward: 800,
        rewardClaimed:
        await StorageService
            .isAchievementRewardClaimed(
          AchievementIds.combo25,
        ),
      ),

      //=========================================================
      // COINS
      //=========================================================

      AchievementModel(
        id: AchievementIds.coins1000,
        title: 'Pocket Change',
        description: 'Collect 1000 coins',
        icon: Icons.savings,
        target: 1000,
        progress: coins,
        unlocked: coins >= 1000,
        reward: 100,
        rewardClaimed:
        await StorageService
            .isAchievementRewardClaimed(
          AchievementIds.coins1000,
        ),
      ),

      AchievementModel(
        id: AchievementIds.coinCollector,
        title: 'Coin Collector',
        description: 'Collect 5000 coins',
        icon: Icons.monetization_on,
        target: 5000,
        progress: coins,
        unlocked: coins >= 5000,
        reward: 400,
        rewardClaimed:
        await StorageService
            .isAchievementRewardClaimed(
          AchievementIds.coinCollector,
        ),
      ),

      AchievementModel(
        id: AchievementIds.coins10000,
        title: 'Rich Builder',
        description: 'Collect 10000 coins',
        icon: Icons.account_balance_wallet,
        target: 10000,
        progress: coins,
        unlocked: coins >= 10000,
        reward: 2000,
        rewardClaimed:
        await StorageService
            .isAchievementRewardClaimed(
          AchievementIds.coins10000,
        ),
      ),

      //=========================================================
      // THEMES
      //=========================================================

      // AchievementModel(
      //   id: AchievementIds.themes3,
      //   title: 'Collector',
      //   description: 'Unlock 3 themes',
      //   icon: Icons.palette_outlined,
      //   target: 3,
      //   progress: unlockedThemes.length,
      //   unlocked: unlockedThemes.length >= 3,
      //   reward: 250,
      //   rewardClaimed:
      //   await StorageService
      //       .isAchievementRewardClaimed(
      //     AchievementIds.themes3,
      //   ),
      // ),

      // AchievementModel(
      //   id: AchievementIds.themes4,
      //   title: 'Theme Enthusiast',
      //   description: 'Unlock 4 themes',
      //   icon: Icons.color_lens,
      //   target: 4,
      //   progress: unlockedThemes.length,
      //   unlocked: unlockedThemes.length >= 4,
      //   reward: 400,
      //   rewardClaimed:
      //   await StorageService
      //       .isAchievementRewardClaimed(
      //     AchievementIds.themes4,
      //   ),
      // ),

      // AchievementModel(
      //   id: AchievementIds.themeHunter,
      //   title: 'Theme Hunter',
      //   description: 'Unlock all themes',
      //   icon: Icons.palette,
      //   target: 5,
      //   progress: unlockedThemes.length,
      //   unlocked: unlockedThemes.length >= 5,
      //   reward: 750,
      //   rewardClaimed:
      //   await StorageService
      //       .isAchievementRewardClaimed(
      //     AchievementIds.themeHunter,
      //   ),
      // ),
    ];
  }

  Future<void> claimReward(
      AchievementModel achievement,
      ) async {
    if (!achievement.unlocked) return;

    if (achievement.rewardClaimed) return;

    await StorageService.addCoins(
      achievement.reward,
    );

    await StorageService
        .claimAchievementReward(
      achievement.id,
    );
   }
 }