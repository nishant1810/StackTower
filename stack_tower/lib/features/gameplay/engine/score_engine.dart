import '../engine/collision_engine.dart';
import '../models/game_state.dart';

/// Handles:
/// - Score
/// - Combo
/// - Coins
/// - Level
/// - Speed
///
/// Does NOT:
/// - Modify tower
/// - Detect collisions
/// - Handle UI
class ScoreEngine {
  const ScoreEngine({
    this.baseScore = 10,
    this.perfectBonus = 10,
    this.comboBonus = 2,
    this.coinsPerPlacement = 1,
    this.levelUpEvery = 20,
    this.speedIncrease = 0.05,
  });

  //==========================================================================
  // CONFIG
  //==========================================================================

  final int baseScore;
  final int perfectBonus;
  final int comboBonus;
  final int coinsPerPlacement;

  /// Blocks required to level up.
  final int levelUpEvery;

  /// Speed increase per level.
  final double speedIncrease;

  //==========================================================================
  // UPDATE GAME STATE
  //==========================================================================

  GameState update({
    required GameState state,
    required CollisionResult collision,
  }) {
    //------------------------------------------------------------
    // GAME OVER
    //------------------------------------------------------------

    if (collision.isGameOver) {
      return state.copyWith(
        status: GameStatus.gameOver,
        combo: 0,
        isPerfectPlacement: false,
      );
    }

    //------------------------------------------------------------
    // COMBO
    //------------------------------------------------------------

    final combo =
    collision.isPerfect ? state.combo + 1 : 0;

    //------------------------------------------------------------
    // SCORE
    //------------------------------------------------------------

    int gainedScore = baseScore;

    if (collision.isPerfect) {
      gainedScore += perfectBonus;
    }

    gainedScore += combo * comboBonus;

    final totalScore = state.score + gainedScore;

    //------------------------------------------------------------
    // COINS
    //------------------------------------------------------------

    final coins =
        state.coinsEarned + coinsPerPlacement;

    //------------------------------------------------------------
    // PERFECT COUNT
    //------------------------------------------------------------

    final perfectPlacements =
        state.perfectPlacements +
            (collision.isPerfect ? 1 : 0);

    //------------------------------------------------------------
    // BLOCKS
    //------------------------------------------------------------

    final blocksPlaced =
        state.blocksPlaced + 1;

    //------------------------------------------------------------
    // LEVEL
    //------------------------------------------------------------

    final level =
        (blocksPlaced ~/ levelUpEvery) + 1;

    //------------------------------------------------------------
    // SPEED
    //------------------------------------------------------------

    final speed =
        1 + ((level - 1) * speedIncrease);

    //------------------------------------------------------------
    // BEST SCORE
    //------------------------------------------------------------

    final bestScore =
    totalScore > state.bestScore
        ? totalScore
        : state.bestScore;

    //------------------------------------------------------------
    // RETURN
    //------------------------------------------------------------

    return state.copyWith(
      status: GameStatus.playing,
      score: totalScore,
      bestScore: bestScore,
      combo: combo,
      level: level,
      speed: speed,
      blocksPlaced: blocksPlaced,
      perfectPlacements: perfectPlacements,
      coinsEarned: coins,
      isPerfectPlacement: collision.isPerfect,
    );
  }
}