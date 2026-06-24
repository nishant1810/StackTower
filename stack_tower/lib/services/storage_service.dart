import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  // =========================
  // KEYS
  // =========================

  static const String bestScoreKey = 'best_score';

  static const String coinsKey = 'coins';

  static const String lastRewardDateKey =
      'last_reward_date';

  static const String rewardDayKey =
      'reward_day';

  static const String selectedThemeKey =
      'selected_theme';

  static const String unlockedThemesKey =
      'unlocked_themes';

  // =========================
  // BEST SCORE
  // =========================

  static Future<int> getBestScore() async {
    try {
      final prefs =
      await SharedPreferences.getInstance();

      return prefs.getInt(bestScoreKey) ?? 0;
    } catch (e) {
      print('GET SCORE ERROR: $e');
      return 0;
    }
  }

  static Future<void> saveBestScore(
      int score) async {
    try {
      final prefs =
      await SharedPreferences.getInstance();

      final currentBest =
          prefs.getInt(bestScoreKey) ?? 0;

      if (score > currentBest) {
        await prefs.setInt(
          bestScoreKey,
          score,
        );
      }
    } catch (e) {
      print('SAVE SCORE ERROR: $e');
    }
  }

  static Future<void> resetBestScore() async {
    try {
      final prefs =
      await SharedPreferences.getInstance();

      await prefs.remove(bestScoreKey);
    } catch (e) {
      print('RESET SCORE ERROR: $e');
    }
  }

  // =========================
  // COINS
  // =========================

  static Future<int> getCoins() async {
    try {
      final prefs =
      await SharedPreferences.getInstance();

      return prefs.getInt(coinsKey) ?? 0;
    } catch (e) {
      print('GET COINS ERROR: $e');
      return 0;
    }
  }

  static Future<void> saveCoins(
      int coins) async {
    try {
      final prefs =
      await SharedPreferences.getInstance();

      await prefs.setInt(
        coinsKey,
        coins,
      );
    } catch (e) {
      print('SAVE COINS ERROR: $e');
    }
  }

  static Future<void> addCoins(
      int amount) async {
    try {
      final prefs =
      await SharedPreferences.getInstance();

      final current =
          prefs.getInt(coinsKey) ?? 0;

      await prefs.setInt(
        coinsKey,
        current + amount,
      );
    } catch (e) {
      print('ADD COINS ERROR: $e');
    }
  }

  static Future<bool> spendCoins(
      int amount) async {
    try {
      final prefs =
      await SharedPreferences.getInstance();

      final current =
          prefs.getInt(coinsKey) ?? 0;

      if (current < amount) {
        return false;
      }

      await prefs.setInt(
        coinsKey,
        current - amount,
      );

      return true;
    } catch (e) {
      print('SPEND COINS ERROR: $e');
      return false;
    }
  }

  // =========================
  // DAILY REWARD
  // =========================

  static Future<String?> getLastRewardDate() async {
    try {
      final prefs =
      await SharedPreferences.getInstance();

      return prefs.getString(
        lastRewardDateKey,
      );
    } catch (e) {
      print('GET DATE ERROR: $e');
      return null;
    }
  }

  static Future<void> saveLastRewardDate(
      String date) async {
    try {
      final prefs =
      await SharedPreferences.getInstance();

      await prefs.setString(
        lastRewardDateKey,
        date,
      );
    } catch (e) {
      print('SAVE DATE ERROR: $e');
    }
  }

  static Future<int> getRewardDay() async {
    try {
      final prefs =
      await SharedPreferences.getInstance();

      return prefs.getInt(
        rewardDayKey,
      ) ??
          1;
    } catch (e) {
      print('GET REWARD DAY ERROR: $e');
      return 1;
    }
  }

  static Future<void> saveRewardDay(
      int day) async {
    try {
      final prefs =
      await SharedPreferences.getInstance();

      await prefs.setInt(
        rewardDayKey,
        day,
      );
    } catch (e) {
      print('SAVE REWARD DAY ERROR: $e');
    }
  }

  // =========================
  // THEME SHOP
  // =========================

  static Future<String> getSelectedTheme() async {
    try {
      final prefs =
      await SharedPreferences.getInstance();

      return prefs.getString(
        selectedThemeKey,
      ) ??
          'neon';
    } catch (e) {
      print('GET THEME ERROR: $e');
      return 'neon';
    }
  }

  static Future<void> saveSelectedTheme(
      String themeId) async {
    try {
      final prefs =
      await SharedPreferences.getInstance();

      await prefs.setString(
        selectedThemeKey,
        themeId,
      );
    } catch (e) {
      print('SAVE THEME ERROR: $e');
    }
  }

  static Future<List<String>>
  getUnlockedThemes() async {
    try {
      final prefs =
      await SharedPreferences.getInstance();

      return prefs.getStringList(
        unlockedThemesKey,
      ) ??
          ['neon'];
    } catch (e) {
      print(
          'GET UNLOCKED THEMES ERROR: $e');
      return ['neon'];
    }
  }

  static Future<void> saveUnlockedThemes(
      List<String> themes) async {
    try {
      final prefs =
      await SharedPreferences.getInstance();

      await prefs.setStringList(
        unlockedThemesKey,
        themes,
      );
    } catch (e) {
      print(
          'SAVE UNLOCKED THEMES ERROR: $e');
    }
  }

  static Future<bool> isThemeUnlocked(
      String themeId) async {
    final themes =
    await getUnlockedThemes();

    return themes.contains(themeId);
  }

  static Future<void> unlockTheme(
      String themeId) async {
    final themes =
    await getUnlockedThemes();

    if (!themes.contains(themeId)) {
      themes.add(themeId);

      await saveUnlockedThemes(
        themes,
      );
    }
  }

  // =========================
  // RESET ALL DATA
  // =========================

  static Future<void> resetAllData() async {
    try {
      final prefs =
      await SharedPreferences.getInstance();

      await prefs.clear();
    } catch (e) {
      print('RESET ALL ERROR: $e');
    }
  }
}