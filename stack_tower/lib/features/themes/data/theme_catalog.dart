import 'package:flutter/material.dart';

import '../models/game_theme.dart';

class ThemeCatalog {
  static const themes = <GameTheme>[
    GameTheme(
      id: 'neon',
      name: 'Neon',
      cost: 0,
      primary: Color(0xFF00E5FF),
      secondary: Color(0xFF00BCD4),
      glow: Color(0xFF00E5FF),
    ),

    GameTheme(
      id: 'purple',
      name: 'Purple Storm',
      cost: 1000,
      primary: Color(0xFFB388FF),
      secondary: Color(0xFF7C4DFF),
      glow: Color(0xFF9C27B0),
    ),

    GameTheme(
      id: 'emerald',
      name: 'Emerald',
      cost: 2500,
      primary: Color(0xFF00E676),
      secondary: Color(0xFF00C853),
      glow: Color(0xFF69F0AE),
    ),

    GameTheme(
      id: 'lava',
      name: 'Lava',
      cost: 5000,
      primary: Color(0xFFFF7043),
      secondary: Color(0xFFFF3D00),
      glow: Color(0xFFFF5722),
    ),

    GameTheme(
      id: 'galaxy',
      name: 'Galaxy',
      cost: 10000,
      primary: Color(0xFF7C4DFF),
      secondary: Color(0xFF00E5FF),
      glow: Color(0xFFE040FB),
    ),
  ];

  static GameTheme getById(String id) {
    return themes.firstWhere(
          (theme) => theme.id == id,
      orElse: () => themes.first,
    );
  }
}