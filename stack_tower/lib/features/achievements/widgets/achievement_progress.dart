import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../models/achievement_model.dart';

class AchievementProgress extends StatefulWidget {
  const AchievementProgress({
    super.key,
    required this.achievements,
  });

  final List<Achievement> achievements;

  @override
  State<AchievementProgress> createState() =>
      _AchievementProgressState();
}

class _AchievementProgressState
    extends State<AchievementProgress>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int get completed =>
      widget.achievements
          .where((e) => e.completed)
          .length;

  int get total =>
      widget.achievements.length;

  int get claimedCoins =>
      widget.achievements
          .where((e) => e.claimed)
          .fold(
        0,
            (sum, e) => sum + e.reward,
      );

  double get progress {
    if (total == 0) return 0;
    return completed / total;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        final glow =
            25 +
                math.sin(
                  _controller.value * math.pi,
                ) *
                    10;

        return Container(
          margin: const EdgeInsets.all(18),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius:
            BorderRadius.circular(24),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xCC0F172A),
                Color(0xCC1E293B),
              ],
            ),
            border: Border.all(
              color: const Color(
                0xFF38BDF8,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.cyan.withOpacity(.25),
                blurRadius: glow,
              ),
            ],
          ),
          child: Row(
            children: [

              //--------------------------------
              // Circle Progress
              //--------------------------------

              SizedBox(
                width: 100,
                height: 100,
                child: Stack(
                  alignment: Alignment.center,
                  children: [

                    SizedBox(
                      width: 100,
                      height: 100,
                      child:
                      CircularProgressIndicator(
                        strokeWidth: 8,
                        value: progress,
                        backgroundColor:
                        Colors.white12,
                        valueColor:
                        const AlwaysStoppedAnimation(
                          Color(0xFF38BDF8),
                        ),
                      ),
                    ),

                    Column(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      children: [

                        Text(
                          "${(progress * 100).toInt()}%",
                          style:
                          const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight:
                            FontWeight.w900,
                          ),
                        ),

                        const Text(
                          "DONE",
                          style: TextStyle(
                            color:
                            Colors.white60,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 20),

              //--------------------------------
              // Stats
              //--------------------------------

              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [

                    const Text(
                      "ACHIEVEMENTS",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 14),

                    _statRow(
                      Icons.emoji_events,
                      "Completed",
                      "$completed / $total",
                    ),

                    const SizedBox(height: 10),

                    _statRow(
                      Icons.monetization_on,
                      "Coins Earned",
                      claimedCoins.toString(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _statRow(
      IconData icon,
      String title,
      String value,
      ) {
    return Row(
      children: [

        Icon(
          icon,
          color: Colors.amber,
          size: 20,
        ),

        const SizedBox(width: 10),

        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 15,
            ),
          ),
        ),

        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}