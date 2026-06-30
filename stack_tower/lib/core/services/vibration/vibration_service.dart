import 'package:vibration/vibration.dart';

import '../storage/storage_service.dart';

class VibrationService {
  VibrationService._();

  static Future<void> light() async {
    final enabled =
    await StorageService.getVibrationEnabled();

    if (!enabled) return;

    if (await Vibration.hasVibrator() ?? false) {
      Vibration.vibrate(duration: 20);
    }
  }

  static Future<void> medium() async {
    final enabled =
    await StorageService.getVibrationEnabled();

    if (!enabled) return;

    if (await Vibration.hasVibrator() ?? false) {
      Vibration.vibrate(duration: 50);
    }
  }

  static Future<void> heavy() async {
    final enabled =
    await StorageService.getVibrationEnabled();

    if (!enabled) return;

    if (await Vibration.hasVibrator() ?? false) {
      Vibration.vibrate(duration: 120);
    }
  }
}