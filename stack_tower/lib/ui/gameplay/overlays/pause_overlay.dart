import 'dart:ui';

import 'package:flutter/material.dart';

class PauseOverlay extends StatelessWidget {
  final int score;
  final int bestScore;

  final VoidCallback onResume;
  final VoidCallback onRestart;
  final VoidCallback onHome;

  const PauseOverlay({
    super.key,
    required this.score,
    required this.bestScore,
    required this.onResume,
    required this.onRestart,
    required this.onHome,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 8,
              sigmaY: 8,
            ),
            child: Container(
              color: Colors.black.withOpacity(0.45),
            ),
          ),
        ),

        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Column(
              children: [
                const SizedBox(height: 70),

                const Text(
                  "PAUSED",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 3,
                    shadows: [
                      Shadow(
                        color: Color(0xFF60A5FA),
                        blurRadius: 30,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 12,
                      sigmaY: 12,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(.25),
                        borderRadius:
                        BorderRadius.circular(24),
                        border: Border.all(
                          color:
                          const Color(0xFF4FC3F7),
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: _statCard(
                              icon: Icons.star,
                              iconColor:
                              Colors.amber,
                              title: "SCORE",
                              value:
                              score.toString(),
                            ),
                          ),

                          const SizedBox(
                            width: 12,
                          ),

                          Expanded(
                            child: _statCard(
                              icon: Icons
                                  .emoji_events,
                              iconColor:
                              Colors.amber,
                              title: "BEST",
                              value: bestScore
                                  .toString(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 35),

                _actionButton(
                  icon:
                  Icons.play_arrow_rounded,
                  text: "RESUME",
                  colors: const [
                    Color(0xFF06B6D4),
                    Color(0xFF2563EB),
                  ],
                  onTap: onResume,
                ),

                const SizedBox(height: 18),

                _actionButton(
                  icon:
                  Icons.refresh_rounded,
                  text: "RESTART",
                  colors: const [
                    Color(0xFF8B5CF6),
                    Color(0xFFEC4899),
                  ],
                  onTap: onRestart,
                ),

                const SizedBox(height: 18),

                _actionButton(
                  icon: Icons.home_rounded,
                  text: "HOME",
                  colors: const [
                    Color(0xFF3B82F6),
                    Color(0xFF06B6D4),
                  ],
                  onTap: onHome,
                ),

                const Spacer(),

                const Text(
                  "STACK • ALIGN • REPEAT",
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 13,
                    fontWeight:
                    FontWeight.w600,
                    letterSpacing: 2,
                  ),
                ),

                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _statCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String value,
  }) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.05),
        borderRadius:
        BorderRadius.circular(18),
        border: Border.all(
          color: Colors.white12,
        ),
      ),
      child: Column(
        mainAxisAlignment:
        MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: iconColor,
            size: 24,
          ),

          const SizedBox(height: 6),

          Text(
            title,
            style: const TextStyle(
              color: Colors.amber,
              fontSize: 12,
              fontWeight:
              FontWeight.bold,
              letterSpacing: 1,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            value,
            maxLines: 1,
            overflow:
            TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
              fontSize:
              value.length > 4
                  ? 22
                  : 26,
              fontWeight:
              FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }

  Widget _actionButton({
    required IconData icon,
    required String text,
    required List<Color> colors,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius:
        BorderRadius.circular(22),
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 76,
          decoration: BoxDecoration(
            borderRadius:
            BorderRadius.circular(
              22,
            ),
            gradient: LinearGradient(
              begin:
              Alignment.topLeft,
              end:
              Alignment.bottomRight,
              colors: colors,
            ),
            boxShadow: [
              BoxShadow(
                color: colors.first
                    .withOpacity(.5),
                blurRadius: 25,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment:
            MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 30,
              ),
              const SizedBox(
                width: 12,
              ),
              Text(
                text,
                style:
                const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight:
                  FontWeight.w900,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}