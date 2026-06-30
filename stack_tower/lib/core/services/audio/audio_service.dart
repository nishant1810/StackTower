import 'package:flame_audio/flame_audio.dart';

import '../storage/storage_service.dart';

class AudioService {
  AudioService._();

  static bool _initialized = false;
  static bool _bgmStarted = false;

  static bool _musicEnabled = true;
  static bool _sfxEnabled = true;

  //=========================================================
  // INITIALIZE
  //=========================================================

  static Future<void> initialize() async {
    if (_initialized) return;

    try {
      _musicEnabled =
      await StorageService.getMusicEnabled();

      _sfxEnabled =
      await StorageService.getSfxEnabled();

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

  //=========================================================
  // SETTINGS CACHE
  //=========================================================

  static Future<void> refreshSettings() async {
    _musicEnabled =
    await StorageService.getMusicEnabled();

    _sfxEnabled =
    await StorageService.getSfxEnabled();
  }

  //=========================================================
  // MUSIC
  //=========================================================

  static Future<void> startBackgroundMusic() async {
    try {
      await initialize();

      if (!_musicEnabled) return;

      if (_bgmStarted) return;

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
    try {
      if (!_musicEnabled) return;

      await FlameAudio.bgm.resume();
    } catch (e) {
      print('BGM RESUME ERROR: $e');
    }
  }

  //=========================================================
  // SFX
  //=========================================================

  static void playDrop() {
    if (!_sfxEnabled) return;

    FlameAudio.play(
      'drop.wav',
      volume: 0.7,
    );
  }

  static void playPerfect() {
    if (!_sfxEnabled) return;

    FlameAudio.play(
      'perfect.wav',
      volume: 1.0,
    );
  }

  static void playGameOver() {
    if (!_sfxEnabled) return;

    FlameAudio.play(
      'game_over.wav',
      volume: 1.0,
    );
  }

  //=========================================================
  // TOGGLE HELPERS
  //=========================================================

  static Future<void> setMusicEnabled(
      bool value) async {
    _musicEnabled = value;

    await StorageService.saveMusicEnabled(value);

    if (value) {
      await startBackgroundMusic();
    } else {
      await stopBackgroundMusic();
    }
  }

  static Future<void> setSfxEnabled(
      bool value) async {
    _sfxEnabled = value;

    await StorageService.saveSfxEnabled(value);
  }

  //=========================================================
  // CLEANUP
  //=========================================================

  static Future<void> dispose() async {
    try {
      await FlameAudio.bgm.stop();

      _bgmStarted = false;
      _initialized = false;
    } catch (e) {
      print('AUDIO DISPOSE ERROR: $e');
    }
  }
}