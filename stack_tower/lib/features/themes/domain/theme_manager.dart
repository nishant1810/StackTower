import '../../../core/services/storage/storage_service.dart';

class ThemeManager {
  ThemeManager._();

  static Future<String> getSelectedTheme() async {
    return await StorageService.getSelectedTheme();
  }

  static Future<void> equipTheme(
      String themeId,
      ) async {
    await StorageService.saveSelectedTheme(
      themeId,
    );
  }

  static Future<bool> isUnlocked(
      String themeId,
      ) async {
    return await StorageService
        .isThemeUnlocked(themeId);
  }

  static Future<bool> unlockTheme(
      String themeId,
      ) async {
    return await StorageService
        .unlockTheme(themeId);
  }
}