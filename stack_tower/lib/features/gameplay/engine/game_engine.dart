import 'dart:async';

import '../models/game_state.dart';

typedef GameUpdateCallback = void Function(
    GameState state,
    double deltaTime,
    );

class GameEngine {
  GameEngine({
    required GameUpdateCallback onUpdate,
    this.targetFps = 60,
  }) : _onUpdate = onUpdate;

  //==========================================================================
  // CONFIG
  //==========================================================================

  final int targetFps;

  final GameUpdateCallback _onUpdate;

  //==========================================================================
  // STATE
  //==========================================================================

  Timer? _timer;

  GameState _state = GameState.initial;

  DateTime? _lastFrame;

  GameState get state => _state;

  bool get isRunning =>
      _state.status == GameStatus.playing;

  bool get isPaused =>
      _state.status == GameStatus.paused;

  bool get isGameOver =>
      _state.status == GameStatus.gameOver;

  //==========================================================================
  // LIFECYCLE
  //==========================================================================

  void start() {
    if (isRunning) return;

    _state = _state.copyWith(
      status: GameStatus.playing,
    );

    _lastFrame = DateTime.now();

    _notify(0);

    _startLoop();
  }

  void pause() {
    if (!isRunning) return;

    _timer?.cancel();

    _state = _state.copyWith(
      status: GameStatus.paused,
    );

    _notify(0);
  }

  void resume() {
    if (!isPaused) return;

    _state = _state.copyWith(
      status: GameStatus.playing,
    );

    _lastFrame = DateTime.now();

    _notify(0);

    _startLoop();
  }

  void gameOver() {
    _timer?.cancel();

    _state = _state.copyWith(
      status: GameStatus.gameOver,
    );

    _notify(0);
  }

  void restart() {
    _timer?.cancel();

    _state = GameState.initial;

    start();
  }

  void stop() {
    _timer?.cancel();

    _state = GameState.initial;

    _notify(0);
  }

  //==========================================================================
  // LOOP
  //==========================================================================

  void _startLoop() {
    _timer?.cancel();

    final frame = Duration(
      milliseconds: (1000 / targetFps).round(),
    );

    _timer = Timer.periodic(
      frame,
          (_) => _update(),
    );
  }

  void _update() {
    if (!isRunning) return;

    final now = DateTime.now();

    final dt =
        now.difference(_lastFrame!).inMicroseconds /
            1000000.0;

    _lastFrame = now;

    _notify(dt);
  }

  //==========================================================================
  // HELPERS
  //==========================================================================

  void updateState(GameState state) {
    _state = state;
  }

  void _notify(double dt) {
    _onUpdate(_state, dt);
  }

  //==========================================================================
  // DISPOSE
  //==========================================================================

  void dispose() {
    _timer?.cancel();
  }
}