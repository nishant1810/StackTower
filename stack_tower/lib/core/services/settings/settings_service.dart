import 'package:shared_preferences/shared_preferences.dart';

class SettingsService {
  SettingsService._();

  static const String musicKey = 'musicEnabled';
  static const String soundKey = 'soundEnabled';
  static const String vibrationKey = 'vibrationEnabled';

  static SharedPreferences? _prefs;

  static bool musicEnabled = true;
  static bool soundEnabled = true;
  static bool vibrationEnabled = true;

  //=========================================================
  // INITIALIZE
  //=========================================================

  static Future<void> load() async {
    try {
      _prefs ??= await SharedPreferences.getInstance();

      musicEnabled =
          _prefs!.getBool(musicKey) ?? true;

      soundEnabled =
          _prefs!.getBool(soundKey) ?? true;

      vibrationEnabled =
          _prefs!.getBool(vibrationKey) ?? true;
    } catch (e) {
      print('SETTINGS LOAD ERROR: $e');
    }
  }

  //=========================================================
  // MUSIC
  //=========================================================

  static Future<void> setMusic(bool value) async {
    try {
      musicEnabled = value;

      _prefs ??= await SharedPreferences.getInstance();

      await _prefs!.setBool(
        musicKey,
        value,
      );
    } catch (e) {
      print('SET MUSIC ERROR: $e');
    }
  }

  //=========================================================
  // SOUND
  //=========================================================

  static Future<void> setSound(bool value) async {
    try {
      soundEnabled = value;

      _prefs ??= await SharedPreferences.getInstance();

      await _prefs!.setBool(
        soundKey,
        value,
      );
    } catch (e) {
      print('SET SOUND ERROR: $e');
    }
  }

  //=========================================================
  // VIBRATION
  //=========================================================

  static Future<void> setVibration(bool value) async {
    try {
      vibrationEnabled = value;

      _prefs ??= await SharedPreferences.getInstance();

      await _prefs!.setBool(
        vibrationKey,
        value,
      );
    } catch (e) {
      print('SET VIBRATION ERROR: $e');
    }
  }

  //=========================================================
  // GETTERS
  //=========================================================

  static bool get isMusicEnabled =>
      musicEnabled;

  static bool get isSoundEnabled =>
      soundEnabled;

  static bool get isVibrationEnabled =>
      vibrationEnabled;

  //=========================================================
  // RESET
  //=========================================================

  static Future<void> reset() async {
    try {
      _prefs ??= await SharedPreferences.getInstance();

      musicEnabled = true;
      soundEnabled = true;
      vibrationEnabled = true;

      await _prefs!.setBool(musicKey, true);
      await _prefs!.setBool(soundKey, true);
      await _prefs!.setBool(vibrationKey, true);
    } catch (e) {
      print('SETTINGS RESET ERROR: $e');
    }
  }
}