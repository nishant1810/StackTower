import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  AnalyticsService._();

  static final instance =
  AnalyticsService._();

  final FirebaseAnalytics analytics =
      FirebaseAnalytics.instance;

  //----------------------------------------------------------

  Future<void> logGameStart() async {
    await analytics.logEvent(
      name: "game_start",
    );
  }

  //----------------------------------------------------------

  Future<void> logGameOver(
      int score) async {
    await analytics.logEvent(
      name: "game_over",
      parameters: {
        "score": score,
      },
    );
  }

  //----------------------------------------------------------

  Future<void> logPerfect() async {
    await analytics.logEvent(
      name: "perfect_block",
    );
  }

  //----------------------------------------------------------

  Future<void> logRewardClaim(
      int coins) async {
    await analytics.logEvent(
      name: "daily_reward",
      parameters: {
        "coins": coins,
      },
    );
  }

  //----------------------------------------------------------

  Future<void> logAchievement(
      String id) async {
    await analytics.logEvent(
      name: "achievement_unlock",
      parameters: {
        "id": id,
      },
    );
  }

  //----------------------------------------------------------

  Future<void> logAdShown(
      String type) async {
    await analytics.logEvent(
      name: "ad_show",
      parameters: {
        "type": type,
      },
    );
  }
}