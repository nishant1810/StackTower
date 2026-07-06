import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  StorageService._();

  //=========================================================
  // KEYS
  //=========================================================

  static const String bestScoreKey = 'best_score';
  static const String coinsKey = 'coins';
  static const String diamondsKey = 'diamonds';

  static const String lastRewardDateKey =
      'last_reward_date';

  static const String rewardDayKey =
      'reward_day';

  static const String selectedThemeKey =
      'selected_theme';

  static const String unlockedThemesKey =
      'unlocked_themes';

  static const String selectedBlockKey =
      'selected_block';

  static const String unlockedBlocksKey =
      'unlocked_blocks';

  static const String gamesPlayedKey =
      'games_played';

  static const String musicEnabledKey =
      'music_enabled';

  static const String sfxEnabledKey =
      'sfx_enabled';

  static const String vibrationEnabledKey =
      'vibration_enabled';

  static const String highestComboKey =
      'highest_combo';

  static const String perfectPlacementsKey =
      'perfect_placements';

  static const String achievementsKey =
      'achievements';

  static const _topScoresKey = 'top_scores';

  //=========================================================
// GUEST LOGIN
//=========================================================

  static const String guestModeKey = 'guest_mode';

  static Future<void> setGuestMode(
      bool value,
      ) async {
    try {
      final prefs =
      await SharedPreferences.getInstance();

      await prefs.setBool(
        guestModeKey,
        value,
      );
    } catch (e) {
      print('SET GUEST MODE ERROR: $e');
    }
  }

  static Future<bool> getGuestMode() async {
    try {
      final prefs =
      await SharedPreferences.getInstance();

      return prefs.getBool(
        guestModeKey,
      ) ??
          false;
    } catch (e) {
      print('GET GUEST MODE ERROR: $e');
      return false;
    }
  }

  //=========================================================
  // BEST SCORE
  //=========================================================

  static Future<int> getBestScore() async {
    try {
      final prefs =
      await SharedPreferences.getInstance();

      return prefs.getInt(bestScoreKey) ?? 0;
    } catch (e) {
      print('GET BEST SCORE ERROR: $e');
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
      print('SAVE BEST SCORE ERROR: $e');
    }
  }

  static Future<void> resetBestScore() async {
    try {
      final prefs =
      await SharedPreferences.getInstance();

      await prefs.remove(bestScoreKey);
    } catch (e) {
      print('RESET BEST SCORE ERROR: $e');
    }
  }

  //=========================================================
  // COINS
  //=========================================================

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

  //=========================================================
// DIAMONDS
//=========================================================

  static Future<int> getDiamonds() async {
    try {
      final prefs =
      await SharedPreferences.getInstance();

      return prefs.getInt(diamondsKey) ?? 0;
    } catch (e) {
      print('GET DIAMONDS ERROR: $e');
      return 0;
    }
  }

  static Future<void> saveDiamonds(
      int diamonds,
      ) async {
    try {
      final prefs =
      await SharedPreferences.getInstance();

      await prefs.setInt(
        diamondsKey,
        diamonds,
      );
    } catch (e) {
      print('SAVE DIAMONDS ERROR: $e');
    }
  }

  static Future<void> addDiamonds(
      int amount,
      ) async {
    try {
      final prefs =
      await SharedPreferences.getInstance();

      final current =
          prefs.getInt(diamondsKey) ?? 0;

      await prefs.setInt(
        diamondsKey,
        current + amount,
      );
    } catch (e) {
      print('ADD DIAMONDS ERROR: $e');
    }
  }

  static Future<bool> spendDiamonds(
      int amount,
      ) async {
    try {
      final prefs =
      await SharedPreferences.getInstance();

      final current =
          prefs.getInt(diamondsKey) ?? 0;

      if (current < amount) {
        return false;
      }

      await prefs.setInt(
        diamondsKey,
        current - amount,
      );

      return true;
    } catch (e) {
      print('SPEND DIAMONDS ERROR: $e');
      return false;
    }
  }

  //=========================================================
  // DAILY REWARD
  //=========================================================

  static Future<String?> getLastRewardDate() async {
    try {
      final prefs =
      await SharedPreferences.getInstance();

      return prefs.getString(
        lastRewardDateKey,
      );
    } catch (e) {
      print('GET REWARD DATE ERROR: $e');
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
      print('SAVE REWARD DATE ERROR: $e');
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

  //=========================================================
// THEMES
//=========================================================

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
      String themeId,
      ) async {
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
      print('GET THEMES ERROR: $e');
      return ['neon'];
    }
  }

  static Future<bool> isThemeUnlocked(
      String themeId,
      ) async {
    final themes =
    await getUnlockedThemes();

    return themes.contains(themeId);
  }

  static Future<void> unlockTheme(
      String themeId,
      ) async {
    try {
      final prefs =
      await SharedPreferences.getInstance();

      final themes =
          prefs.getStringList(
            unlockedThemesKey,
          ) ??
              ['neon'];

      if (!themes.contains(themeId)) {
        themes.add(themeId);

        await prefs.setStringList(
          unlockedThemesKey,
          themes,
        );
      }
    } catch (e) {
      print('UNLOCK THEME ERROR: $e');
    }
  }

  //=========================================================
  // GAMES PLAYED
  //=========================================================

  static Future<int> getGamesPlayed() async {
    try {
      final prefs =
      await SharedPreferences.getInstance();

      return prefs.getInt(
        gamesPlayedKey,
      ) ??
          0;
    } catch (e) {
      print(
        'GET GAMES PLAYED ERROR: $e',
      );
      return 0;
    }
  }

  static Future<void>
  incrementGamesPlayed() async {
    try {
      final prefs =
      await SharedPreferences.getInstance();

      final current =
          prefs.getInt(
            gamesPlayedKey,
          ) ??
              0;

      await prefs.setInt(
        gamesPlayedKey,
        current + 1,
      );
    } catch (e) {
      print(
        'SAVE GAMES PLAYED ERROR: $e',
      );
    }
  }

  static Future<void> addGamesPlayed(
      int amount) async {
    try {
      final prefs =
      await SharedPreferences.getInstance();

      final current =
          prefs.getInt(
            gamesPlayedKey,
          ) ??
              0;

      await prefs.setInt(
        gamesPlayedKey,
        current + amount,
      );
    } catch (e) {
      print('ADD GAMES ERROR: $e');
    }
  }

  //=========================================================
// SETTINGS
//=========================================================

  static Future<bool> getMusicEnabled() async {
    try {
      final prefs =
      await SharedPreferences.getInstance();

      return prefs.getBool(
        musicEnabledKey,
      ) ??
          true;
    } catch (e) {
      print('GET MUSIC ERROR: $e');
      return true;
    }
  }

  static Future<void> saveMusicEnabled(
      bool enabled,
      ) async {
    try {
      final prefs =
      await SharedPreferences.getInstance();

      await prefs.setBool(
        musicEnabledKey,
        enabled,
      );
    } catch (e) {
      print('SAVE MUSIC ERROR: $e');
    }
  }

  static Future<bool> getSfxEnabled() async {
    try {
      final prefs =
      await SharedPreferences.getInstance();

      return prefs.getBool(
        sfxEnabledKey,
      ) ??
          true;
    } catch (e) {
      print('GET SFX ERROR: $e');
      return true;
    }
  }

  static Future<void> saveSfxEnabled(
      bool enabled,
      ) async {
    try {
      final prefs =
      await SharedPreferences.getInstance();

      await prefs.setBool(
        sfxEnabledKey,
        enabled,
      );
    } catch (e) {
      print('SAVE SFX ERROR: $e');
    }
  }

  //=========================================================
  // HIGHEST COMBO
  //=========================================================

  static Future<int>
  getHighestCombo() async {
    try {
      final prefs =
      await SharedPreferences.getInstance();

      return prefs.getInt(
        highestComboKey,
      ) ??
          0;
    } catch (e) {
      print('GET COMBO ERROR: $e');
      return 0;
    }
  }

  static Future<void> saveHighestCombo(
      int combo) async {
    try {
      final prefs =
      await SharedPreferences.getInstance();

      final current =
          prefs.getInt(
            highestComboKey,
          ) ??
              0;

      if (combo > current) {
        await prefs.setInt(
          highestComboKey,
          combo,
        );
      }
    } catch (e) {
      print('SAVE COMBO ERROR: $e');
    }
  }

  //=========================================================
  // PERFECT PLACEMENTS
  //=========================================================

  static Future<int>
  getPerfectPlacements() async {
    try {
      final prefs =
      await SharedPreferences.getInstance();

      return prefs.getInt(
        perfectPlacementsKey,
      ) ??
          0;
    } catch (e) {
      print('GET PERFECT ERROR: $e');
      return 0;
    }
  }

  static Future<void>
  incrementPerfectPlacements() async {
    try {
      final prefs =
      await SharedPreferences.getInstance();

      final current =
          prefs.getInt(
            perfectPlacementsKey,
          ) ??
              0;

      await prefs.setInt(
        perfectPlacementsKey,
        current + 1,
      );
    } catch (e) {
      print('SAVE PERFECT ERROR: $e');
    }
  }

  static Future<void>
  addPerfectPlacements(
      int amount) async {
    try {
      final prefs =
      await SharedPreferences.getInstance();

      final current =
          prefs.getInt(
            perfectPlacementsKey,
          ) ??
              0;

      await prefs.setInt(
        perfectPlacementsKey,
        current + amount,
      );
    } catch (e) {
      print('ADD PERFECTS ERROR: $e');
    }
  }

  //=========================================================
  // ACHIEVEMENTS
  //=========================================================

  static Future<List<String>>
  getUnlockedAchievements() async {
    try {
      final prefs =
      await SharedPreferences.getInstance();

      return prefs.getStringList(
        achievementsKey,
      ) ??
          [];
    } catch (e) {
      print(
        'GET ACHIEVEMENTS ERROR: $e',
      );
      return [];
    }
  }

  static Future<bool>
  unlockAchievement(
      String achievementId) async {
    try {
      final prefs =
      await SharedPreferences.getInstance();

      final achievements =
          prefs.getStringList(
            achievementsKey,
          ) ??
              [];

      if (achievements.contains(
        achievementId,
      )) {
        return false;
      }

      achievements.add(
        achievementId,
      );

      await prefs.setStringList(
        achievementsKey,
        achievements,
      );

      return true;
    } catch (e) {
      print(
        'UNLOCK ACHIEVEMENT ERROR: $e',
      );

      return false;
    }
  }

  static Future<bool>
  isAchievementUnlocked(
      String achievementId) async {
    try {
      final achievements =
      await getUnlockedAchievements();

      return achievements.contains(
        achievementId,
      );
    } catch (e) {
      print(
        'CHECK ACHIEVEMENT ERROR: $e',
      );
      return false;
    }
  }

  static Future<void>
  resetAchievements() async {
    try {
      final prefs =
      await SharedPreferences.getInstance();

      await prefs.remove(
        achievementsKey,
      );
    } catch (e) {
      print(
        'RESET ACHIEVEMENTS ERROR: $e',
      );
    }
  }

  //=========================================================
// TEST CURRENCY
//=========================================================

  static Future<void> giveTestCurrency() async {
    try {
      await saveCoins(5000);
      await saveDiamonds(100);
    } catch (e) {
      print('TEST CURRENCY ERROR: $e');
    }
  }

  //=========================================================
// PERSONAL BEST LEADERBOARD
//=========================================================

  static Future<void> saveRunScore(
      int score,
      ) async {
    try {
      final prefs =
      await SharedPreferences.getInstance();

      final scores =
          prefs.getStringList(_topScoresKey) ?? [];

      scores.add(score.toString());

      final parsed =
      scores.map(int.parse).toList()
        ..sort(
              (a, b) => b.compareTo(a),
        );

      // Keep only top 20 scores
      if (parsed.length > 20) {
        parsed.removeRange(
          20,
          parsed.length,
        );
      }

      await prefs.setStringList(
        _topScoresKey,
        parsed
            .map(
              (e) => e.toString(),
        )
            .toList(),
      );
    } catch (e) {
      print(
        'SAVE RUN SCORE ERROR: $e',
      );
    }
  }

  static Future<List<int>> getTopScores() async {
    try {
      final prefs =
      await SharedPreferences.getInstance();

      final scores =
      (prefs.getStringList(
        _topScoresKey,
      ) ??
          [])
          .map(int.parse)
          .toList();

      final bestScore =
          prefs.getInt(bestScoreKey) ?? 0;

      if (bestScore > 0 &&
          !scores.contains(bestScore)) {
        scores.add(bestScore);
      }

      scores.sort(
            (a, b) => b.compareTo(a),
      );

      return scores;
    } catch (e) {
      print(
        'GET TOP SCORES ERROR: $e',
      );

      return [];
    }
  }

  static Future<void>
  clearTopScores() async {
    try {
      final prefs =
      await SharedPreferences.getInstance();

      await prefs.remove(
        _topScoresKey,
      );
    } catch (e) {
      print(
        'CLEAR TOP SCORES ERROR: $e',
      );
    }
  }

  //=========================================================
// ACHIEVEMENT REWARDS
//=========================================================

  static String _rewardKey(
      String achievementId,
      ) {
    return 'achievement_reward_$achievementId';
  }

  static Future<bool>
  isAchievementRewardClaimed(
      String achievementId,
      ) async {
    try {
      final prefs =
      await SharedPreferences.getInstance();

      return prefs.getBool(
        _rewardKey(
          achievementId,
        ),
      ) ??
          false;
    } catch (e) {
      print(
        'CHECK ACHIEVEMENT REWARD ERROR: $e',
      );

      return false;
    }
  }

  static Future<void>
  claimAchievementReward(
      String achievementId,
      ) async {
    try {
      final prefs =
      await SharedPreferences.getInstance();

      await prefs.setBool(
        _rewardKey(
          achievementId,
        ),
        true,
      );
    } catch (e) {
      print(
        'CLAIM ACHIEVEMENT REWARD ERROR: $e',
      );
    }
  }

  //=========================================================
// RESET GAME PROGRESS
//=========================================================

  static Future<void>
  resetGameProgress() async {
    try {
      final prefs =
      await SharedPreferences.getInstance();

      await prefs.remove(bestScoreKey);
      await prefs.remove(coinsKey);
      await prefs.remove(diamondsKey);

      await prefs.setInt(coinsKey, 0);
      await prefs.setInt(diamondsKey, 0);

      await prefs.remove(
        selectedThemeKey,
      );

      await prefs.remove(
        unlockedThemesKey,
      );

      await prefs.remove(
        lastRewardDateKey,
      );
      await prefs.remove(
        rewardDayKey,
      );

      await prefs.remove(
        gamesPlayedKey,
      );

      await prefs.remove(
        highestComboKey,
      );

      await prefs.remove(
        perfectPlacementsKey,
      );

      await prefs.remove(
        achievementsKey,
      );

      await prefs.remove(
        _topScoresKey,
      );

      final keys = prefs.getKeys();

      for (final key in keys) {
        if (key.startsWith(
          'achievement_reward_',
        )) {
          await prefs.remove(key);
        }
      }

    } catch (e) {
      print(
        'RESET GAME PROGRESS ERROR: $e',
      );
    }
  }

  //=========================================================
  // RESET ALL
  //=========================================================

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