// import 'package:flame_audio/audio_pool.dart';
import 'package:flame_audio/flame_audio.dart';

class AudioService {
  AudioService._();

  static bool _initialized = false;
  static bool _musicEnabled = true;
  static bool _soundEnabled = true;
  static bool _musicStarted = false;

  static AudioPool? _perfectPool;

  static bool get musicEnabled => _musicEnabled;
  static bool get soundEnabled => _soundEnabled;

  // ==========================================
  // INITIALIZE
  // ==========================================

  static Future<void> initialize() async {
    if (_initialized) return;

    try {
      await FlameAudio.audioCache.loadAll([
        'bg_music.mp3',
        'perfect.mp3',
      ]);

      await FlameAudio.bgm.initialize();

      _perfectPool = await FlameAudio.createPool(
        'perfect.mp3',
        maxPlayers: 4,
      );

      _initialized = true;
    } catch (e) {
      print('Audio initialization error: $e');
    }
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
    if (!_musicEnabled || _musicStarted) return;

    try {
      _musicStarted = true;

      FlameAudio.bgm.play(
        'bg_music.mp3',
        volume: 0.35,
      );
    } catch (e) {
      _musicStarted = false;
      print('BGM error: $e');
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

  static void playPerfect() {
    if (!_soundEnabled) return;

    try {
      _perfectPool?.start(
        volume: 1.0,
      );
    } catch (e) {
      print('Perfect sound error: $e');
    }
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