import 'package:flutter/material.dart';

import '../../../core/assets/app_assets.dart';
import '../models/theme_data.dart';

const themes = [
  GameTheme(
    id: "neon",
    name: "Neon Blue",
    cost: 0,
    previewImage: AppAssets.neonTheme,
    colors: [
      Color(0xFF3B82F6),
      Color(0xFF06B6D4),
    ],
  ),

  GameTheme(
    id: "purple",
    name: "Cyber Purple",
    cost: 500,
    previewImage: AppAssets.purpleStormTheme,
    colors: [
      Color(0xFF8B5CF6),
      Color(0xFFEC4899),
    ],
  ),

  GameTheme(
    id: "emerald",
    name: "Emerald",
    cost: 1200,
    previewImage: AppAssets.emeraldGlowTheme,
    colors: [
      Color(0xFF22C55E),
      Color(0xFF10B981),
    ],
  ),

  GameTheme(
    id: "lava",
    name: "Lava",
    cost: 2500,
    previewImage: AppAssets.lavaTheme,
    colors: [
      Color(0xFFF97316),
      Color(0xFFEF4444),
    ],
  ),

  GameTheme(
    id: "galaxy",
    name: "Galaxy",
    cost: 5000,
    previewImage: AppAssets.galaxyTheme,
    colors: [
      Color(0xFF8B5CF6),
      Color(0xFFEC4899),
      Color(0xFF3B82F6),
    ],
  ),
];