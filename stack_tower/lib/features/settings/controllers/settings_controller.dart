import 'package:flutter/foundation.dart';

import '../../../core/services/audio/audio_service.dart';
import '../../../core/services/haptics/haptic_service.dart';
import '../../../core/services/storage/storage_service.dart';

import '../models/settings_state.dart';

class SettingsController {
  final ValueNotifier<SettingsState> state =
  ValueNotifier(SettingsState.initial());

  final ValueNotifier<bool> isLoading =
  ValueNotifier(false);

  Future<void> initialize() async {
    isLoading.value = true;

    try {
      final musicEnabled =
      await StorageService.getMusicEnabled();

      final soundEnabled =
      await StorageService.getSfxEnabled();

      final vibrationEnabled =
      await StorageService.getVibrationEnabled();

      state.value = state.value.copyWith(
        musicEnabled: musicEnabled,
        soundEnabled: soundEnabled,
        vibrationEnabled: vibrationEnabled,
      );
    } catch (e) {
      debugPrint(
        'SettingsController initialize error: $e',
      );
    } finally {
      isLoading.value = false;
    }
  }

  //=========================================================
  // MUSIC
  //=========================================================

  Future<void> toggleMusic(bool value) async {
    try {
      await StorageService.saveMusicEnabled(
        value,
      );

      await AudioService.setMusicEnabled(
        value,
      );

      state.value = state.value.copyWith(
        musicEnabled: value,
      );
    } catch (e) {
      debugPrint(
        'Toggle music error: $e',
      );
    }
  }

  //=========================================================
  // SOUND EFFECTS
  //=========================================================

  Future<void> toggleSound(bool value) async {
    try {
      await StorageService.saveSfxEnabled(value);

      AudioService.setSoundEnabled(value);

      state.value = state.value.copyWith(
        soundEnabled: value,
      );
    } catch (e) {
      debugPrint('Toggle sound error: $e');
    }
  }

  //=========================================================
  // VIBRATION
  //=========================================================

  Future<void> toggleVibration(
      bool value,
      ) async {
    try {
      await StorageService
          .saveVibrationEnabled(
        value,
      );

      state.value = state.value.copyWith(
        vibrationEnabled: value,
      );

      if (value) {
        await HapticService.light();
      }
    } catch (e) {
      debugPrint(
        'Toggle vibration error: $e',
      );
    }
  }

  //=========================================================
  // NOTIFICATIONS
  //=========================================================

  Future<void> toggleNotifications(
      bool value,
      ) async {
    state.value = state.value.copyWith(
      notificationsEnabled: value,
    );
  }

  //=========================================================
  // RESET PROGRESS
  //=========================================================

  Future<void> resetProgress() async {
    try {
      await StorageService
          .resetGameProgress();

      // Reload settings after reset
      await initialize();
    } catch (e) {
      debugPrint(
        'Reset progress error: $e',
      );
    }
  }

  //=========================================================
  // DISPOSE
  //=========================================================

  void dispose() {
    state.dispose();
    isLoading.dispose();
  }
}