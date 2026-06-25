import 'dart:math';

import 'package:flutter/material.dart';

class ParticlesLayer extends StatefulWidget {
  const ParticlesLayer({super.key});

  @override
  State<ParticlesLayer> createState() => _ParticlesLayerState();
}

class _ParticlesLayerState extends State<ParticlesLayer>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  final random = Random();

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        return Stack(
          children: List.generate(60, (index) {
            final x = (index * 41) % screen.width;

            final y = ((index * 73) -
                controller.value * screen.height)
                .toDouble();

            return Positioned(
              left: x.toDouble(),
              top: y % screen.height,
              child: Opacity(
                opacity: .3 +
                    .7 *
                        sin(
                          controller.value * pi * 2 + index,
                        ).abs(),
                child: Container(
                  width: 2,
                  height: 2,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}