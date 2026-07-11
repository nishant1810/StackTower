import 'dart:math' as math;

import 'package:flutter/material.dart';

class ParticlesLayer extends StatefulWidget {
  const ParticlesLayer({
    super.key,
    this.particleCount = 60,
  });

  final int particleCount;

  @override
  State<ParticlesLayer> createState() =>
      _ParticlesLayerState();
}

class _ParticlesLayerState
    extends State<ParticlesLayer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  late final List<_ParticleData> _particles;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 15,
      ),
    )..repeat();

    final random = math.Random(1810);

    _particles = List.generate(
      widget.particleCount,
          (_) {
        return _ParticleData(
          xFactor: random.nextDouble(),
          speed:
          .4 +
              random.nextDouble() *
                  .8,
          size:
          1.5 +
              random.nextDouble() *
                  2.5,
          opacity:
          .2 +
              random.nextDouble() *
                  .6,
          phase:
          random.nextDouble() *
              math.pi *
              2,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screen =
    MediaQuery.sizeOf(context);

    final particleBaseSize =
    (screen.width * 0.01)
        .clamp(2.0, 6.0);

    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          return Stack(
            children: _particles.map(
                  (particle) {
                final x =
                    particle.xFactor *
                        screen.width;

                final y =
                    ((particle.phase *
                        80) -
                        (_controller
                            .value *
                            screen
                                .height *
                            particle
                                .speed)) %
                        screen.height;

                final opacity =
                    particle.opacity *
                        (.6 +
                            .4 *
                                math.sin(
                                  (_controller.value *
                                      math.pi *
                                      2) +
                                      particle
                                          .phase,
                                ).abs());

                return Positioned(
                  left: x,
                  top: y,
                  child: Opacity(
                    opacity: opacity,
                    child: _Particle(
                      size:
                      particleBaseSize *
                          particle.size,
                    ),
                  ),
                );
              },
            ).toList(),
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

class _Particle extends StatelessWidget {
  const _Particle({
    required this.size,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white
              .withValues(
            alpha: 0.95,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.white
                  .withValues(
                alpha: 0.45,
              ),
              blurRadius:
              (size * 2)
                  .clamp(
                4.0,
                8.0,
              ),
              spreadRadius:
              (size * 0.3)
                  .clamp(
                0.5,
                1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ParticleData {
  const _ParticleData({
    required this.xFactor,
    required this.speed,
    required this.size,
    required this.opacity,
    required this.phase,
  });

  final double xFactor;
  final double speed;
  final double size;
  final double opacity;
  final double phase;
}