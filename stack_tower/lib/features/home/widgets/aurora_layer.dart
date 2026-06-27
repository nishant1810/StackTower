import 'dart:math' as math;
import 'package:flutter/material.dart';

class AuroraLayer extends StatefulWidget {
  const AuroraLayer({super.key});

  @override
  State<AuroraLayer> createState() =>
      _AuroraLayerState();
}

class _AuroraLayerState
    extends State<AuroraLayer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        final x =
            math.sin(
              _controller.value *
                  math.pi *
                  2,
            ) *
                120;

        return Stack(
          children: [
            Positioned(
              left: x,
              top: 120,
              child: _glow(
                const Color(0xFF00D1FF),
                350,
              ),
            ),

            Positioned(
              right: x,
              top: 250,
              child: _glow(
                const Color(0xFF7A5BFF),
                300,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _glow(
      Color color,
      double size,
      ) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color:
            color.withValues(
              alpha: .35,
            ),
            blurRadius: size,
            spreadRadius: 40,
          ),
        ],
      ),
    );
  }
}