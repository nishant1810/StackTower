import '../data/theme_catalog.dart';
import '../models/game_theme.dart';
import '../../../core/services/storage/storage_service.dart';

class ThemeManager {
  static Future<GameTheme> currentTheme() async {
    final themeId =
    await StorageService.getSelectedTheme();

    return ThemeCatalog.getById(themeId);
  }
}