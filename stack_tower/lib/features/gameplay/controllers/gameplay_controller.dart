import 'package:flutter/foundation.dart';

import '../engine/collision_engine.dart';
import '../engine/game_engine.dart';
import '../engine/score_engine.dart';
import '../engine/tower_engine.dart';
import '../models/block_model.dart';
import '../models/game_state.dart';
import '../models/tower_model.dart';

class GameplayController {
  GameplayController({
    required double screenWidth,
    required double groundY,
  }) : _groundY = groundY {
    _towerEngine = TowerEngine(
      screenWidth: screenWidth,
    );

    _scoreEngine = const ScoreEngine();

    _collisionEngine = const CollisionEngine();

    _gameEngine = GameEngine(
      onUpdate: _onGameUpdate,
    );
  }

  //==========================================================================
  // CONFIG
  //==========================================================================

  final double _groundY;

  //==========================================================================
  // ENGINES
  //==========================================================================

  late final GameEngine _gameEngine;

  late final TowerEngine _towerEngine;

  late final CollisionEngine _collisionEngine;

  late final ScoreEngine _scoreEngine;

  //==========================================================================
  // STATE
  //==========================================================================

  final ValueNotifier<GameState> state =
  ValueNotifier(GameState.initial);

  final ValueNotifier<TowerModel> tower =
  ValueNotifier(const TowerModel());

  //==========================================================================
  // GETTERS
  //==========================================================================

  GameState get gameState => state.value;

  TowerModel get towerState => tower.value;

  BlockModel? get movingBlock =>
      _towerEngine.movingBlock;

  bool get isRunning =>
      _gameEngine.isRunning;

  bool get isPaused =>
      _gameEngine.isPaused;

  bool get isGameOver =>
      _gameEngine.isGameOver;

  //==========================================================================
  // INITIALIZE
  //==========================================================================

  void initialize() {
    _towerEngine.initialize(
      groundY: _groundY,
    );

    tower.value = _towerEngine.tower;
  }

  //==========================================================================
  // GAME
  //==========================================================================

  void startGame() {
    _gameEngine.start();
  }

  void pauseGame() {
    _gameEngine.pause();
  }

  void resumeGame() {
    _gameEngine.resume();
  }

  void restartGame() {
    _towerEngine.reset(
      groundY: _groundY,
    );

    tower.value = _towerEngine.tower;

    state.value = GameState.initial;

    _gameEngine.restart();
  }

  void gameOver() {
    _gameEngine.gameOver();
  }

  //==========================================================================
  // PLACE BLOCK
  //==========================================================================

  void placeBlock() {
    if (!_gameEngine.isRunning) return;

    final moving = _towerEngine.movingBlock;

    final previous = _towerEngine.tower.topBlock;

    if (moving == null || previous == null) {
      return;
    }

    final collision =
    _collisionEngine.evaluate(
      moving: moving,
      previous: previous,
    );

    if (collision.isGameOver) {
      state.value = _scoreEngine.update(
        state: state.value,
        collision: collision,
      );

      _gameEngine.gameOver();

      return;
    }

    _towerEngine.placeCurrentBlock();

    tower.value = _towerEngine.tower;

    state.value = _scoreEngine.update(
      state: state.value,
      collision: collision,
    );

    _gameEngine.updateState(
      state.value,
    );
  }

  //==========================================================================
  // UPDATE LOOP
  //==========================================================================

  void _onGameUpdate(
      GameState gameState,
      double deltaTime,
      ) {
    state.value = gameState;

    _towerEngine.update(
      deltaTime,
    );

    tower.value = _towerEngine.tower;
  }

  //==========================================================================
  // DISPOSE
  //==========================================================================

  void dispose() {
    _gameEngine.dispose();

    state.dispose();

    tower.dispose();
  }
}