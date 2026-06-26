import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../models/achievement.dart';

class AchievementCard extends StatefulWidget {
  const AchievementCard({
    super.key,
    required this.achievement,
    required this.onClaim,
  });

  final Achievement achievement;

  final VoidCallback onClaim;

  @override
  State<AchievementCard> createState() =>
      _AchievementCardState();
}

class _AchievementCardState
    extends State<AchievementCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 2,
      ),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color get _accent {
    if (widget.achievement.claimed) {
      return Colors.green;
    }

    if (widget.achievement.completed) {
      return Colors.amber;
    }

    return const Color(0xff38BDF8);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        final glow =
            18 +
                math.sin(
                  _controller.value * math.pi,
                ) *
                    8;

        return Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 10,
          ),
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            borderRadius:
            BorderRadius.circular(22),

            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xCC0F172A),
                Color(0xCC1E293B),
              ],
            ),

            border: Border.all(
              color: _accent,
              width: 1.4,
            ),

            boxShadow: [
              BoxShadow(
                color: _accent.withValues(
                  alpha: .25,
                ),
                blurRadius: glow,
              ),
            ],
          ),
          child: Column(
            children: [

              //--------------------------------
              // HEADER
              //--------------------------------

              Row(
                children: [

                  Container(
                    width: 54,
                    height: 54,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient:
                      LinearGradient(
                        colors: [
                          _accent,
                          _accent.withValues(
                            alpha: .6,
                          ),
                        ],
                      ),
                    ),
                    child: const Icon(
                      Icons.emoji_events,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),

                  const SizedBox(width: 16),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [

                        Text(
                          widget
                              .achievement
                              .title,
                          style:
                          const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight:
                            FontWeight.w800,
                          ),
                        ),

                        const SizedBox(
                          height: 4,
                        ),

                        Text(
                          widget
                              .achievement
                              .description,
                          style:
                          const TextStyle(
                            color:
                            Colors.white70,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              //--------------------------------
              // PROGRESS BAR
              //--------------------------------

              ClipRRect(
                borderRadius:
                BorderRadius.circular(12),
                child: LinearProgressIndicator(
                  minHeight: 10,
                  value: widget
                      .achievement
                      .percentage
                      .clamp(0, 1),
                  backgroundColor:
                  Colors.white12,
                  valueColor:
                  AlwaysStoppedAnimation(
                    _accent,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              //--------------------------------
              // PROGRESS
              //--------------------------------

              Align(
                alignment:
                Alignment.centerRight,
                child: Text(
                  "${widget.achievement.progress}/${widget.achievement.target}",
                  style: const TextStyle(
                    color: Colors.white60,
                    fontSize: 12,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              //--------------------------------
              // FOOTER
              //--------------------------------

              Row(
                children: [

                  Container(
                    padding:
                    const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(
                        30,
                      ),
                      color: Colors.amber
                          .withValues(
                        alpha: .15,
                      ),
                    ),
                    child: Row(
                      children: [

                        const Icon(
                          Icons
                              .monetization_on,
                          color: Colors.amber,
                          size: 18,
                        ),

                        const SizedBox(width: 6),

                        Text(
                          "${widget.achievement.reward}",
                          style:
                          const TextStyle(
                            color:
                            Colors.white,
                            fontWeight:
                            FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Spacer(),

                  _buildButton(),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildButton() {
    if (widget.achievement.claimed) {
      return const Chip(
        backgroundColor: Colors.green,
        label: Text(
          "CLAIMED",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }

    if (!widget.achievement.completed) {
      return const Chip(
        backgroundColor: Colors.blueGrey,
        label: Text(
          "LOCKED",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }

    return ElevatedButton(
      onPressed: widget.onClaim,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(14),
        ),
      ),
      child: const Text(
        "CLAIM",
      ),
    );
  }
}