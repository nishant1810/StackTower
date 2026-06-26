import 'package:flutter/material.dart';

import 'particle_engine.dart';

class ParticleLayer extends StatelessWidget {
  const ParticleLayer({
    super.key,
    required this.engine,
  });

  final ParticleEngine engine;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: AnimatedBuilder(
        animation: engine,
        builder: (_, __) {
          return CustomPaint(
            size: Size.infinite,
            painter: _ParticlePainter(
              engine.particles,
            ),
          );
        },
      ),
    );
  }
}

class _ParticlePainter
    extends CustomPainter {
  const _ParticlePainter(
      this.particles,
      );

  final List particles;

  @override
  void paint(
      Canvas canvas,
      Size size,
      ) {
    for (final p in particles) {
      final paint = Paint()
        ..color = p.color.withValues(
          alpha: p.life,
        );

      canvas.drawCircle(
        Offset(
          p.x,
          p.y,
        ),
        p.radius,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(
      covariant _ParticlePainter oldDelegate,
      ) {
    return true;
  }
}