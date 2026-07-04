import 'package:vibration/vibration.dart';

import '../settings/settings_service.dart';

class VibrationService {
  VibrationService._();

  static Future<void> initialize() async {}

  static Future<void> light() async {
    if (!SettingsService.isVibrationEnabled) return;

    final hasVibrator =
        await Vibration.hasVibrator() ?? false;

    if (!hasVibrator) return;

    await Vibration.vibrate(
      duration: 20,
    );
  }

  static Future<void> medium() async {
    if (!SettingsService.isVibrationEnabled) return;

    final hasVibrator =
        await Vibration.hasVibrator() ?? false;

    if (!hasVibrator) return;

    await Vibration.vibrate(
      duration: 50,
    );
  }

  static Future<void> heavy() async {
    if (!SettingsService.isVibrationEnabled) return;

    final hasVibrator =
        await Vibration.hasVibrator() ?? false;

    if (!hasVibrator) return;

    await Vibration.vibrate(
      duration: 100,
    );
  }
}