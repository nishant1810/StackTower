import 'dart:math';
import 'package:flutter/material.dart';

class CelebrationParticles extends StatefulWidget {
  const CelebrationParticles({super.key});

  @override
  State<CelebrationParticles> createState() =>
      _CelebrationParticlesState();
}

class _CelebrationParticlesState
    extends State<CelebrationParticles>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  final Random _random = Random();

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
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          return CustomPaint(
            painter: _CelebrationPainter(
              progress: _controller.value,
              random: _random,
            ),
            size: Size.infinite,
          );
        },
      ),
    );
  }
}

class _CelebrationPainter extends CustomPainter {
  final double progress;
  final Random random;

  _CelebrationPainter({
    required this.progress,
    required this.random,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final goldPaint = Paint()
      ..color = const Color(0xFFFFC247);

    final purplePaint = Paint()
      ..color = const Color(0xFFB15DFF);

    final bluePaint = Paint()
      ..color = const Color(0xFF4FC3FF);

    for (int i = 0; i < 80; i++) {
      final x = (i * 47.0) % size.width;

      final y =
          ((progress * size.height * 1.5) +
              (i * 35)) %
              (size.height + 200) -
              100;

      final rotation =
          (progress * 6.28) + (i * 0.3);

      final paint = switch (i % 3) {
        0 => goldPaint,
        1 => purplePaint,
        _ => bluePaint,
      };

      canvas.save();

      canvas.translate(x, y);
      canvas.rotate(rotation);

      canvas.drawRRect(
        RRect.fromRectAndRadius(
          const Rect.fromLTWH(
            -3,
            -8,
            6,
            16,
          ),
          const Radius.circular(2),
        ),
        paint,
      );

      canvas.restore();
    }

    for (int i = 0; i < 25; i++) {
      final x = (i * 73.0) % size.width;

      final y =
          ((progress * size.height * 0.8) +
              (i * 60)) %
              size.height;

      final paint = Paint()
        ..color = const Color(0xFFFFE082)
            .withValues(alpha: 0.8);

      canvas.drawCircle(
        Offset(x, y),
        2.5,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(
      covariant _CelebrationPainter oldDelegate,
      ) {
    return oldDelegate.progress != progress;
  }
}