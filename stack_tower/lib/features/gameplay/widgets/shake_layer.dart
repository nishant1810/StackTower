import 'dart:math';

import 'package:flutter/material.dart';

class ShakeLayer extends StatelessWidget {
  const ShakeLayer({
    super.key,
    required this.intensity,
    required this.child,
  });

  final double intensity;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final random = Random();

    return Transform.translate(
      offset: Offset(
        (random.nextDouble() - 0.5) *
            intensity,
        (random.nextDouble() - 0.5) *
            intensity,
      ),
      child: child,
    );
  }
}