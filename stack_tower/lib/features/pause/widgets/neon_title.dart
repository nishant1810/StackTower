import 'package:flutter/material.dart';

class NeonTitle extends StatelessWidget {
  final String title;

  const NeonTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return const LinearGradient(
          colors: [
            Color(0xFFE5C6FF),
            Color(0xFF9C4DFF),
          ],
        ).createShader(bounds);
      },
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 52,
          fontWeight: FontWeight.w900,
          letterSpacing: 3,
        ),
      ),
    );
  }
}