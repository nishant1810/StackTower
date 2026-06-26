import 'dart:math';

import 'package:flutter/material.dart';

import '../models/block_model.dart';
import '../models/tower_model.dart';

class TowerEngine {
  TowerEngine({
    required this.screenWidth,
    this.initialBlockWidth = 180,
    this.blockHeight = 32,
    this.horizontalSpeed = 220,
  });

  //==========================================================================
  // CONFIGURATION
  //==========================================================================

  final double screenWidth;

  final double initialBlockWidth;

  final double blockHeight;

  final double horizontalSpeed;

  final Random _random = Random();

  //==========================================================================
  // STATE
  //==========================================================================

  TowerModel _tower = const TowerModel();

  BlockModel? _movingBlock;

  bool _movingRight = true;

  int _blockId = 0;

  TowerModel get tower => _tower;

  BlockModel? get movingBlock => _movingBlock;

  //==========================================================================
  // INITIALIZE
  //==========================================================================

  void initialize({
    required double groundY,
  }) {
    _blockId = 0;

    _tower = const TowerModel();

    final baseBlock = BlockModel(
      id: _blockId++,
      x: (screenWidth - initialBlockWidth) / 2,
      y: groundY,
      width: initialBlockWidth,
      height: blockHeight,
      color: Colors.cyan,
      isPlaced: true,
    );

    _tower = _tower.addBlock(baseBlock);

    _spawnMovingBlock();
  }

  //==========================================================================
  // UPDATE
  //==========================================================================

  void update(double dt) {
    if (_movingBlock == null) return;

    double x = _movingBlock!.x;

    if (_movingRight) {
      x += horizontalSpeed * dt;

      if (x + _movingBlock!.width >= screenWidth) {
        x = screenWidth - _movingBlock!.width;
        _movingRight = false;
      }
    } else {
      x -= horizontalSpeed * dt;

      if (x <= 0) {
        x = 0;
        _movingRight = true;
      }
    }

    _movingBlock = _movingBlock!.copyWith(
      x: x,
    );
  }

  //==========================================================================
  // PLACE
  //==========================================================================

  BlockModel placeCurrentBlock() {
    if (_movingBlock == null) {
      throw Exception(
        'No moving block available.',
      );
    }

    final placed = _movingBlock!.copyWith(
      isMoving: false,
      isPlaced: true,
    );

    _tower = _tower.addBlock(placed);

    _spawnMovingBlock();

    return placed;
  }

  //==========================================================================
  // SPAWN
  //==========================================================================

  void _spawnMovingBlock() {
    final previous = _tower.topBlock!;

    _movingBlock = BlockModel(
      id: _blockId++,
      x: 0,
      y: previous.y - blockHeight,
      width: previous.width,
      height: blockHeight,
      color: _randomColor(),
      isMoving: true,
    );

    _movingRight = true;
  }

  //==========================================================================
  // COLOR
  //==========================================================================

  Color _randomColor() {
    const colors = [
      Color(0xFF22D3EE),
      Color(0xFF3B82F6),
      Color(0xFF7C3AED),
      Color(0xFF10B981),
      Color(0xFFF59E0B),
      Color(0xFFEC4899),
    ];

    return colors[_random.nextInt(colors.length)];
  }

  //==========================================================================
  // RESET
  //==========================================================================

  void reset({
    required double groundY,
  }) {
    initialize(
      groundY: groundY,
    );
  }
}