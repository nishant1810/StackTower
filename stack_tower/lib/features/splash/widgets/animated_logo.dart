import 'package:flutter/material.dart';

import 'package:stack_tower/core/assets/app_assets.dart';

class AnimatedLogo extends StatelessWidget {
  const AnimatedLogo({
    super.key,
    required this.fade,
    required this.floating,
    required this.scale,
    this.widthFactor = 0.62,
  });

  final Animation<double> fade;
  final Animation<double> floating;
  final Animation<double> scale;

  /// Percentage of screen width occupied by the logo.
  final double widthFactor;

  @override
  Widget build(BuildContext context) {
    final double logoWidth =
        MediaQuery.sizeOf(context).width * widthFactor;

    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: Listenable.merge([
          fade,
          floating,
          scale,
        ]),
        child: Image.asset(
          AppAssets.splashLogo,
          width: logoWidth,
          fit: BoxFit.contain,
          filterQuality: FilterQuality.high,
        ),
        builder: (context, child) {
          return Opacity(
            opacity: fade.value,
            child: Transform.translate(
              offset: Offset(
                0,
                floating.value,
              ),
              child: Transform.scale(
                scale: scale.value,
                alignment: Alignment.center,
                child: child,
              ),
            ),
          );
        },
      ),
    );
  }
}