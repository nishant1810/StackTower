import 'package:flutter/material.dart';

class SplashOverlay extends StatelessWidget {
  const SplashOverlay({
    super.key,
  });

  static const LinearGradient _overlayGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [
      0.0,
      0.30,
      0.65,
      1.0,
    ],
    colors: [
      Color(0x44000000),
      Color(0x18000000),
      Color(0x66000000),
      Color(0xCC000000),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return const IgnorePointer(
      child: RepaintBoundary(
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: _overlayGradient,
          ),
          child: SizedBox.expand(),
        ),
      ),
    );
  }
}