import 'package:flutter/material.dart';

class PerfectOverlay extends StatelessWidget {
  const PerfectOverlay({
    super.key,
    required this.visible,
    required this.points,
  });

  final bool visible;
  final int points;

  @override
  Widget build(BuildContext context) {
    const gold = Color(0xFFFFD54F);
    const orange = Color(0xFFFF9800);

    return IgnorePointer(
      child: Center(
        child: AnimatedScale(
          duration: const Duration(milliseconds: 250),
          scale: visible ? 1.0 : 0.8,
          curve: Curves.easeOutBack,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 250),
            opacity: visible ? 1 : 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: gold,
                      width: 2,
                    ),
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.85),
                        const Color(0xFF1A1A1A),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: gold.withOpacity(0.6),
                        blurRadius: 25,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      ShaderMask(
                        shaderCallback: (bounds) {
                          return const LinearGradient(
                            colors: [
                              Color(0xFFFFF59D),
                              Color(0xFFFFD54F),
                              Color(0xFFFF9800),
                            ],
                          ).createShader(bounds);
                        },
                        child: const Text(
                          'PERFECT',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 42,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 3,
                          ),
                        ),
                      ),

                      const SizedBox(height: 6),

                      Text(
                        '+$points',
                        style: TextStyle(
                          color: orange,
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          shadows: [
                            Shadow(
                              color: orange.withOpacity(0.8),
                              blurRadius: 15,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}