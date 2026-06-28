import 'dart:math';
import 'package:flutter/material.dart';

class RewardParticles extends StatefulWidget {
  const RewardParticles({super.key});

  @override
  State<RewardParticles> createState() =>
      _RewardParticlesState();
}

class _RewardParticlesState extends State<RewardParticles>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  final Random random = Random(42);

  late final List<_ParticleData> particles =
  List.generate(
    45,
        (_) => _ParticleData(random),
  );

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Stack(
                children: particles.map((particle) {
                  final t = _controller.value;

                  final dy =
                      sin(
                        (t * 2 * pi) +
                            particle.phase,
                      ) *
                          12;

                  final opacity =
                      0.4 +
                          0.6 *
                              (0.5 +
                                  0.5 *
                                      sin(
                                        (t * 2 * pi) +
                                            particle.phase,
                                      ));

                  return Positioned(
                    left:
                    particle.x *
                        constraints.maxWidth,
                    top:
                    particle.y *
                        constraints.maxHeight +
                        dy,
                    child: Opacity(
                      opacity: opacity,
                      child: Container(
                        width: particle.size,
                        height: particle.size,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: particle.color,
                          boxShadow: [
                            BoxShadow(
                              color: particle.color
                                  .withOpacity(0.7),
                              blurRadius: 12,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          );
        },
      ),
    );
  }
}

class _ParticleData {
  final double x;
  final double y;
  final double size;
  final double phase;
  final Color color;

  _ParticleData(Random random)
      : x = random.nextDouble(),
        y = random.nextDouble(),
        size = random.nextDouble() * 8 + 3,
        phase = random.nextDouble() * 2 * pi,
        color = random.nextInt(3) == 0
            ? const Color(0xFFFFC857)
            : const Color(0xFF9C6BFF);
}