import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class PerfectFlash extends PositionComponent {
  double life = 0.20;

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    final opacity =
    (life * 1.5).clamp(0.0, 0.25);

    canvas.drawRect(
      Rect.fromLTWH(
        0,
        0,
        size.x,
        size.y,
      ),
      Paint()
        ..color = Colors.white.withOpacity(
          opacity,
        ),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);

    life -= dt;

    if (life <= 0) {
      removeFromParent();
    }
  }
}