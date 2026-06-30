import 'package:flutter/material.dart';

import '../controllers/home_controller.dart';
import '../models/home_state.dart';

class HomeHud extends StatelessWidget {
  const HomeHud({
    super.key,
    required this.controller,
    required this.onSettingsTap,
  });

  final HomeController controller;
  final VoidCallback onSettingsTap;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<HomeState>(
      valueListenable: controller.state,
      builder: (_, state, __) {
        return SizedBox(
          height: 80,
          child: Row(
            children: [
              Expanded(
                child: _ProfileHud(
                  state: state,
                ),
              ),

              const SizedBox(width: 5),

              _SettingsButton(
                onTap: onSettingsTap,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ProfileHud extends StatelessWidget {
  const _ProfileHud({
    required this.state,
  });

  final HomeState state;

  @override
  Widget build(BuildContext context) {
    final currentXp = (state.xp * 10000).toInt();
    const maxXp = 10000;

    return Container(
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white.withValues(alpha: 0.04),
            Colors.white.withValues(alpha: 0.01),
          ],
        ),
        border: Border.all(
          color: const Color(0xFF53CFFF),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(
              0xFF53CFFF,
            ).withValues(alpha: 0.08),
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
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(
                      0xFF6EDBFF,
                    ),
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(
                        0xFF6EDBFF,
                      ).withValues(alpha: 0.30),
                      blurRadius: 18,
                    ),
                  ],
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF1B3A7A),
                      Color(0xFF6B3DFF),
                    ],
                  ),
                ),
                child: const Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 24,
                ),
              ),

              Positioned(
                bottom: -3,
                left: -2,
                child: Container(
                  width: 18,
                  height: 18,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF7A4DFF),
                        Color(0xFF4A2FFF),
                      ],
                    ),
                    border: Border.all(
                      color: Colors.white24,
                    ),
                  ),
                  child: Text(
                    '${state.level}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10,
                right: 12,
                bottom: 10,
              ),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                mainAxisAlignment:
                MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 18,
                        height: 18,
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(5),
                          color: const Color(
                            0xFFFFD54F,
                          ),
                        ),
                        child: const Icon(
                          Icons.star,
                          size: 12,
                          color: Colors.black,
                        ),
                      ),

                      const SizedBox(width: 3),

                      Expanded(
                        child: Text(
                          state.playerName
                              .toUpperCase(),
                          maxLines: 1,
                          overflow:
                          TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight:
                            FontWeight.w900,
                            letterSpacing: 0.8,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 5),

                  ClipRRect(
                    borderRadius:
                    BorderRadius.circular(20),
                    child: SizedBox(
                      height: 7,
                      child:
                      LinearProgressIndicator(
                        value: state.xp,
                        backgroundColor:
                        Colors.white10,
                        valueColor:
                        const AlwaysStoppedAnimation(
                          Color(0xFF6EDBFF),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 3),

                  Text(
                    '$currentXp / $maxXp',
                    style: TextStyle(
                      color: Colors.white
                          .withValues(alpha: 0.75),
                      fontSize: 9,
                      fontWeight:
                      FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsButton extends StatelessWidget {
  const _SettingsButton({
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius:
      BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        width: 54,
        height: 54,
        decoration: BoxDecoration(
          borderRadius:
          BorderRadius.circular(
            16,
          ),
          gradient:
          const LinearGradient(
            colors: [
              Color(0xFF091426),
              Color(0xFF0D1931),
            ],
          ),
          border: Border.all(
            color: const Color(
              0xFF9A5FFF,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(
                0xFF9A5FFF,
              ).withValues(
                alpha: .16,
              ),
              blurRadius: 14,
            ),
          ],
        ),
        child: const Icon(
          Icons.settings_rounded,
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }
}