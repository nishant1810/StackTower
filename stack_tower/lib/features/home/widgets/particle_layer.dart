import 'dart:math' as math;

import 'package:flutter/material.dart';

class ParticleLayer extends StatefulWidget {
  const ParticleLayer({
    super.key,
    this.count = 30,
  });

  final int count;

  @override
  State<ParticleLayer> createState() => _ParticleLayerState();
}

class _ParticleLayerState extends State<ParticleLayer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  late final List<_Particle> _particles;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 25),
    )..repeat();

    final random = math.Random(1810);

    _particles = List.generate(
      widget.count,
          (_) {
        return _Particle(
          x: random.nextDouble(),
          y: random.nextDouble(),
          radius: 2 + random.nextDouble() * 4,
          opacity: .08 + random.nextDouble() * .18,
          speed: .25 + random.nextDouble() * .55,
          phase: random.nextDouble() * math.pi * 2,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.sizeOf(context);

    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          return Stack(
            children: _particles.map((particle) {
              final dx = math.sin(
                (_controller.value * math.pi * 2) +
                    particle.phase,
              ) *
                  10;

              final dy = (_controller.value *
                  screen.height *
                  particle.speed);

              return Positioned(
                left: particle.x * screen.width + dx,
                top: (particle.y * screen.height - dy) %
                    screen.height,
                child: Opacity(
                  opacity: particle.opacity,
                  child: Container(
                    width: particle.radius,
                    height: particle.radius,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color:
                          Colors.white.withValues(alpha: .25),
                          blurRadius: 8,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _Particle {
  const _Particle({
    required this.x,
    required this.y,
    required this.radius,
    required this.opacity,
    required this.speed,
    required this.phase,
  });

  final double x;
  final double y;

  final double radius;

  final double opacity;

  final double speed;

  final double phase;
}