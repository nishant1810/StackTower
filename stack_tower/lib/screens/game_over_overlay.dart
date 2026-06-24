import 'dart:ui';

import 'package:flutter/material.dart';

class GameOverOverlay extends StatelessWidget {
  final int score;
  final int bestScore;
  final int coinsEarned;
  final VoidCallback onRestart;

  const GameOverOverlay({
    super.key,
    required this.score,
    required this.bestScore,
    required this.coinsEarned,
    required this.onRestart,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// BACKGROUND IMAGE
        Positioned.fill(
          child: Image.asset(
            "assets/images/game_over.png",
            fit: BoxFit.cover,
          ),
        ),

        /// DARK OVERLAY
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(.15),
                  Colors.black.withOpacity(.65),
                ],
              ),
            ),
          ),
        ),

        SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Column(
                  children: [
                    /// GAME OVER TITLE
                    const Text(
                      "GAME OVER",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 3,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: Color(0xFFEC4899),
                            blurRadius: 40,
                          ),
                          Shadow(
                            color: Color(0xFF60A5FA),
                            blurRadius: 30,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    /// SCORE CARD
                    ClipRRect(
                      borderRadius:
                      BorderRadius.circular(30),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 15,
                          sigmaY: 15,
                        ),
                        child: Container(
                          width: double.infinity,
                          padding:
                          const EdgeInsets.symmetric(
                            vertical: 30,
                            horizontal: 20,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white
                                .withOpacity(.08),
                            borderRadius:
                            BorderRadius.circular(
                              30,
                            ),
                            border: Border.all(
                              color: Colors.white24,
                            ),
                          ),
                          child: Column(
                            children: [
                              const Text(
                                "YOUR SCORE",
                                style: TextStyle(
                                  color:
                                  Colors.white70,
                                  fontSize: 16,
                                  fontWeight:
                                  FontWeight.bold,
                                  letterSpacing: 2,
                                ),
                              ),

                              const SizedBox(
                                height: 12,
                              ),

                              Text(
                                score.toString(),
                                style:
                                const TextStyle(
                                  color:
                                  Colors.white,
                                  fontSize: 100,
                                  fontWeight:
                                  FontWeight
                                      .w900,
                                  height: .9,
                                  shadows: [
                                    Shadow(
                                      color: Color(
                                          0xFF60A5FA),
                                      blurRadius:
                                      40,
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(
                                height: 20,
                              ),

                              const Divider(
                                color:
                                Colors.white24,
                                indent: 40,
                                endIndent: 40,
                              ),

                              const SizedBox(
                                height: 16,
                              ),

                              /// BEST SCORE
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment
                                    .center,
                                children: [
                                  const Icon(
                                    Icons
                                        .emoji_events,
                                    color:
                                    Colors.amber,
                                    size: 30,
                                  ),
                                  const SizedBox(
                                      width: 10),
                                  Text(
                                    "BEST : $bestScore",
                                    style:
                                    const TextStyle(
                                      color:
                                      Colors.amber,
                                      fontSize: 24,
                                      fontWeight:
                                      FontWeight
                                          .bold,
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(
                                height: 18,
                              ),

                              const Divider(
                                color:
                                Colors.white24,
                                indent: 40,
                                endIndent: 40,
                              ),

                              const SizedBox(
                                height: 18,
                              ),

                              /// COINS EARNED
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment
                                    .center,
                                children: [
                                  const Icon(
                                    Icons
                                        .monetization_on,
                                    color:
                                    Colors.amber,
                                    size: 30,
                                  ),
                                  const SizedBox(
                                      width: 10),
                                  Text(
                                    "+$coinsEarned COINS",
                                    style:
                                    const TextStyle(
                                      color: Colors
                                          .greenAccent,
                                      fontSize: 24,
                                      fontWeight:
                                      FontWeight
                                          .bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 28),

                    /// PLAY AGAIN BUTTON
                    GestureDetector(
                      onTap: onRestart,
                      child: Container(
                        height: 92,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(
                            24,
                          ),
                          gradient:
                          const LinearGradient(
                            colors: [
                              Color(0xFF9333EA),
                              Color(0xFFEC4899),
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(
                                0xFF9333EA,
                              ).withOpacity(.6),
                              blurRadius: 40,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment
                              .center,
                          children: const [
                            Icon(
                              Icons.refresh_rounded,
                              color:
                              Colors.white,
                              size: 34,
                            ),
                            SizedBox(width: 12),
                            Text(
                              "PLAY AGAIN",
                              style: TextStyle(
                                color:
                                Colors.white,
                                fontSize: 28,
                                fontWeight:
                                FontWeight
                                    .w900,
                                letterSpacing:
                                1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    const Text(
                      "KEEP STACKING. BE THE BEST!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                        letterSpacing: 2,
                        fontWeight:
                        FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}