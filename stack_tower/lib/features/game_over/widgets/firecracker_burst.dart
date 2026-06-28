import 'dart:math';
import 'package:flutter/material.dart';

class FirecrackerBurst extends StatefulWidget {
  const FirecrackerBurst({super.key});

  @override
  State<FirecrackerBurst> createState() =>
      _FirecrackerBurstState();
}

class _FirecrackerBurstState
    extends State<FirecrackerBurst>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        return CustomPaint(
          size: const Size(80, 80),
          painter: _FirecrackerPainter(
            controller.value,
          ),
        );
      },
    );
  }
}

class _FirecrackerPainter extends CustomPainter {
  final double progress;

  _FirecrackerPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(
      size.width / 2,
      size.height / 2,
    );

    final paint = Paint()
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    for (int i = 0; i < 16; i++) {
      final angle = (i / 16) * pi * 2;

      paint.color =
      i.isEven
          ? const Color(0xFFFFC247)
          : const Color(0xFF9B5CFF);

      final start = center;

      final end = Offset(
        center.dx +
            cos(angle) * 35 * progress,
        center.dy +
            sin(angle) * 35 * progress,
      );

      canvas.drawLine(
        start,
        end,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(
      covariant CustomPainter oldDelegate,
      ) {
    return true;
  }
}