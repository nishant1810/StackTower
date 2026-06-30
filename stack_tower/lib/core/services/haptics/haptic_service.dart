import 'package:vibration/vibration.dart';

class HapticService {
  HapticService._();

  static Future<void> light() async {
    if (await Vibration.hasVibrator() ?? false) {
      await Vibration.vibrate(
        duration: 20,
        amplitude: 80,
      );
    }
  }

  static Future<void> medium() async {
    if (await Vibration.hasVibrator() ?? false) {
      await Vibration.vibrate(
        duration: 40,
        amplitude: 150,
      );
    }
  }

  static Future<void> heavy() async {
    if (await Vibration.hasVibrator() ?? false) {
      await Vibration.vibrate(
        duration: 80,
        amplitude: 255,
      );
    }
  }

  // Compatibility aliases
  static Future<void> lightImpact() async {
    await light();
  }

  static Future<void> mediumImpact() async {
    await medium();
  }

  static Future<void> heavyImpact() async {
    await heavy();
  }
}