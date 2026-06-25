import '../services/audio_service.dart';
import '../services/storage_service.dart';

class AppInitializer {
  AppInitializer._();

  static Future<void> initialize() async {
    // Load local storage
    await StorageService.initialize();

    // Initialize audio
    await AudioService.initialize();

    // Future additions:
    // await ThemeService.initialize();
    // await AnalyticsService.initialize();
    // await AdService.initialize();
  }
}