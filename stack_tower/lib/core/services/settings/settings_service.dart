import 'package:shared_preferences/shared_preferences.dart';

class SettingsService {
  static const String musicKey = 'musicEnabled';
  static const String soundKey = 'soundEnabled';
  static const String vibrationKey = 'vibrationEnabled';

  static bool musicEnabled = true;
  static bool soundEnabled = true;
  static bool vibrationEnabled = true;

  static Future<void> load() async {
    try {
      final prefs =
      await SharedPreferences.getInstance();

      musicEnabled =
          prefs.getBool(musicKey) ?? true;

      soundEnabled =
          prefs.getBool(soundKey) ?? true;

      vibrationEnabled =
          prefs.getBool(vibrationKey) ?? true;
    } catch (e) {
      print('SETTINGS LOAD ERROR: $e');
    }
  }

  static Future<void> setMusic(bool value) async {
    try {
      musicEnabled = value;

      final prefs =
      await SharedPreferences.getInstance();

      await prefs.setBool(
        musicKey,
        value,
      );
    } catch (e) {
      print('SET MUSIC ERROR: $e');
    }
  }

  static Future<void> setSound(bool value) async {
    try {
      soundEnabled = value;

      final prefs =
      await SharedPreferences.getInstance();

      await prefs.setBool(
        soundKey,
        value,
      );
    } catch (e) {
      print('SET SOUND ERROR: $e');
    }
  }

  static Future<void> setVibration(
      bool value) async {
    try {
      vibrationEnabled = value;

      final prefs =
      await SharedPreferences.getInstance();

      await prefs.setBool(
        vibrationKey,
        value,
      );
    } catch (e) {
      print('SET VIBRATION ERROR: $e');
    }
  }
}