import 'package:flutter/material.dart';

import '../models/game_theme.dart';

class ThemeCatalog {
  ThemeCatalog._();

  static const List<GameTheme> themes = [
    GameTheme(
      id: 'sky',
      name: 'Sky Citadel',
      previewImage: 'assets/images/sky_theme.webp',
      coinCost: 0,
      diamondCost: 0,
      isPremium: false,
      colors: [
        Color(0xFFE3F2FD),
        Color(0xFF42A5F5),
      ],
    ),
    GameTheme(
      id: 'neon',
      name: 'Neon',
      previewImage: 'assets/images/neon_theme.webp',
      coinCost: 1000,
      diamondCost: 0,
      isPremium: false,
      colors: [
        Color(0xFF00E5FF),
        Color(0xFF2979FF),
      ],
    ),
    GameTheme(
      id: 'purple',
      name: 'Purple Storm',
      previewImage: 'assets/images/purple_theme.webp',
      coinCost: 2000,
      diamondCost: 0,
      isPremium: false,
      colors: [
        Color(0xFFB388FF),
        Color(0xFF7C4DFF),
      ],
    ),
    GameTheme(
      id: 'emerald',
      name: 'Emerald Realm',
      previewImage: 'assets/images/emerald_theme.webp',
      coinCost: 3000,
      diamondCost: 0,
      isPremium: false,
      colors: [
        Color(0xFF69F0AE),
        Color(0xFF00C853),
      ],
    ),
    GameTheme(
      id: 'lava',
      name: 'Lava Inferno',
      previewImage: 'assets/images/lava_theme.webp',
      coinCost: 0,
      diamondCost: 50,
      isPremium: true,
      colors: [
        Color(0xFFFFAB40),
        Color(0xFFD50000),
      ],
    ),
    GameTheme(
      id: 'galaxy',
      name: 'Galaxy Nexus',
      previewImage: 'assets/images/galaxy_theme.webp',
      coinCost: 0,
      diamondCost: 100,
      isPremium: true,
      colors: [
        Color(0xFF7C4DFF),
        Color(0xFF00B0FF),
      ],
    ),
  ];

  static List<Color> getPalette(String themeId) {
    return themes
        .firstWhere(
          (theme) => theme.id == themeId,
      orElse: () => themes.first,
    )
        .colors;
  }
}