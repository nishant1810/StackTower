import 'dart:math';
import 'package:flutter/material.dart';

class ThemeManager {
  static final Random _random = Random();

  /// Theme block palette
  static List<Color> getPalette(
      String themeId,
      ) {
    switch (themeId) {
      case "purple":
        return [
          const Color(0xFF8B5CF6),
          const Color(0xFFA855F7),
          const Color(0xFFEC4899),
        ];

      case "emerald":
        return [
          const Color(0xFF10B981),
          const Color(0xFF22C55E),
          const Color(0xFF34D399),
        ];

      case "lava":
        return [
          const Color(0xFFF97316),
          const Color(0xFFEF4444),
          const Color(0xFFDC2626),
        ];

      case "galaxy":
        return [
          const Color(0xFF8B5CF6),
          const Color(0xFFEC4899),
          const Color(0xFF3B82F6),
          const Color(0xFF06B6D4),
          Colors.white,
        ];

      default:
        return [
          const Color(0xFF3B82F6),
          const Color(0xFF06B6D4),
          const Color(0xFF22C55E),
          const Color(0xFFEAB308),
          const Color(0xFFF97316),
          const Color(0xFFEF4444),
          const Color(0xFFEC4899),
          const Color(0xFF8B5CF6),
        ];
    }
  }

  /// Particle colors
  static Color getParticleColor(
      String themeId,
      ) {
    switch (themeId) {
      case "purple":
        return const Color(0xFF8B5CF6);

      case "emerald":
        return const Color(0xFF10B981);

      case "lava":
        return const Color(0xFFF97316);

      case "galaxy":
        final galaxyColors = [
          const Color(0xFF8B5CF6),
          const Color(0xFFEC4899),
          const Color(0xFF3B82F6),
          const Color(0xFF06B6D4),
          Colors.white,
        ];

        return galaxyColors[
        _random.nextInt(
          galaxyColors.length,
        )];

      default:
        return const Color(0xFF3B82F6);
    }
  }

  /// Glow multiplier
  static double getGlowStrength(
      String themeId,
      ) {
    switch (themeId) {
      case "lava":
        return 1.5;

      case "galaxy":
        return 2.0;

      default:
        return 1.0;
    }
  }

  /// PERFECT text color
  static Color getPerfectTextColor(
      String themeId,
      ) {
    switch (themeId) {
      case "purple":
        return const Color(0xFF8B5CF6);

      case "emerald":
        return const Color(0xFF10B981);

      case "lava":
        return const Color(0xFFF97316);

      case "galaxy":
        return Colors.white;

      default:
        return Colors.amber;
    }
  }
}