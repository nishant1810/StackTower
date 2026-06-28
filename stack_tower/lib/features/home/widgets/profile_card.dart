import 'dart:math' as math;
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
          return Container(
            height: 82,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF0A1730),
                  Color(0xFF08101E),
                ],
              ),
              border: Border.all(
                color: const Color(0xFF3BAFFF),
                width: 1.2,
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF3BAFFF)
                      .withOpacity(.18),
                  blurRadius: 18,
                ),
              ],
            ),
            child: Row(
              children: [
                const SizedBox(width: 8),

                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const _Avatar(),

                    Positioned(
                      bottom: -8,
                      left: 18,
                      child: _LevelBadge(
                        level: state.level,
                      ),
                    ),
                  ],
                ),

                const SizedBox(width: 14),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      right: 12,
                      bottom: 8,
                    ),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Icon(
                              Icons.star,
                              color: Color(0xFFFFC857),
                              size: 16,
                            ),
                            SizedBox(width: 6),
                            Text(
                              'TOWER MASTER',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight:
                                FontWeight.w900,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),

                        _XpBar(
                          progress: state.xp,
                        ),

                        const SizedBox(height: 6),

                        Text(
                          '${(state.xp * 10000).toInt()} / 10000',
                          style: TextStyle(
                            color: Colors.white
                                .withOpacity(.75),
                            fontSize: 11,
                            fontWeight:
                            FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _Avatar extends StatefulWidget {
  const _Avatar();

  @override
  State<_Avatar> createState() =>
      _AvatarState();
}

class _AvatarState extends State<_Avatar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        return Transform.rotate(
          angle: _controller.value *
              math.pi *
              2,
          child: Container(
            width: 64,
            height: 64,
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient:
              const SweepGradient(
                colors: [
                  Color(0xFF00C6FF),
                  Color(0xFF7C3AED),
                  Color(0xFF00C6FF),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(
                    0xFF00C6FF,
                  ).withOpacity(.35),
                  blurRadius: 20,
                ),
              ],
            ),
            child: Container(
              decoration:
              const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF08121F),
              ),
              child: const Icon(
                Icons.person,
                color: Colors.white,
                size: 32,
              ),
            ),
          ),
        );
      },
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
      width: 28,
      height: 28,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFF613BFF),
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: 1.2,
        ),
      ),
      child: Text(
        '$level',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w900,
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
    return Container(
      height: 8,
      decoration: BoxDecoration(
        borderRadius:
        BorderRadius.circular(999),
        color: Colors.white10,
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor:
        progress.clamp(0.0, 1.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius:
            BorderRadius.circular(
              999,
            ),
            gradient:
            const LinearGradient(
              colors: [
                Color(0xFF00C6FF),
                Color(0xFFB14DFF),
              ],
            ),
          ),
        ),
      ),
    );
  }
}