import 'dart:math';

import '../models/block_model.dart';

enum CollisionResultType {
  perfect,
  success,
  miss,
}

class CollisionResult {
  const CollisionResult({
    required this.type,
    required this.placedBlock,
    this.fallingBlock,
    this.overlap = 0,
  });

  final CollisionResultType type;

  final BlockModel? placedBlock;

  final BlockModel? fallingBlock;

  final double overlap;

  bool get isGameOver => type == CollisionResultType.miss;

  bool get isPerfect => type == CollisionResultType.perfect;

  bool get isSuccess => type != CollisionResultType.miss;
}

class CollisionEngine {
  const CollisionEngine({
    this.perfectTolerance = 4,
  });

  /// Maximum center difference for a perfect placement.
  final double perfectTolerance;

  CollisionResult evaluate({
    required BlockModel moving,
    required BlockModel previous,
  }) {
    //------------------------------------------------------------
    // Calculate overlap
    //------------------------------------------------------------

    final left = max(
      moving.x,
      previous.x,
    );

    final right = min(
      moving.right,
      previous.right,
    );

    final overlap = right - left;

    //------------------------------------------------------------
    // Miss
    //------------------------------------------------------------

    if (overlap <= 0) {
      return const CollisionResult(
        type: CollisionResultType.miss,
        placedBlock: null,
      );
    }

    //------------------------------------------------------------
    // Perfect?
    //------------------------------------------------------------

    final perfect =
        (moving.centerX - previous.centerX).abs() <=
            perfectTolerance;

    //------------------------------------------------------------
    // Placed block
    //------------------------------------------------------------

    final placed = moving.copyWith(
      x: left,
      width: overlap,
      isPlaced: true,
      isMoving: false,
      isFalling: false,
    );

    //------------------------------------------------------------
    // Falling piece
    //------------------------------------------------------------

    BlockModel? falling;

    final cutWidth = moving.width - overlap;

    if (cutWidth > 0) {
      if (moving.x < previous.x) {
        falling = moving.copyWith(
          width: previous.x - moving.x,
          isMoving: false,
          isPlaced: false,
          isFalling: true,
        );
      } else {
        falling = moving.copyWith(
          x: previous.right,
          width: moving.right - previous.right,
          isMoving: false,
          isPlaced: false,
          isFalling: true,
        );
      }
    }

    //------------------------------------------------------------
    // Result
    //------------------------------------------------------------

    return CollisionResult(
      type: perfect
          ? CollisionResultType.perfect
          : CollisionResultType.success,
      placedBlock: placed,
      fallingBlock: falling,
      overlap: overlap,
    );
  }
}