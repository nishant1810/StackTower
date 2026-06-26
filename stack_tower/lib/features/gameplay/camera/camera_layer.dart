import 'package:flutter/material.dart';

import 'camera_controller.dart';

class CameraLayer extends StatelessWidget {
  const CameraLayer({
    super.key,
    required this.controller,
    required this.child,
  });

  final CameraController controller;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        return Transform.translate(
          offset: Offset(
            0,
            controller.offsetY,
          ),
          child: child,
        );
      },
    );
  }
}