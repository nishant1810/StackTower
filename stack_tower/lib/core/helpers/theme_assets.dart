import '../assets/app_assets.dart';

class ThemeAssets {
  static String getGameplayBg(String themeId) {
    switch (themeId) {
      case 'neon':
        return AppAssets.neonGameplayBg;

      case 'purple':
        return AppAssets.purpleGameplayBg;

      case 'emerald':
        return AppAssets.emeraldGameplayBg;

      case 'lava':
        return AppAssets.lavaGameplayBg;

      case 'galaxy':
        return AppAssets.galaxyGameplayBg;

      default:
        return AppAssets.spaceGameplayBg;
    }
  }

  static String getGameOverBg(String themeId) {
    switch (themeId) {
      case 'neon':
        return AppAssets.neonGameOver;

      case 'purple':
        return AppAssets.purpleGameOver;

      case 'emerald':
        return AppAssets.emeraldGameOver;

      case 'lava':
        return AppAssets.lavaGameOver;

      case 'galaxy':
        return AppAssets.galaxyGameOver;

      default:
        return AppAssets.skyGameOver;
    }
  }
}