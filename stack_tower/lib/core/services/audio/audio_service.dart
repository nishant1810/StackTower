import 'package:flame_audio/flame_audio.dart';

class AudioService {
  AudioService._();

  static bool _initialized = false;
  static bool _musicEnabled = true;
  static bool _soundEnabled = true;
  static bool _musicStarted = false;

  static DateTime? _lastDropTime;

  static bool get musicEnabled => _musicEnabled;
  static bool get soundEnabled => _soundEnabled;

  // ==========================================
  // INITIALIZE
  // ==========================================

  static Future<void> initialize() async {
    if (_initialized) return;

    await FlameAudio.audioCache.loadAll([
      'bg_music.mp3',
      // 'drop.mp3',
      'game_over.mp3',
      'perfect.mp3',
    ]);

    await FlameAudio.bgm.initialize();

    _initialized = true;
  }

  // ==========================================
  // MUSIC
  // ==========================================

  static Future<void> setMusicEnabled(bool enabled) async {
    _musicEnabled = enabled;

    if (enabled) {
      await startBackgroundMusic();
    } else {
      await stopBackgroundMusic();
    }
  }

  static Future<void> startBackgroundMusic() async {
    if (!_musicEnabled) return;
    if (_musicStarted) return;

    try {
      _musicStarted = true;

      FlameAudio.bgm.play(
        'bg_music.mp3',
        volume: 0.35,
      );
    } catch (_) {
      _musicStarted = false;
    }
  }

  static Future<void> stopBackgroundMusic() async {
    try {
      _musicStarted = false;
      await FlameAudio.bgm.stop();
    } catch (_) {}
  }

  // ==========================================
  // SOUND SETTINGS
  // ==========================================

  static void setSoundEnabled(bool enabled) {
    _soundEnabled = enabled;
  }

  // ==========================================
  // SOUND EFFECTS
  // ==========================================

  // static Future<void> playDrop() async {
  //   if (!_soundEnabled) return;
  //
  //   final now = DateTime.now();
  //
  //   if (_lastDropTime != null &&
  //       now.difference(_lastDropTime!).inMilliseconds < 60) {
  //     return;
  //   }
  //
  //   _lastDropTime = now;
  //
  //   try {
  //     FlameAudio.play(
  //       'drop.mp3',
  //       volume: 0.8,
  //     );
  //   } catch (_) {}
  // }

  static void playPerfect() {
    print("PERFECT SOUND CALLED");

    if (!_soundEnabled) return;

    try {
      FlameAudio.play(
        'perfect.mp3',
        volume: 1.0,
      );
    } catch (e) {
      print(e);
    }
  }

  static void playGameOver() {
    if (!_soundEnabled) return;

    try {
      FlameAudio.play(
        'game_over.mp3',
        volume: 2.8,
      );
    } catch (_) {}
  }

  // ==========================================
  // DISPOSE
  // ==========================================

  static Future<void> dispose() async {
    try {
      _musicStarted = false;
      await FlameAudio.bgm.stop();
    } catch (_) {}
  }
}