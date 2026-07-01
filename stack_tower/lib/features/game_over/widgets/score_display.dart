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
      width: 220,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),

        // Transparent glass
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white.withValues(alpha: 0.08),
            Colors.white.withValues(alpha: 0.02),
          ],
        ),

        border: Border.all(
          color: const Color(0xFF6EDBFF),
          width: 1.4,
        ),

        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6EDBFF)
                .withValues(alpha: 0.15),
            blurRadius: 20,
          ),
        ],
      ),
      child: Stack(
        children: [
          // Glass shine
          // Positioned(
          //   top: 6,
          //   left: 16,
          //   right: 16,
            // child: Container(
            //   height: 8,
            //   decoration: BoxDecoration(
            //     borderRadius:
            //     BorderRadius.circular(20),
            //     gradient: LinearGradient(
            //       colors: [
            //         Colors.white.withValues(
            //           alpha: 0.12,
            //         ),
            //         Colors.white.withValues(
            //           alpha: 0.01,
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          // ),

          // Inner border
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.circular(18),
                  border: Border.all(
                    color: Colors.white
                        .withValues(alpha: 0.08),
                  ),
                ),
              ),
            ),
          ),

          Center(
            child: Column(
              mainAxisAlignment:
              MainAxisAlignment.center,
              children: [
                Text(
                  'SCORE',
                  style: TextStyle(
                    color: Colors.white
                        .withValues(alpha: 0.75),
                    fontSize: 10,
                    fontWeight:
                    FontWeight.w700,
                    letterSpacing: 3,
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
                  builder: (
                      _,
                      value,
                      __,
                      ) {
                    return Text(
                      value.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 62,
                        fontWeight:
                        FontWeight.w900,
                        height: 1,
                        shadows: [
                          Shadow(
                            color: const Color(
                              0xFF6EDBFF,
                            ).withValues(
                              alpha: 0.5,
                            ),
                            blurRadius: 16,
                          ),
                        ],
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