import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class FallingPiece extends RectangleComponent {
  double velocityY = 0;
  double rotationSpeed = 0.04;

  FallingPiece({
    required Vector2 position,
    required Vector2 size,
    required Color color,
  }) : super(
    position: position,
    size: size,
    paint: Paint()..color = color,
  );

  @override
  void update(double dt) {
    super.update(dt);

    // Gravity
    velocityY += 800 * dt;

    y += velocityY * dt;

    // Rotate while falling
    angle += rotationSpeed;

    // Remove when far below screen
    if (y > 2500) {
      removeFromParent();
    }
  }
}