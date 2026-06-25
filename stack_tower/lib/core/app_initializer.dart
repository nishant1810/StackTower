import '../services/audio_service.dart';
import '../services/settings_service.dart';

class AppInitializer {
  AppInitializer._();

  static Future<void> initialize() async {
    await SettingsService.load();
    await AudioService.initialize();
  }
}