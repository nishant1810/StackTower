import 'dart:math';

import 'package:flutter/material.dart';

class FloatingHexagon extends StatefulWidget {
  final double size;
  final Color color;

  const FloatingHexagon({
    super.key,
    required this.size,
    required this.color,
  });

  @override
  State<FloatingHexagon> createState() =>
      _FloatingHexagonState();
}

class _FloatingHexagonState extends State<FloatingHexagon>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
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
        final rotation = controller.value * pi * 2;

        final offset =
            sin(controller.value * pi * 2) * 8;

        final scale =
            1 + sin(controller.value * pi * 2) * .05;

        return Transform.translate(
          offset: Offset(0, offset),
          child: Transform.rotate(
            angle: rotation,
            child: Transform.scale(
              scale: scale,
              child: CustomPaint(
                size: Size.square(widget.size),
                painter: _HexPainter(
                  widget.color,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _HexPainter extends CustomPainter {
  final Color color;

  _HexPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2;

    final center = Offset(radius, radius);

    final path = Path();

    for (int i = 0; i < 6; i++) {
      final angle = (pi / 3 * i) - (pi / 6);

      final x = center.dx + radius * cos(angle);

      final y = center.dy + radius * sin(angle);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    path.close();

    final glowPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..maskFilter =
      const MaskFilter.blur(
        BlurStyle.normal,
        14,
      )
      ..color = color.withOpacity(.12);

    canvas.drawPath(path, glowPaint);

    final borderPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = color.withOpacity(.55);

    canvas.drawPath(path, borderPaint);

    canvas.drawCircle(
      center,
      radius * .12,
      Paint()
        ..color = color.withOpacity(.65),
    );
  }

  @override
  bool shouldRepaint(
      covariant CustomPainter oldDelegate) {
    return true;
  }
}