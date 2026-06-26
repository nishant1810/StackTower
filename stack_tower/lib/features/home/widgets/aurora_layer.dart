import 'dart:math' as math;

import 'package:flutter/material.dart';

class AuroraLayer extends StatefulWidget {
  const AuroraLayer({
    super.key,
  });

  @override
  State<AuroraLayer> createState() =>
      _AuroraLayerState();
}

class _AuroraLayerState extends State<AuroraLayer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 18),
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          final dx =
              math.sin(_controller.value * math.pi * 2) *
                  0.25;

          return Stack(
            fit: StackFit.expand,
            children: [

              //----------------------------------------
              // Cyan Glow
              //----------------------------------------

              Transform.translate(
                offset: Offset(dx * 120, 0),
                child: const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment(-0.7, -0.5),
                      radius: .75,
                      colors: [
                        Color(0x6622D3EE),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),

              //----------------------------------------
              // Purple Glow
              //----------------------------------------

              Transform.translate(
                offset: Offset(-dx * 140, 30),
                child: const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment(.75, -.4),
                      radius: .80,
                      colors: [
                        Color(0x554C1D95),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),

              //----------------------------------------
              // Blue Glow
              //----------------------------------------

              Transform.translate(
                offset: Offset(dx * 90, -25),
                child: const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment(0, -.9),
                      radius: .90,
                      colors: [
                        Color(0x44256DFF),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}