import 'dart:ui';
import 'package:flutter/material.dart';

class GlassPanel extends StatelessWidget {
  final Widget child;

  const GlassPanel({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(32),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 18,
          sigmaY: 18,
        ),
        child: Container(
          width: double.infinity,
          constraints: const BoxConstraints(
            maxWidth: 420,
            maxHeight: 650,
          ),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xFF081A26)
                .withValues(alpha: 0.35),
            borderRadius: BorderRadius.circular(32),
            border: Border.all(
              color: const Color(0xFF00E5FF),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF00E5FF)
                    .withValues(alpha: 0.55),
                blurRadius: 45,
                spreadRadius: 2,
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}