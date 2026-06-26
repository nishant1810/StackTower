import 'dart:math';
import 'package:flutter/material.dart';

class NeonBorderPainter extends CustomPainter {
  final double animation;

  NeonBorderPainter(this.animation);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = RRect.fromRectAndRadius(
      Offset.zero & size,
      const Radius.circular(34),
    );

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..shader = SweepGradient(
        startAngle: 0,
        endAngle: pi * 2,
        transform: GradientRotation(
          animation * pi * 2,
        ),
        colors: const [
          Color(0xff00F5FF),
          Color(0xff6D28D9),
          Color(0xff00F5FF),
        ],
      ).createShader(
        Offset.zero & size,
      );

    canvas.drawRRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant NeonBorderPainter oldDelegate) => true;
}