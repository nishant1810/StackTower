import 'package:flutter/material.dart';

import '../../../core/assets/app_assets.dart';
import '../models/game_theme.dart';

const themes = [
  GameTheme(
    id: "sky",
    name: "Sky Citadel",
    coinCost: 0,
    diamondCost: 0,
    isPremium: false,
    previewImage: AppAssets.skyTheme,
    colors: [
      Color(0xFF3B82F6),
      Color(0xFF06B6D4),
    ],
  ),
  GameTheme(
    id: "neon",
    name: "Neon Cyber",
    coinCost: 500,
    diamondCost: 0,
    isPremium: false,
    previewImage: AppAssets.neonTheme,
    colors: [
      Color(0xFF3B82F6),
      Color(0xFF06B6D4),
    ],
  ),
  GameTheme(
    id: "purple",
    name: "Purple Crystal Storm",
    coinCost: 1000,
    diamondCost: 0,
    isPremium: false,
    previewImage: AppAssets.purpleTheme,
    colors: [
      Color(0xFF8B5CF6),
      Color(0xFFEC4899),
    ],
  ),
  GameTheme(
    id: "emerald",
    name: "Emerald Crystal",
    coinCost: 1500,
    diamondCost: 0,
    isPremium: false,
    previewImage: AppAssets.emeraldTheme,
    colors: [
      Color(0xFF22C55E),
      Color(0xFF10B981),
    ],
  ),
  GameTheme(
    id: "lava",
    name: "Lava Inferno",
    coinCost: 2500,
    diamondCost: 0,
    isPremium: false,
    previewImage: AppAssets.lavaTheme,
    colors: [
      Color(0xFFF97316),
      Color(0xFFEF4444),
    ],
  ),
  GameTheme(
    id: "galaxy",
    name: "Galaxy",
    coinCost: 5000,
    diamondCost: 0,
    isPremium: false,
    previewImage: AppAssets.galaxyTheme,
    colors: [
      Color(0xFF8B5CF6),
      Color(0xFFEC4899),
      Color(0xFF3B82F6),
    ],
  ),
];
