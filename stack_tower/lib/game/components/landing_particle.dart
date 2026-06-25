import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'dart:math';

class LandingParticle extends CircleComponent {
  final Vector2 velocity;

  LandingParticle({
    required Vector2 position,
    required Color color,
  }) : velocity = Vector2(
    (Random().nextDouble() - 0.5) * 250,
    -(Random().nextDouble() * 250),
  ),
        super(
        position: position,
        radius: 4,
        paint: Paint()..color = color,
      );

  double life = 1.0;

  @override
  void update(double dt) {
    super.update(dt);

    life -= dt;

    velocity.y += 700 * dt;

    position += velocity * dt;

    opacity = life.clamp(0, 1);

    // if (life <= 0) {
    //   removeFromParent();
    // }
  }
}