import 'package:flutter/material.dart';

class ScoreDisplay extends StatelessWidget {
  final int score;

  const ScoreDisplay({
    super.key,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF0E1440),
            Color(0xFF05091C),
          ],
        ),
        border: Border.all(
          color: const Color(0xFF6E7BFF),
          width: 1.6,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6E7BFF)
                .withOpacity(.30),
            blurRadius: 30,
            spreadRadius: 2,
          ),
          BoxShadow(
            color: const Color(0xFF00E5FF)
                .withOpacity(.18),
            blurRadius: 20,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              margin: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius:
                BorderRadius.circular(18),
                border: Border.all(
                  color: Colors.white
                      .withOpacity(.04),
                ),
              ),
            ),
          ),

          Center(
            child: Column(
              mainAxisAlignment:
              MainAxisAlignment.center,
              children: [
                const Text(
                  'SCORE',
                  style: TextStyle(
                    color: Color(0xFFD6D8FF),
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2,
                  ),
                ),

                const SizedBox(height: 8),

                TweenAnimationBuilder<int>(
                  tween: IntTween(
                    begin: 0,
                    end: score,
                  ),
                  duration: const Duration(
                    milliseconds: 1400,
                  ),
                  builder: (_, value, __) {
                    return ShaderMask(
                      shaderCallback: (bounds) {
                        return const LinearGradient(
                          colors: [
                            Color(0xFFFFF6B0),
                            Color(0xFFFFD54F),
                            Color(0xFFFFA726),
                          ],
                        ).createShader(bounds);
                      },
                      child: Text(
                        value.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 62,
                          fontWeight: FontWeight.w900,
                          height: 1,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}