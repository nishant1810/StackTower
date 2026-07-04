import '../di/injector.dart';

import '../../core/services/ads/ad_service.dart';
import '../../core/services/audio/audio_service.dart';
import '../../core/services/settings/settings_service.dart';
import '../../core/services/vibration/vibration_service.dart';

Future<void> bootstrap() async {
  await setupDependencies();

  await SettingsService.load();

  await AdService.initialize();

  await VibrationService.initialize();
}