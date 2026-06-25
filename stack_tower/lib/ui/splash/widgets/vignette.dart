import 'package:flutter/material.dart';

class Vignette extends StatelessWidget {
  const Vignette({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            radius: 1.15,
            colors: [
              Colors.transparent,
              Color(0x33000000),
              Color(0xBB000000),
            ],
            stops: [
              .45,
              .78,
              1,
            ],
          ),
        ),
      ),
    );
  }
}