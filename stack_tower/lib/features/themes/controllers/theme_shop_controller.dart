import 'package:flutter/material.dart';

import '../../../core/services/storage/storage_service.dart';
import '../data/theme_catalog.dart';

class ThemeShopController {
  final ValueNotifier<int> coins =
  ValueNotifier(0);

  final ValueNotifier<String> selectedTheme =
  ValueNotifier('neon');

  final ValueNotifier<List<String>>
  unlockedThemes =
  ValueNotifier(['neon']);

  Future<void> initialize() async {
    coins.value =
    await StorageService.getCoins();

    selectedTheme.value =
    await StorageService.getSelectedTheme();

    unlockedThemes.value =
    await StorageService.getUnlockedThemes();
  }

  bool isUnlocked(String id) {
    return unlockedThemes.value.contains(id);
  }

  Future<bool> buyTheme(String id) async {
    final theme =
    ThemeCatalog.getById(id);

    if (isUnlocked(id)) {
      return true;
    }

    final success =
    await StorageService.spendCoins(
      theme.cost,
    );

    if (!success) {
      return false;
    }

    await StorageService.unlockTheme(id);

    unlockedThemes.value =
    await StorageService.getUnlockedThemes();

    coins.value =
    await StorageService.getCoins();

    return true;
  }

  Future<void> equipTheme(String id) async {
    await StorageService.saveSelectedTheme(
      id,
    );

    selectedTheme.value = id;
  }

  void dispose() {
    coins.dispose();
    selectedTheme.dispose();
    unlockedThemes.dispose();
  }
}