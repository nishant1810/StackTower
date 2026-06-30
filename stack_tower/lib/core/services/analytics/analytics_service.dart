import 'package:flutter/foundation.dart';

class AnalyticsService {
  AnalyticsService._();

  static Future<void> initialize() async {
    debugPrint('[Analytics] Initialized');
  }

  static Future<void> logEvent(
      String eventName, {
        Map<String, dynamic>? parameters,
      }) async {
    debugPrint(
      '[Analytics] $eventName : ${parameters ?? {}}',
    );
  }

  static Future<void> logGameStarted() async {
    await logEvent(
      'game_started',
    );
  }

  static Future<void> logGameOver({
    required int score,
    required int bestScore,
  }) async {
    await logEvent(
      'game_over',
      parameters: {
        'score': score,
        'best_score': bestScore,
      },
    );
  }

  static Future<void> logNewBestScore(
      int score,
      ) async {
    await logEvent(
      'new_best_score',
      parameters: {
        'score': score,
      },
    );
  }

  static Future<void> logThemePurchased(
      String themeId,
      ) async {
    await logEvent(
      'theme_purchased',
      parameters: {
        'theme_id': themeId,
      },
    );
  }

  static Future<void> logThemeSelected(
      String themeId,
      ) async {
    await logEvent(
      'theme_selected',
      parameters: {
        'theme_id': themeId,
      },
    );
  }

  static Future<void> logRewardClaimed({
    required int day,
    required int coins,
  }) async {
    await logEvent(
      'daily_reward_claimed',
      parameters: {
        'day': day,
        'coins': coins,
      },
    );
  }

  static Future<void> logAchievementUnlocked(
      String achievementId,
      ) async {
    await logEvent(
      'achievement_unlocked',
      parameters: {
        'achievement_id': achievementId,
      },
    );
  }

  static Future<void> logAdShown(
      String adType,
      ) async {
    await logEvent(
      'ad_shown',
      parameters: {
        'ad_type': adType,
      },
    );
  }

  static Future<void> logAdRewardEarned() async {
    await logEvent(
      'rewarded_ad_completed',
    );
  }

  static Future<void> logSettingsChanged(
      String setting,
      dynamic value,
      ) async {
    await logEvent(
      'settings_changed',
      parameters: {
        'setting': setting,
        'value': value.toString(),
      },
    );
  }
}