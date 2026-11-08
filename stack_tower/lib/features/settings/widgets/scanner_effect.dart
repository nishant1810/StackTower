import 'dart:math';

import 'package:flutter/material.dart';

class ScannerEffect extends StatefulWidget {
  const ScannerEffect({super.key});

  @override
  State<ScannerEffect> createState() =>
      _ScannerEffectState();
}

class _ScannerEffectState extends State<ScannerEffect>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
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
        builder: (_, _) {
          final glow =
              16 + sin(controller.value * pi * 2) * 6;

          return Align(
            alignment: Alignment(
              0,
              controller.value * 2 - 1,
            ),
            child: Container(
              height: 26,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.cyanAccent.withValues(alpha: .05),
                    Colors.cyanAccent.withValues(alpha: .35),
                    Colors.white.withValues(alpha: .95),
                    Colors.cyanAccent.withValues(alpha: .35),
                    Colors.transparent,
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color:
                    Colors.cyanAccent.withValues(alpha: .45),
                    blurRadius: glow,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Center(
                child: Container(
                  height: 2,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.white,
                        Colors.cyanAccent,
                        Colors.white,
                        Colors.transparent,
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.cyanAccent
                            .withValues(alpha: .8),
                        blurRadius: 12,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}