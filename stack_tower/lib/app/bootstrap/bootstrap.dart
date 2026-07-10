import 'package:firebase_core/firebase_core.dart';

import '../../features/themes/controllers/theme_controller.dart';
import '../../core/services/ads/ad_service.dart';
import '../../core/services/ads/rewarded_ad_service.dart';
import '../../core/services/audio/audio_service.dart';
import '../../core/services/storage/storage_service.dart';
import '../../core/services/purchase/purchase_service.dart';

Future<void> bootstrap() async {
  await Firebase.initializeApp();

  // Storage
  // await StorageService.initialize();

  // Theme
  await ThemeController.instance.loadTheme();

  // Audio
  await AudioService.initialize();

  AudioService.setSoundEnabled(
    await StorageService.getSfxEnabled(),
  );

  await AudioService.setMusicEnabled(
    await StorageService.getMusicEnabled(),
  );

  // Ads
  await AdService.initialize();

  // Preload rewarded ad
  await RewardedAdService.loadAd();

  // In-App Purchases
  await PurchaseService.instance.initialize();
}