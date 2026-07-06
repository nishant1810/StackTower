// import 'package:vibration/vibration.dart';
// import '../storage/storage_service.dart';
//
// class HapticService {
//   HapticService._();
//
//   static Future<bool> _canVibrate() async {
//     final enabled =
//     await StorageService.getVibrationEnabled();
//
//     if (!enabled) return false;
//
//     return await Vibration.hasVibrator() ?? false;
//   }
//
//   static Future<void> light() async {
//     if (!await _canVibrate()) return;
//
//     await Vibration.cancel();
//
//     await Vibration.vibrate(
//       duration: 15,
//     );
//   }
//
//   static Future<void> medium() async {
//     if (!await _canVibrate()) return;
//
//     await Vibration.cancel();
//
//     await Vibration.vibrate(
//       duration: 25,
//     );
//   }
//
//   static Future<void> heavy() async {
//     if (!await _canVibrate()) return;
//
//     await Vibration.cancel();
//
//     await Vibration.vibrate(
//       duration: 40,
//     );
//   }
// }