import 'dart:math';

import 'package:flutter/material.dart';

class ParticleOverlay extends StatefulWidget {
  const ParticleOverlay({
    super.key,
  });

  @override
  State<ParticleOverlay> createState() =>
      _ParticleOverlayState();
}

class _ParticleOverlayState
    extends State<ParticleOverlay> {
  final random = Random();

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}