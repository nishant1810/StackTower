import 'package:flutter/material.dart';

import '../../../core/assets/app_assets.dart';
import '../models/game_theme.dart';

class ThemeCatalog {
  static const List<GameTheme> themes = [
    GameTheme(
      id: 'neon',
      name: 'Neon Blue',
      previewImage: AppAssets.neonTheme,
      coinCost: 0,
      diamondCost: 0,
      isPremium: false,
      colors: [
        Color(0xFF00E5FF),
        Color(0xFF00B0FF),
        Color(0xFF2979FF),
        Color(0xFF7C4DFF),
        Color(0xFFFF4081),
      ],
    ),

    GameTheme(
      id: 'purple',
      name: 'Cyber Purple',
      previewImage: AppAssets.purpleStormTheme,
      coinCost: 500,
      diamondCost: 0,
      isPremium: false,
      colors: [
        Color(0xFF7C4DFF),
        Color(0xFF9C27B0),
        Color(0xFFBA68C8),
        Color(0xFF673AB7),
        Color(0xFFE1BEE7),
      ],
    ),

    GameTheme(
      id: 'emerald',
      name: 'Emerald Glow',
      previewImage: AppAssets.emeraldGlowTheme,
      coinCost: 1000,
      diamondCost: 0,
      isPremium: false,
      colors: [
        Color(0xFF00E676),
        Color(0xFF00C853),
        Color(0xFF69F0AE),
        Color(0xFF2E7D32),
        Color(0xFFA5D6A7),
      ],
    ),

    GameTheme(
      id: 'lava',
      name: 'Lava Core',
      previewImage: AppAssets.lavaTheme,
      coinCost: 0,
      diamondCost: 100,
      isPremium: true,
      colors: [
        Color(0xFFFF3D00),
        Color(0xFFFF6D00),
        Color(0xFFFF9100),
        Color(0xFFFFAB40),
        Color(0xFFFF5722),
      ],
    ),

    GameTheme(
      id: 'galaxy',
      name: 'Galaxy',
      previewImage: AppAssets.galaxyTheme,
      coinCost: 0,
      diamondCost: 250,
      isPremium: true,
      colors: [
        Color(0xFF1A237E),
        Color(0xFF283593),
        Color(0xFF512DA8),
        Color(0xFF7B1FA2),
        Color(0xFFE040FB),
      ],
    ),
  ];

  static const Map<String, List<Color>> palettes = {
    'neon': [
      Color(0xFF00E5FF),
      Color(0xFF00B0FF),
      Color(0xFF2979FF),
      Color(0xFF7C4DFF),
      Color(0xFFFF4081),
    ],

    'purple': [
      Color(0xFF7C4DFF),
      Color(0xFF9C27B0),
      Color(0xFFBA68C8),
      Color(0xFF673AB7),
      Color(0xFFE1BEE7),
    ],

    'emerald': [
      Color(0xFF00E676),
      Color(0xFF00C853),
      Color(0xFF69F0AE),
      Color(0xFF2E7D32),
      Color(0xFFA5D6A7),
    ],

    'lava': [
      Color(0xFFFF3D00),
      Color(0xFFFF6D00),
      Color(0xFFFF9100),
      Color(0xFFFFAB40),
      Color(0xFFFF5722),
    ],

    'galaxy': [
      Color(0xFF1A237E),
      Color(0xFF283593),
      Color(0xFF512DA8),
      Color(0xFF7B1FA2),
      Color(0xFFE040FB),
    ],
  };

  static List<Color> getPalette(String themeId) {
    return palettes[themeId] ?? palettes['neon']!;
  }
}