import 'package:flutter/material.dart';

import 'package:stack_tower/core/assets/app_assets.dart';

class SplashBackground extends StatelessWidget {
  const SplashBackground({
    super.key,
    required this.zoom,
  });

  final Animation<double> zoom;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: zoom,
        child: const _BackgroundImage(),
        builder: (context, child) {
          return Transform.scale(
            scale: zoom.value,
            alignment: Alignment.center,
            filterQuality: FilterQuality.high,
            child: child,
          );
        },
      ),
    );
  }
}

class _BackgroundImage extends StatelessWidget {
  const _BackgroundImage();

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Image.asset(
        AppAssets.splashBackground,
        fit: BoxFit.cover,
        alignment: Alignment.center,
        filterQuality: FilterQuality.high,
        gaplessPlayback: true,
      ),
    );
  }
}