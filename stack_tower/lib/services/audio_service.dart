import 'package:flame_audio/flame_audio.dart';
import 'settings_service.dart';

class AudioService {
  static bool _initialized = false;
  static bool _bgmStarted = false;

  static Future<void> initialize() async {
    if (_initialized) return;

    try {
      await FlameAudio.audioCache.loadAll([
        'bg_music.wav',
        'drop.wav',
        'perfect.wav',
        'game_over.wav',
      ]);

      await FlameAudio.bgm.initialize();

      _initialized = true;
    } catch (e) {
      print('AUDIO INIT ERROR: $e');
    }
  }

  /// Background Music
  static Future<void> startBackgroundMusic() async {
    if (!SettingsService.musicEnabled) return;

    await initialize();

    if (_bgmStarted) return;

    try {
      await FlameAudio.bgm.play(
        'bg_music.wav',
        volume: 0.35,
      );

      _bgmStarted = true;
    } catch (e) {
      print('BGM ERROR: $e');
    }
  }

  static Future<void> stopBackgroundMusic() async {
    try {
      await FlameAudio.bgm.stop();
      _bgmStarted = false;
    } catch (e) {
      print('BGM STOP ERROR: $e');
    }
  }

  static Future<void> pauseBackgroundMusic() async {
    try {
      await FlameAudio.bgm.pause();
    } catch (e) {
      print('BGM PAUSE ERROR: $e');
    }
  }

  static Future<void> resumeBackgroundMusic() async {
    if (!SettingsService.musicEnabled) return;

    try {
      await FlameAudio.bgm.resume();
    } catch (e) {
      print('BGM RESUME ERROR: $e');
    }
  }

  /// Drop Sound
  static Future<void> playDrop() async {
    if (!SettingsService.soundEnabled) return;

    try {
      await FlameAudio.play(
        'drop.wav',
        volume: 0.7,
      );
    } catch (e) {
      print('DROP ERROR: $e');
    }
  }

  /// Perfect Sound
  static Future<void> playPerfect() async {
    if (!SettingsService.soundEnabled) return;

    try {
      await FlameAudio.play(
        'perfect.wav',
        volume: 1.0,
      );
    } catch (e) {
      print('PERFECT ERROR: $e');
    }
  }

  /// Game Over Sound
  static Future<void> playGameOver() async {
    if (!SettingsService.soundEnabled) return;

    try {
      await FlameAudio.play(
        'game_over.wav',
        volume: 1.0,
      );
    } catch (e) {
      print('GAME OVER ERROR: $e');
    }
  }
}