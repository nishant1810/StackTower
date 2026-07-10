import 'package:flutter/material.dart';

import '../../../core/services/storage/storage_service.dart';
import '../data/theme_catalog.dart';

class ThemeController extends ChangeNotifier {
  static final ThemeController instance =
  ThemeController._();

  ThemeController._();

  String _themeId = 'space';

  String get themeId => _themeId;

  List<Color> get palette =>
      ThemeCatalog.getPalette(_themeId);

  Color get primary =>
      palette.first;

  Color get secondary =>
      palette.last;

  Future<void> loadTheme() async {
    _themeId =
    await StorageService.getSelectedTheme();

    notifyListeners();
  }

  Future<void> changeTheme(
      String themeId) async {
    _themeId = themeId;

    await StorageService.saveSelectedTheme(
      themeId,
    );

    notifyListeners();
  }
}