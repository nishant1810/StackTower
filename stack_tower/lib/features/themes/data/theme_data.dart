import 'package:flutter/material.dart';

import '../../../core/assets/app_assets.dart';
import '../models/theme_data.dart';

const themes = [
  GameTheme(
    id: "sky",
    name: "Sky Citadel",
    cost: 0,
    previewImage: AppAssets.skyTheme,
    colors: [
      Color(0xFF3B82F6),
      Color(0xFF06B6D4),
    ],
  ),

  GameTheme(
    id: "neon",
    name: "Neon Cyber",
    cost: 500,
    previewImage: AppAssets.neonTheme,
    colors: [
      Color(0xFF3B82F6),
      Color(0xFF06B6D4),
    ],
  ),

  GameTheme(
    id: "purple",
    name: "Purple Crystal Storm",
    cost: 1000,
    previewImage: AppAssets.purpleStormTheme,
    colors: [
      Color(0xFF8B5CF6),
      Color(0xFFEC4899),
    ],
  ),

  GameTheme(
    id: "emerald",
    name: "Emerald Crystal",
    cost: 1500,
    previewImage: AppAssets.emeraldGlowTheme,
    colors: [
      Color(0xFF22C55E),
      Color(0xFF10B981),
    ],
  ),

  GameTheme(
    id: "lava",
    name: "Lava Inferno",
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