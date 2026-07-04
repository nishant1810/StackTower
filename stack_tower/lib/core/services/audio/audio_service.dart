import 'package:flame_audio/flame_audio.dart';

class AudioService {
  AudioService._();

  static bool _initialized = false;
  static bool _musicEnabled = true;
  static bool _soundEnabled = true;
  static bool _musicStarted = false;

  static bool get musicEnabled => _musicEnabled;
  static bool get soundEnabled => _soundEnabled;

  // ==========================================
  // INITIALIZE
  // ==========================================

  static Future<void> initialize() async {
    if (_initialized) return;

    await FlameAudio.audioCache.loadAll([
      'bg_music.mp3',
      'drop.mp3',
      'perfect.mp3',
      'combo.mp3',
      'coin.mp3',
      'reward.mp3',
      'achievement.mp3',
      'game_over.mp3',
    ]);

    await FlameAudio.bgm.initialize();

    _initialized = true;
  }

  // ==========================================
  // MUSIC
  // ==========================================

  static Future<void> setMusicEnabled(bool value) async {
    _musicEnabled = value;

    if (value) {
      _musicStarted = false;
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

      await FlameAudio.bgm.play(
        'bg_music.mp3',
        volume: 0.8,
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
  // SOUND EFFECTS
  // ==========================================

  static void setSoundEnabled(bool value) {
    _soundEnabled = value;
  }

  static void playDrop() {
    if (!_soundEnabled) return;
    FlameAudio.play('drop.mp3', volume: 0.8);
  }

  static void playPerfect() {
    if (!_soundEnabled) return;
    FlameAudio.play('perfect.mp3');
  }

  static void playCombo() {
    if (!_soundEnabled) return;
    FlameAudio.play('combo.mp3');
  }

  static void playCoin() {
    if (!_soundEnabled) return;
    FlameAudio.play('coin.mp3');
  }

  static void playReward() {
    if (!_soundEnabled) return;
    FlameAudio.play('reward.mp3');
  }

  static void playAchievement() {
    if (!_soundEnabled) return;
    FlameAudio.play('achievement.mp3');
  }

  static void playGameOver() {
    if (!_soundEnabled) return;
    FlameAudio.play('game_over.mp3');
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