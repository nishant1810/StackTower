import 'package:flutter/foundation.dart';

enum GameStatus {
  idle,
  countdown,
  playing,
  paused,
  gameOver,
}

@immutable
class GameState {
  const GameState({
    this.status = GameStatus.idle,
    this.score = 0,
    this.bestScore = 0,
    this.combo = 0,
    this.level = 1,
    this.speed = 1.0,
    this.blocksPlaced = 0,
    this.perfectPlacements = 0,
    this.coinsEarned = 0,
    this.isPerfectPlacement = false,
  });

  final GameStatus status;

  final int score;

  final int bestScore;

  final int combo;

  final int level;

  final double speed;

  final int blocksPlaced;

  final int perfectPlacements;

  final int coinsEarned;

  final bool isPerfectPlacement;

  //------------------------------------------------------------
  // Helpers
  //------------------------------------------------------------

  bool get isIdle => status == GameStatus.idle;

  bool get isPlaying => status == GameStatus.playing;

  bool get isPaused => status == GameStatus.paused;

  bool get isGameOver => status == GameStatus.gameOver;

  bool get isCountdown => status == GameStatus.countdown;

  //------------------------------------------------------------
  // Copy
  //------------------------------------------------------------

  GameState copyWith({
    GameStatus? status,
    int? score,
    int? bestScore,
    int? combo,
    int? level,
    double? speed,
    int? blocksPlaced,
    int? perfectPlacements,
    int? coinsEarned,
    bool? isPerfectPlacement,
  }) {
    return GameState(
      status: status ?? this.status,
      score: score ?? this.score,
      bestScore: bestScore ?? this.bestScore,
      combo: combo ?? this.combo,
      level: level ?? this.level,
      speed: speed ?? this.speed,
      blocksPlaced: blocksPlaced ?? this.blocksPlaced,
      perfectPlacements:
      perfectPlacements ?? this.perfectPlacements,
      coinsEarned:
      coinsEarned ?? this.coinsEarned,
      isPerfectPlacement:
      isPerfectPlacement ??
          this.isPerfectPlacement,
    );
  }

  //------------------------------------------------------------
  // Initial
  //------------------------------------------------------------

  static const GameState initial = GameState();

  //------------------------------------------------------------
  // Debug
  //------------------------------------------------------------

  @override
  String toString() {
    return 'GameState('
        'status: $status, '
        'score: $score, '
        'bestScore: $bestScore, '
        'combo: $combo, '
        'level: $level, '
        'speed: $speed, '
        'blocksPlaced: $blocksPlaced, '
        'perfectPlacements: $perfectPlacements, '
        'coinsEarned: $coinsEarned'
        ')';
  }

  //------------------------------------------------------------
  // Equality
  //------------------------------------------------------------

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is GameState &&
              runtimeType == other.runtimeType &&
              status == other.status &&
              score == other.score &&
              bestScore == other.bestScore &&
              combo == other.combo &&
              level == other.level &&
              speed == other.speed &&
              blocksPlaced == other.blocksPlaced &&
              perfectPlacements ==
                  other.perfectPlacements &&
              coinsEarned == other.coinsEarned &&
              isPerfectPlacement ==
                  other.isPerfectPlacement;

  @override
  int get hashCode => Object.hash(
    status,
    score,
    bestScore,
    combo,
    level,
    speed,
    blocksPlaced,
    perfectPlacements,
    coinsEarned,
    isPerfectPlacement,
  );
}