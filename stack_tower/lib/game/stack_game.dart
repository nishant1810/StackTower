import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flame_audio/flame_audio.dart';

import '../services/storage_service.dart';
import '../services/haptic_service.dart';
import 'components/block_component.dart';
import 'components/falling_piece.dart';
import 'effects/floating_particle.dart';
import 'effects/landing_particle.dart';
import 'effects/perfect_flash.dart';
import 'effects/perfect_text.dart';
import 'effects/milestone_text.dart';
import '../services/audio_service.dart';
import '../theme/theme_manager.dart';

class StackGame extends FlameGame
    with TapCallbacks, ChangeNotifier {
  final VoidCallback onGameOver;

  StackGame({
    required this.onGameOver,
  });
  void _checkMilestone() {
    String? message;

    if (!reachedGreat && score >= 100) {
      reachedGreat = true;
      message = "🔥 GREAT!";
    }

    else if (!reachedAmazing && score >= 200) {
      reachedAmazing = true;
      message = "⭐ AMAZING!";
    }

    else if (!reachedUnstoppable && score >= 500) {
      reachedUnstoppable = true;
      message = "🚀 UNSTOPPABLE!";
    }

    else if (!reachedLegend && score >= 1000) {
      reachedLegend = true;
      message = "👑 LEGEND!";
    }

    if (message == null) return;

    coinsEarned += 5;
    StorageService.addCoins(5);

    shakeTimer = 0.25;
    shakeStrength = 15;

    add(
      PerfectFlash()..size = size,
    );

    add(
      MilestoneText(
        text: message,
        position: Vector2(
          size.x / 2,
          size.y * 0.25,
        ),
      ),
    );

    for (int i = 0; i < 10; i++) {
      add(
        LandingParticle(
          position: Vector2(
            size.x / 2,
            size.y * 0.25,
          ),
          color: Colors.amber,
        ),
      );
    }

    HapticService.heavy();
  }

  final List<BlockComponent> towerBlocks = [];

  late BlockComponent movingBlock;

  int score = 0;
  int bestScore = 0;
  int perfectCombo = 0;

  int coinsEarned = 0;

  bool reachedGreat = false;
  bool reachedAmazing = false;
  bool reachedUnstoppable = false;
  bool reachedLegend = false;

  double blockWidth = 260;
  final double blockHeight = 55;

  double blockSpeed = 260;

  bool movingRight = true;
  bool gameEnded = false;

  double currentY = 0;
  double shakeTimer = 0;
  double shakeStrength = 0;
  double particleTimer = 0;

  final Random random = Random();

  late List<Color> palette;
  String selectedTheme = 'neon';

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    selectedTheme =
    await StorageService.getSelectedTheme();

    palette = ThemeManager.getPalette(
      selectedTheme,
    );

    bestScore = await StorageService.getBestScore();

    currentY = size.y * 0.78;

    for (int i = 0; i < 8; i++) {
      add(
        FloatingParticle(
          gameSize: size,
        ),
      );
    }

    /// Platform
    add(
      RectangleComponent(
        position: Vector2(
          size.x / 2 - 170,
          currentY + 65,
        ),
        size: Vector2(
          340,
          25,
        ),
        paint: Paint()
          ..color = const Color(0xFF1E293B),
      ),
    );

    /// Base Block
    final baseBlock = BlockComponent(
      position: Vector2(
        size.x / 2 - blockWidth / 2,
        currentY,
      ),
      blockSize: Vector2(
        blockWidth,
        blockHeight,
      ),
      color: const Color(0xFF334155),
    );

    add(baseBlock);
    towerBlocks.add(baseBlock);

    currentY -= blockHeight;

    _spawnMovingBlock();

    notifyListeners();
  }

  void _spawnMovingBlock() {
    final startFromLeft = random.nextBool();

    movingRight = startFromLeft;

    movingBlock = BlockComponent(
      position: Vector2(
        startFromLeft ? -blockWidth : size.x,
        currentY,
      ),
      blockSize: Vector2(
        blockWidth,
        blockHeight,
      ),
      color: palette[
      random.nextInt(palette.length)
      ],
    );

    add(movingBlock);
  }

  /// ADD THIS METHOD HERE
  void _spawnBackgroundParticle() {
    add(
      FloatingParticle(
        gameSize: size,
      ),
    );
  }



  @override
  void update(double dt) {
    super.update(dt);

    if (gameEnded) return;

    if (movingRight) {
      movingBlock.x += blockSpeed * dt;

      if (movingBlock.x >= size.x) {
        movingRight = false;
      }
    } else {
      movingBlock.x -= blockSpeed * dt;

      if (movingBlock.x <= -movingBlock.size.x) {
        movingRight = true;
      }
    }

    /// SCREEN SHAKE
    if (shakeTimer > 0) {
      shakeTimer -= dt;

      camera.viewfinder.position = Vector2(
        size.x / 2 +
            (random.nextDouble() - 0.5) * shakeStrength,
        size.y / 2 +
            (random.nextDouble() - 0.5) * shakeStrength,
      );
    } else {
      camera.viewfinder.position = Vector2(
        size.x / 2,
        size.y / 2,
      );
    }

    /// BACKGROUND PARTICLE SPAWNER
    particleTimer += dt;

    if (particleTimer > 0.8) {
      particleTimer = 0;
      _spawnBackgroundParticle();
    }
  }

  @override
  void onTapDown(TapDownEvent event) {
    if (gameEnded) return;

    final previousBlock = towerBlocks.last;

    final left = max(
      previousBlock.x,
      movingBlock.x,
    );

    final right = min(
      previousBlock.x + previousBlock.size.x,
      movingBlock.x + movingBlock.size.x,
    );

    final overlap = right - left;

    if (overlap <= 0) {
      _gameOver();
      return;
    }

    final blockColor = palette[
    random.nextInt(
      palette.length,
    )];

    final cutWidth =
        movingBlock.size.x - overlap;

    final perfect =
        (movingBlock.x -
            previousBlock.x)
            .abs() <
            5;

    /// Falling Piece
    if (cutWidth > 0) {
      final cutOnRight =
          movingBlock.x >
              previousBlock.x;

      add(
        FallingPiece(
          position: Vector2(
            cutOnRight
                ? left + overlap
                : movingBlock.x,
            currentY,
          ),
          size: Vector2(
            cutWidth,
            blockHeight,
          ),
          color: blockColor,
        ),
      );
    }

    movingBlock.removeFromParent();

    /// New Block
    final placedBlock = BlockComponent(
      position: Vector2(
        left,
        currentY,
      ),
      blockSize: Vector2(
        overlap,
        blockHeight,
      ),
      color: blockColor,
    );

    add(placedBlock);
    towerBlocks.add(placedBlock);

    AudioService.playDrop();

    HapticService.light();

    // placedBlock.triggerGlowPulse();

    for (int i = 0; i < 3; i++) {
      add(
        LandingParticle(
          position: Vector2(
            left + random.nextDouble() * overlap,
            currentY + 4,
          ),
          color: blockColor,
        ),
      );
    }

    /// Shift world downward
    if (placedBlock.y < size.y * 0.35) {
      _shiftTowerDown(60);
    }

    blockWidth = max(
      overlap,
      40,

    );

    if (perfect) {
      perfectCombo++;

      final comboBonus =
      (perfectCombo * 5).clamp(5, 25);

      score += comboBonus;

      coinsEarned += 1;
      StorageService.addCoins(1);

      // placedBlock.glowPulse = 2.0;

      AudioService.playPerfect();

      HapticService.medium();

      shakeTimer = 0.15;

      shakeStrength =
          min(12 + perfectCombo * 2, 24);

      add(
        PerfectText(
          Vector2(
            size.x / 2,
            currentY - 50,
          ),
          perfectCombo > 1
              ? "PERFECT x$perfectCombo"
              : "PERFECT!",
        ),
      );

      add(
        PerfectFlash()
          ..size = size,
      );

      for (int i = 0; i < 8; i++) {
        add(
          LandingParticle(
            position: Vector2(
              left + overlap / 2,
              currentY,
            ),
            color: Colors.amber,
          ),
        );
      }
    } else {
      perfectCombo = 0;
      score += 1;

    }

    if (score > bestScore) {
      bestScore = score;
    }

    _checkMilestone();

    notifyListeners();

    currentY -= blockHeight;

    blockSpeed = min(
      blockSpeed + 4,
      500,
    );

    _spawnMovingBlock();
  }

  void _shiftTowerDown(double amount) {
    for (final block in towerBlocks) {
      block.y += amount;
    }

    movingBlock.y += amount;

    currentY += amount;
  }

  Future<void> _gameOver() async {
    gameEnded = true;

    await StorageService.saveBestScore(
      score,
    );

    bestScore = max(
      bestScore,
      score,
    );

    notifyListeners();

    AudioService.playGameOver();

    HapticService.heavy();

    pauseEngine();

    onGameOver();
  }
}