import 'package:vibration/vibration.dart';

class HapticService {
  static Future<void> light() async {
    if (await Vibration.hasVibrator() ?? false) {
      Vibration.vibrate(
        duration: 20,
        amplitude: 80,
      );
    }
  }

  static Future<void> medium() async {
    if (await Vibration.hasVibrator() ?? false) {
      Vibration.vibrate(
        duration: 40,
        amplitude: 150,
      );
    }
  }

  static Future<void> heavy() async {
    if (await Vibration.hasVibrator() ?? false) {
      Vibration.vibrate(
        duration: 80,
        amplitude: 255,
      );
    }
  }
}