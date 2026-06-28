import 'dart:math';
import 'package:flutter/material.dart';

class ConfettiParticle extends StatefulWidget {
  const ConfettiParticle({super.key});

  @override
  State<ConfettiParticle> createState() =>
      _ConfettiParticleState();
}

class _ConfettiParticleState
    extends State<ConfettiParticle>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  final random = Random();

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 3000 + random.nextInt(2000),
      ),
    )..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final startX = random.nextDouble() * 400;

    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        return Positioned(
          left: startX,
          top: controller.value * 900,
          child: Transform.rotate(
            angle: controller.value * 6.28,
            child: Container(
              width: 6,
              height: 14,
              decoration: BoxDecoration(
                color: const Color(0xFFFFC247),
                borderRadius:
                BorderRadius.circular(2),
              ),
            ),
          ),
        );
      },
    );
  }
}