import 'package:flame_audio/flame_audio.dart';

import '../../services/storage_service.dart';
import 'audio_type.dart';

class AudioService {
  AudioService._();

  static final AudioService instance = AudioService._();

  bool _musicEnabled = true;
  bool _soundEnabled = true;

  bool get musicEnabled => _musicEnabled;
  bool get soundEnabled => _soundEnabled;

  bool _initialized = false;

  //----------------------------------------------------------
  // Initialize
  //----------------------------------------------------------

  Future<void> initialize() async {
    if (_initialized) return;

    _initialized = true;

    _musicEnabled =
    await StorageService.isMusicEnabled();

    _soundEnabled =
    await StorageService.isSoundEnabled();

    await FlameAudio.audioCache.loadAll([
      'drop.wav',
      'perfect.wav',
      'game_over.wav',
      'button.wav',
      'reward.wav',
      'combo.wav',
      'bg_music.mp3',
    ]);

    if (_musicEnabled) {
      await playBackground();
    }
  }

  //----------------------------------------------------------
  // Music
  //----------------------------------------------------------

  Future<void> playBackground() async {
    if (!_musicEnabled) return;

    await FlameAudio.bgm.initialize();

    await FlameAudio.bgm.play(
      'bg_music.mp3',
      volume: .55,
    );
  }

  Future<void> stopBackground() async {
    await FlameAudio.bgm.stop();
  }

  Future<void> pauseBackground() async {
    await FlameAudio.bgm.pause();
  }

  Future<void> resumeBackground() async {
    if (!_musicEnabled) return;

    await FlameAudio.bgm.resume();
  }

  //----------------------------------------------------------
  // Effects
  //----------------------------------------------------------

  Future<void> play(AudioType type) async {
    if (!_soundEnabled) return;

    switch (type) {
      case AudioType.blockDrop:
        FlameAudio.play(
          'drop.wav',
          volume: .7,
        );
        break;

      case AudioType.perfect:
        FlameAudio.play(
          'perfect.wav',
          volume: .8,
        );
        break;

      case AudioType.combo:
        FlameAudio.play(
          'combo.wav',
          volume: .9,
        );
        break;

      case AudioType.button:
        FlameAudio.play(
          'button.wav',
          volume: .6,
        );
        break;

      case AudioType.reward:
        FlameAudio.play(
          'reward.wav',
          volume: .8,
        );
        break;

      case AudioType.gameOver:
        FlameAudio.play(
          'game_over.wav',
          volume: 1,
        );
        break;

      case AudioType.bgMusic:
        break;
    }
  }

  //----------------------------------------------------------
  // Toggle Music
  //----------------------------------------------------------

  Future<void> setMusicEnabled(
      bool value,
      ) async {
    _musicEnabled = value;

    await StorageService.setMusicEnabled(
      value,
    );

    if (value) {
      playBackground();
    } else {
      stopBackground();
    }
  }

  //----------------------------------------------------------
  // Toggle Sound
  //----------------------------------------------------------

  Future<void> setSoundEnabled(
      bool value,
      ) async {
    _soundEnabled = value;

    await StorageService.setSoundEnabled(
      value,
    );
  }
}