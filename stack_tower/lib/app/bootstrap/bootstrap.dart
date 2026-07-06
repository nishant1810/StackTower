import 'package:firebase_core/firebase_core.dart';

import '../../core/services/ads/ad_service.dart';
import '../../core/services/audio/audio_service.dart';
import '../../core/services/storage/storage_service.dart';

Future<void> bootstrap() async {
  await Firebase.initializeApp();

  await AudioService.initialize();

  AudioService.setSoundEnabled(
    await StorageService.getSfxEnabled(),
  );

  await AudioService.setMusicEnabled(
    await StorageService.getMusicEnabled(),
  );

  await AdService.initialize();
}