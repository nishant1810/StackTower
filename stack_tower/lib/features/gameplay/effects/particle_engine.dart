import 'dart:math';

import 'package:flutter/material.dart';

import 'particle.dart';

class ParticleEngine extends ChangeNotifier {
  final List<Particle> particles = [];

  final Random _random = Random();

  //------------------------------------------------------------

  void explode({
    required Offset position,
    required Color color,
    int count = 20,
  }) {
    for (int i = 0; i < count; i++) {
      final angle =
          _random.nextDouble() * pi * 2;

      final speed =
          80 + _random.nextDouble() * 180;

      particles.add(
        Particle(
          x: position.dx,
          y: position.dy,

          vx: cos(angle) * speed,
          vy: sin(angle) * speed,

          radius:
          2 + _random.nextDouble() * 4,

          color: color,

          life:
          .6 + _random.nextDouble() * .4,
        ),
      );
    }

    notifyListeners();
  }

  //------------------------------------------------------------

  void update(double dt) {
    for (final p in particles) {
      p.update(dt);
    }

    particles.removeWhere(
          (p) => !p.alive,
    );

    notifyListeners();
  }
}