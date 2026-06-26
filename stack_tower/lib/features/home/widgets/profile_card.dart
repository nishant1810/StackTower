import 'package:flutter/material.dart';

import '../controllers/home_controller.dart';
import '../models/home_state.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: controller.topBarSlideAnimation,
      child: ValueListenableBuilder<HomeState>(
        valueListenable: controller.state,
        builder: (_, state, __) {
          return Row(
            children: [
              const _Avatar(),

              const SizedBox(width: 14),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  children: [
                    Text(
                      state.playerName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Row(
                      children: [
                        _LevelBadge(
                          level: state.level,
                        ),

                        const SizedBox(width: 10),

                        Expanded(
                          child: _XpBar(
                            progress: state.xp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 62,
      height: 62,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          colors: [
            Color(0xFF00C6FF),
            Color(0xFF7C3AED),
          ],
        ),
        border: Border.all(
          color: Colors.white24,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.cyan.withOpacity(.30),
            blurRadius: 18,
            spreadRadius: 2,
          ),
        ],
      ),
      child: const Icon(
        Icons.person_rounded,
        color: Colors.white,
        size: 34,
      ),
    );
  }
}

class _LevelBadge extends StatelessWidget {
  const _LevelBadge({
    required this.level,
  });

  final int level;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF00C6FF)
            .withOpacity(.18),
        borderRadius:
        BorderRadius.circular(20),
        border: Border.all(
          color: Colors.cyanAccent
              .withOpacity(.45),
        ),
      ),
      child: Text(
        "Lv $level",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _XpBar extends StatelessWidget {
  const _XpBar({
    required this.progress,
  });

  final double progress;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:
      BorderRadius.circular(30),
      child: SizedBox(
        height: 8,
        child: LinearProgressIndicator(
          value: progress.clamp(0.0, 1.0),
          backgroundColor: Colors.white10,
          valueColor:
          const AlwaysStoppedAnimation(
            Color(0xFF00C6FF),
          ),
        ),
      ),
    );
  }
}