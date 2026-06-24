import 'dart:math';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class FloatingParticle extends CircleComponent {
  final Random random = Random();

  late double speed;
  late double life;

  FloatingParticle({
    required Vector2 gameSize,
  }) : super(
    radius: 2 + Random().nextDouble() * 3,
    paint: Paint()
      ..color = Colors.white.withOpacity(
        0.3,
      ),
  ) {
    position = Vector2(
      Random().nextDouble() * gameSize.x,
      Random().nextDouble() * gameSize.y,
    );

    speed = 15 + Random().nextDouble() * 25;

    life = 2 + Random().nextDouble() * 2;
  }

  @override
  void update(double dt) {
    super.update(dt);

    y -= speed * dt;

    life -= dt;

    opacity = life.clamp(0, 1);

    if (life <= 0 || y < -20) {
      removeFromParent();
    }
  }
}