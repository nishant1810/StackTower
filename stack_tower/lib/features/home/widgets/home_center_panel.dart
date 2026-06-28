import 'dart:math' as math;
import 'package:flutter/material.dart';

import '../controllers/home_controller.dart';
import 'play_platform_button.dart';

class HomeCenterPanel extends StatelessWidget {
  const HomeCenterPanel({
    super.key,
    required this.controller,
    required this.onPlay,
  });

  final HomeController controller;
  final VoidCallback onPlay;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller.towerFloatController,
      builder: (_, __) {
        final floatOffset =
            controller.towerFloatAnimation.value;

        return Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned.fill(
              child: IgnorePointer(
                child: CustomPaint(
                  painter: _LightRayPainter(
                    progress:
                    controller.towerFloatController.value,
                  ),
                ),
              ),
            ),

            Positioned.fill(
              child: IgnorePointer(
                child: CustomPaint(
                  painter: _EnergyParticlePainter(
                    progress:
                    controller.towerFloatController.value,
                  ),
                ),
              ),
            ),

            Align(
              alignment: const Alignment(0, -0.05),
              child: Transform.translate(
                offset: Offset(
                  0,
                  floatOffset,
                ),
                child: _TowerEnergyCore(
                  intensity:
                  controller.playGlowAnimation.value,
                ),
              ),
            ),

            Align(
              alignment: const Alignment(0, 0.55),
              child: ScaleTransition(
                scale: controller.playGlowAnimation,
                child: PlayPlatformButton(
                  onPlay: onPlay,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _TowerEnergyCore extends StatelessWidget {
  const _TowerEnergyCore({
    required this.intensity,
  });

  final double intensity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 180,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            Colors.white.withOpacity(
              0.9 * intensity,
            ),
            Colors.cyanAccent.withOpacity(
              0.8 * intensity,
            ),
            Colors.cyan.withOpacity(
              0.5 * intensity,
            ),
            Colors.transparent,
          ],
          stops: const [
            0.0,
            0.2,
            0.55,
            1.0,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.cyanAccent.withOpacity(
              0.8 * intensity,
            ),
            blurRadius: 60,
            spreadRadius: 15,
          ),
        ],
      ),
    );
  }
}

class _LightRayPainter extends CustomPainter {
  const _LightRayPainter({
    required this.progress,
  });

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(
      size.width / 2,
      size.height / 2,
    );

    for (int i = 0; i < 16; i++) {
      final angle =
          (i * math.pi / 8) +
              (progress * math.pi * 2);

      final paint = Paint()
        ..color = Colors.cyanAccent.withOpacity(
          0.06,
        )
        ..strokeWidth = 2
        ..strokeCap = StrokeCap.round;

      canvas.drawLine(
        center,
        Offset(
          center.dx +
              math.cos(angle) * size.width,
          center.dy +
              math.sin(angle) * size.height,
        ),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(
      covariant _LightRayPainter oldDelegate,
      ) {
    return oldDelegate.progress != progress;
  }
}

class _EnergyParticlePainter extends CustomPainter {
  const _EnergyParticlePainter({
    required this.progress,
  });

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    for (int i = 0; i < 40; i++) {
      final angle =
          (i * 0.45) +
              (progress * math.pi * 2);

      final radius =
          80 +
              (i * 7) +
              (math.sin(
                progress * math.pi * 2,
              ) *
                  12);

      final x =
          size.width / 2 +
              math.cos(angle) * radius;

      final y =
          size.height / 2 +
              math.sin(angle) * radius;

      paint.color = Colors.cyanAccent.withOpacity(
        0.12,
      );

      canvas.drawCircle(
        Offset(x, y),
        2 + (i % 4).toDouble(),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(
      covariant _EnergyParticlePainter oldDelegate,
      ) {
    return oldDelegate.progress != progress;
  }
}