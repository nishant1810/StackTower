import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class PerfectText extends TextComponent {
  double timer = 0;

  PerfectText(
      Vector2 position,
      String label,
      ) : super(
    text: label,
    position: position,
    anchor: Anchor.center,
    textRenderer: TextPaint(
      style: const TextStyle(
        color: Colors.amber,
        fontSize: 42,
        fontWeight: FontWeight.w900,
      ),
    ),
  );

  @override
  void update(double dt) {
    super.update(dt);

    timer += dt;

    /// Move upward
    y -= 50 * dt;

    /// Scale animation
    scale = Vector2.all(
      1 + (timer * 0.3),
    );

    /// Remove after 1 second
    if (timer >= 0.7) {
      removeFromParent();
    }
  }
}