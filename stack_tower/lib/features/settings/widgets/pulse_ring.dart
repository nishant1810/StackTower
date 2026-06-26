import 'dart:math';

import 'package:flutter/material.dart';

class PulseRing extends StatefulWidget {
  const PulseRing({super.key});

  @override
  State<PulseRing> createState() => _PulseRingState();
}

class _PulseRingState extends State<PulseRing>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
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
        final t = controller.value;

        return SizedBox(
          width: 170,
          height: 170,
          child: Stack(
            alignment: Alignment.center,
            children: [
              _ring(
                scale: 1 + t * .45,
                opacity: (1 - t) * .35,
                stroke: 2,
              ),

              _ring(
                scale: .75 + t * .45,
                opacity: (1 - t) * .22,
                stroke: 1.5,
              ),

              Transform.rotate(
                angle: t * pi * 2,
                child: CustomPaint(
                  size: const Size(150, 150),
                  painter: _EnergyArcPainter(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _ring({
    required double scale,
    required double opacity,
    required double stroke,
  }) {
    return Transform.scale(
      scale: scale,
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: stroke,
            color: Colors.cyanAccent.withOpacity(opacity),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.cyanAccent.withOpacity(opacity * .8),
              blurRadius: 20,
              spreadRadius: 2,
            ),
          ],
        ),
      ),
    );
  }
}

class _EnergyArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round
      ..shader = const SweepGradient(
        colors: [
          Colors.transparent,
          Color(0xff00E5FF),
          Color(0xff7C4DFF),
          Colors.transparent,
        ],
      ).createShader(rect);

    canvas.drawArc(
      Rect.fromCircle(
        center: rect.center,
        radius: size.width / 2 - 8,
      ),
      -.6,
      1.25,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}