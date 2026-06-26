import 'package:flutter/material.dart';

import 'package:stack_tower/core/assets/app_assets.dart';

class HomeBackground extends StatelessWidget {
  const HomeBackground({
    super.key,
    this.child,
  });

  /// Optional layer rendered above the background.
  final Widget? child;

  static const LinearGradient _overlayGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [
      0.0,
      0.45,
      1.0,
    ],
    colors: [
      Color(0x14000000),
      Color(0x00000000),
      Color(0xA6000000),
    ],
  );

  static const RadialGradient _vignetteGradient = RadialGradient(
    center: Alignment.center,
    radius: 1.18,
    stops: [
      0.55,
      0.82,
      1.0,
    ],
    colors: [
      Colors.transparent,
      Color(0x22000000),
      Color(0xCC000000),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Stack(
        fit: StackFit.expand,
        children: [
          const _BackgroundImage(),

          const _Overlay(),

          const _Vignette(),

          if (child != null) child!,
        ],
      ),
    );
  }
}

class _BackgroundImage extends StatelessWidget {
  const _BackgroundImage();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.homeBackground,
      fit: BoxFit.cover,
      alignment: Alignment.center,
      filterQuality: FilterQuality.high,
      gaplessPlayback: true,
    );
  }
}

class _Overlay extends StatelessWidget {
  const _Overlay();

  @override
  Widget build(BuildContext context) {
    return const Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: HomeBackground._overlayGradient,
        ),
      ),
    );
  }
}

class _Vignette extends StatelessWidget {
  const _Vignette();

  @override
  Widget build(BuildContext context) {
    return const Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: HomeBackground._vignetteGradient,
        ),
      ),
    );
  }
}