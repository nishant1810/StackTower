import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class MilestoneText extends TextComponent {
  double timer = 0;

  MilestoneText({
    required String text,
    required Vector2 position,
  }) : super(
    text: text,
    position: position,
    anchor: Anchor.center,
    priority: 999,
    textRenderer: TextPaint(
      style: const TextStyle(
        color: Colors.amber,
        fontSize: 30,
        fontWeight: FontWeight.w900,
        shadows: [
          Shadow(
            color: Colors.orange,
            blurRadius: 30,
          ),
        ],
      ),
    ),
  );

  @override
  void update(double dt) {
    super.update(dt);

    timer += dt;

    y -= 50 * dt;

    scale = Vector2.all(
      1 + timer * 0.3,
    );

    if (timer > 1) {
      removeFromParent();
    }
  }
}