import 'dart:math';

import 'package:flutter/material.dart';

class RotatingGear extends StatefulWidget {
  const RotatingGear({super.key});

  @override
  State<RotatingGear> createState() => _RotatingGearState();
}

class _RotatingGearState extends State<RotatingGear>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 16),
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
        final glow =
            18 + sin(controller.value * pi * 2) * 8;

        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.cyan.withOpacity(.35),
                    blurRadius: glow,
                  ),
                  BoxShadow(
                    color: Colors.purple.withOpacity(.30),
                    blurRadius: glow + 12,
                  ),
                ],
              ),
            ),

            RotationTransition(
              turns: controller,
              child: CustomPaint(
                size: const Size(90, 90),
                painter: _GearPainter(),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _GearPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(
      size.width / 2,
      size.height / 2,
    );

    final radius = size.width / 2 - 10;

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..color = Colors.white;

    // Outer gear teeth
    for (int i = 0; i < 8; i++) {
      final angle = i * pi / 4;

      final outer = Offset(
        center.dx + (radius + 8) * cos(angle),
        center.dy + (radius + 8) * sin(angle),
      );

      final inner = Offset(
        center.dx + radius * cos(angle),
        center.dy + radius * sin(angle),
      );

      canvas.drawLine(inner, outer, paint);
    }

    // Outer ring
    canvas.drawCircle(
      center,
      radius,
      paint,
    );

    // Inner ring
    canvas.drawCircle(
      center,
      radius * .45,
      paint,
    );

    // Center hub
    canvas.drawCircle(
      center,
      radius * .12,
      Paint()..color = Colors.white,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}