import '../../services/audio_service.dart';
import '../../services/storage_service.dart';

class SplashInitializer {
  SplashInitializer._();

  static Future<void> initialize() async {
    await Future.wait([
      StorageService.initialize(),
      AudioService.initialize(),
    ]);
  }
}