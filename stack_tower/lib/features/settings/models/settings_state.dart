import 'package:flutter/foundation.dart';

@immutable
class SettingsState {
  final bool musicEnabled;
  final bool soundEnabled;
  final bool vibrationEnabled;
  final bool notificationsEnabled;

  const SettingsState({
    required this.musicEnabled,
    required this.soundEnabled,
    required this.vibrationEnabled,
    required this.notificationsEnabled,
  });

  const SettingsState.initial()
      : musicEnabled = true,
        soundEnabled = true,
        vibrationEnabled = true,
        notificationsEnabled = true;

  SettingsState copyWith({
    bool? musicEnabled,
    bool? soundEnabled,
    bool? vibrationEnabled,
    bool? notificationsEnabled,
  }) {
    return SettingsState(
      musicEnabled:
      musicEnabled ?? this.musicEnabled,
      soundEnabled:
      soundEnabled ?? this.soundEnabled,
      vibrationEnabled:
      vibrationEnabled ??
          this.vibrationEnabled,
      notificationsEnabled:
      notificationsEnabled ??
          this.notificationsEnabled,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SettingsState &&
        other.musicEnabled == musicEnabled &&
        other.soundEnabled == soundEnabled &&
        other.vibrationEnabled ==
            vibrationEnabled &&
        other.notificationsEnabled ==
            notificationsEnabled;
  }

  @override
  int get hashCode {
    return Object.hash(
      musicEnabled,
      soundEnabled,
      vibrationEnabled,
      notificationsEnabled,
    );
  }

  @override
  String toString() {
    return 'SettingsState('
        'musicEnabled: $musicEnabled, '
        'soundEnabled: $soundEnabled, '
        'vibrationEnabled: $vibrationEnabled, '
        'notificationsEnabled: $notificationsEnabled'
        ')';
  }
}