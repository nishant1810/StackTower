import 'dart:ui';

import 'package:flutter/material.dart';

class PausePanel extends StatelessWidget {
  final Widget child;

  const PausePanel({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(28),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 18,
          sigmaY: 18,
        ),
        child: Container(
          width: 380,
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            color: const Color(0xFF09152D)
                .withValues(alpha: 0.45),
            borderRadius: BorderRadius.circular(28),
            border: Border.all(
              color: const Color(0xFFB84DFF),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFB84DFF)
                    .withValues(alpha: 0.35),
                blurRadius: 40,
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}