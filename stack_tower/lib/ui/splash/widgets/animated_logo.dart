import 'package:flutter/material.dart';

import '../../../core/assets.dart';

class AnimatedLogo extends StatelessWidget {
  final Animation<double> fade;
  final Animation<double> floating;
  final Animation<double> scale;

  const AnimatedLogo({
    super.key,
    required this.fade,
    required this.floating,
    required this.scale,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([
        fade,
        floating,
        scale,
      ]),
      builder: (_, __) {
        return Opacity(
          opacity: fade.value,
          child: Transform.translate(
            offset: Offset(
              0,
              floating.value,
            ),
            child: Transform.scale(
              scale: scale.value,
              child: Image.asset(
                AppAssets.splashLogo,
                width: MediaQuery.of(context).size.width * .62,
                fit: BoxFit.contain,
              ),
            ),
          ),
        );
      },
    );
  }
}