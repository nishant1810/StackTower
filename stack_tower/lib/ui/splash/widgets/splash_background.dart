import 'package:flutter/material.dart';

import '../../../core/assets.dart';

class SplashBackground extends StatelessWidget {
  final Animation<double> zoom;

  const SplashBackground({
    super.key,
    required this.zoom,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: zoom,
      builder: (_, __) {
        return Transform.scale(
          scale: zoom.value,
          child: Image.asset(
            AppAssets.splashBackground,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}