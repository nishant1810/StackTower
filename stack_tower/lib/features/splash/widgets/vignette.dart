import 'package:flutter/material.dart';

class Vignette extends StatelessWidget {
  const Vignette({
    super.key,
    this.radius = 1.18,
  });

  /// Controls how far the vignette spreads.
  final double radius;

  static const RadialGradient _vignetteGradient = RadialGradient(
    center: Alignment.center,
    radius: 1.18,
    stops: [
      0.45,
      0.78,
      1.0,
    ],
    colors: [
      Colors.transparent,
      Color(0x30000000),
      Color(0xCC000000),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return const IgnorePointer(
      child: RepaintBoundary(
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: _vignetteGradient,
          ),
          child: SizedBox.expand(),
        ),
      ),
    );
  }
}