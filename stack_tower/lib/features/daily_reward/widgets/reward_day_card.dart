import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../models/daily_reward.dart';

class RewardDayCard extends StatefulWidget {
  const RewardDayCard({
    super.key,
    required this.reward,
  });

  final DailyReward reward;

  @override
  State<RewardDayCard> createState() =>
      _RewardDayCardState();
}

class _RewardDayCardState
    extends State<RewardDayCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1800,
      ),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color get accent {
    if (widget.reward.claimed) {
      return Colors.green;
    }

    if (widget.reward.current) {
      return Colors.amber;
    }

    return Colors.blueGrey;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        final glow =
        widget.reward.current
            ? 18 +
            math.sin(
              _controller.value *
                  math.pi,
            ) *
                10
            : 8;

        return AnimatedContainer(
          duration: const Duration(
            milliseconds: 300,
          ),
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius:
            BorderRadius.circular(22),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                widget.reward.current
                    ? const Color(
                  0xFFFFD54F,
                ).withValues(alpha: .18)
                    : const Color(
                  0xFF111827,
                ),
                const Color(
                  0xFF1F2937,
                ),
              ],
            ),
            border: Border.all(
              color: accent,
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: accent.withValues(
                  alpha: .35,
                ),
                blurRadius: glow,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment:
            MainAxisAlignment.center,
            children: [

              //------------------------------------
              // Day
              //------------------------------------

              Text(
                "DAY ${widget.reward.day}",
                style: TextStyle(
                  color: accent,
                  fontWeight:
                  FontWeight.bold,
                  letterSpacing: 1.5,
                  fontSize: 14,
                ),
              ),

              const SizedBox(height: 14),

              //------------------------------------
              // Icon
              //------------------------------------

              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient:
                  const LinearGradient(
                    colors: [
                      Color(0xFFFFD54F),
                      Color(0xFFF59E0B),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.amber
                          .withValues(
                        alpha: .45,
                      ),
                      blurRadius: glow,
                    ),
                  ],
                ),
                child: Icon(
                  widget.reward.claimed
                      ? Icons.check
                      : Icons
                      .monetization_on,
                  color: Colors.white,
                  size: 34,
                ),
              ),

              const SizedBox(height: 16),

              //------------------------------------
              // Coins
              //------------------------------------

              Text(
                "${widget.reward.coins}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight:
                  FontWeight.w900,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "COINS",
                style: TextStyle(
                  color: Colors.white60,
                  letterSpacing: 1.5,
                ),
              ),

              const Spacer(),

              //------------------------------------
              // Status
              //------------------------------------

              _statusChip(),
            ],
          ),
        );
      },
    );
  }

  Widget _statusChip() {
    if (widget.reward.claimed) {
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

    if (widget.reward.current) {
      return const Chip(
        backgroundColor: Colors.amber,
        label: Text(
          "TODAY",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

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
}