import 'dart:math';

import 'package:flutter/material.dart';

class FloatingCubes extends StatefulWidget {
  const FloatingCubes({super.key});

  @override
  State<FloatingCubes> createState() => _FloatingCubesState();
}

class _FloatingCubesState extends State<FloatingCubes>
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
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        return Stack(
          children: List.generate(10, (i) {
            final x = (size.width / 10) * i + 20;

            final y = 120 +
                sin(controller.value * 2 * pi + i) * 25;

            return Positioned(
              left: x,
              top: y,
              child: Transform.rotate(
                angle: controller.value * pi * 2,
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.08),
                    border: Border.all(
                      color: Colors.cyanAccent.withOpacity(.45),
                    ),
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