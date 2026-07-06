import 'package:flutter/material.dart';

import '../../../core/services/storage/storage_service.dart';
import '../models/game_theme.dart';

class ThemesController extends ChangeNotifier {
  String selectedTheme = 'neon';

  List<String> unlockedThemes = [];

  int coins = 0;
  int diamonds = 0;

  Future<void> load() async {
    selectedTheme =
    await StorageService.getSelectedTheme();

    unlockedThemes =
    await StorageService.getUnlockedThemes();

    coins =
    await StorageService.getCoins();

    diamonds =
    await StorageService.getDiamonds();

    // Ensure default theme is always unlocked
    if (!unlockedThemes.contains('neon')) {
      unlockedThemes.add('neon');

      await StorageService.unlockTheme(
        'neon',
      );
    }

    notifyListeners();
  }

  Future<void> selectTheme(
      String themeId,
      ) async {
    if (!unlockedThemes.contains(themeId)) {
      return;
    }

    selectedTheme = themeId;

    await StorageService.saveSelectedTheme(
      themeId,
    );

    notifyListeners();
  }

  Future<bool> buyTheme(
      GameTheme theme,
      ) async {
    if (unlockedThemes.contains(theme.id)) {
      return true;
    }

    if (theme.isPremium) {
      if (diamonds < theme.diamondCost) {
        return false;
      }

      diamonds -= theme.diamondCost;

      await StorageService.saveDiamonds(
        diamonds,
      );
    } else {
      if (coins < theme.coinCost) {
        return false;
      }

      coins -= theme.coinCost;

      await StorageService.saveCoins(
        coins,
      );
    }

    unlockedThemes.add(theme.id);

    await StorageService.unlockTheme(
      theme.id,
    );

    notifyListeners();

    return true;
  }
}