import 'dart:math';

import 'package:flutter/material.dart';

class FloatingParticles extends StatefulWidget {
  const FloatingParticles({super.key});

  @override
  State<FloatingParticles> createState() =>
      _FloatingParticlesState();
}

class _FloatingParticlesState extends State<FloatingParticles>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: AnimatedBuilder(
        animation: controller,
        builder: (_, __) {
          return CustomPaint(
            size: MediaQuery.of(context).size,
            painter: _ParticlePainter(controller.value),
          );
        },
      ),
    );
  }
}

class _ParticlePainter extends CustomPainter {
  final double animation;

  _ParticlePainter(this.animation);

  static const List<Color> colors = [
    Color(0xff00E5FF),
    Color(0xff4FC3F7),
    Color(0xff7C4DFF),
    Color(0xffBB86FC),
    Colors.white,
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final random = Random(100);

    for (int i = 0; i < 180; i++) {
      final depth = random.nextDouble();

      final speed = 0.25 + depth * 0.75;

      final x =
          random.nextDouble() * size.width +
              sin(animation * pi * 2 + i) * (6 + depth * 12);

      final y = size.height -
          ((animation * size.height * speed +
              random.nextDouble() * size.height) %
              size.height);

      final radius = 0.8 + depth * 3.5;

      final alpha =
          (0.05 + depth * 0.35) *
              (0.75 +
                  0.25 *
                      sin(animation * pi * 6 + i));

      final paint = Paint()
        ..color = colors[random.nextInt(colors.length)]
            .withOpacity(alpha)
        ..maskFilter = MaskFilter.blur(
          BlurStyle.normal,
          radius * 2.5,
        );

      canvas.drawCircle(
        Offset(x, y),
        radius,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(
      covariant _ParticlePainter oldDelegate,
      ) {
    return animation != oldDelegate.animation;
  }
}