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
          height: 76,
          child: Row(
            children: [
              Expanded(
                child: _ProfileHud(
                  state: state,
                ),
              ),

              const SizedBox(width: 10),

              _CurrencyChip(
                icon: Icons.monetization_on_rounded,
                value: _formatNumber(
                  state.coins,
                ),
                color: const Color(
                  0xFFFFC84A,
                ),
              ),

              const SizedBox(width: 8),

              _CurrencyChip(
                icon: Icons.diamond_rounded,
                value: _formatNumber(
                  state.gems,
                ),
                color: const Color(
                  0xFFB46CFF,
                ),
              ),

              const SizedBox(width: 8),

              _SettingsButton(
                onTap: onSettingsTap,
              ),
            ],
          ),
        );
      },
    );
  }

  String _formatNumber(int value) {
    if (value >= 1000000) {
      return '${(value / 1000000).toStringAsFixed(1)}M';
    }

    if (value >= 1000) {
      return '${(value / 1000).toStringAsFixed(1)}K';
    }

    return value.toString();
  }
}

class _ProfileHud extends StatelessWidget {
  const _ProfileHud({
    required this.state,
  });

  final HomeState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 66,
      padding:
      const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        borderRadius:
        BorderRadius.circular(22),
        gradient:
        const LinearGradient(
          colors: [
            Color(0xFF091426),
            Color(0xFF0E1B35),
          ],
        ),
        border: Border.all(
          color: const Color(
            0xFF3BCFFF,
          ),
          width: 1.3,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(
              0xFF3BCFFF,
            ).withValues(alpha: .20),
            blurRadius: 20,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient:
              const LinearGradient(
                colors: [
                  Color(0xFF3BCFFF),
                  Color(0xFF9A5FFF),
                ],
              ),
            ),
            child: const Icon(
              Icons.person_rounded,
              color: Colors.white,
              size: 24,
            ),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Column(
              mainAxisAlignment:
              MainAxisAlignment
                  .center,
              crossAxisAlignment:
              CrossAxisAlignment
                  .start,
              children: [
                Text(
                  state.playerName,
                  maxLines: 1,
                  overflow:
                  TextOverflow
                      .ellipsis,
                  style:
                  const TextStyle(
                    color:
                    Colors.white,
                    fontSize: 13,
                    fontWeight:
                    FontWeight
                        .w800,
                  ),
                ),

                const SizedBox(
                  height: 5,
                ),

                ClipRRect(
                  borderRadius:
                  BorderRadius
                      .circular(8),
                  child:
                  LinearProgressIndicator(
                    value: state.xp
                        .clamp(
                      0.0,
                      1.0,
                    ),
                    minHeight: 5,
                    backgroundColor:
                    Colors.white10,
                    valueColor:
                    const AlwaysStoppedAnimation(
                      Color(
                        0xFF3BCFFF,
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 4,
                ),

                Text(
                  'LEVEL ${state.level}',
                  style:
                  const TextStyle(
                    color:
                    Colors.white70,
                    fontSize: 9,
                    fontWeight:
                    FontWeight
                        .w700,
                    letterSpacing:
                    1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CurrencyChip extends StatelessWidget {
  const _CurrencyChip({
    required this.icon,
    required this.value,
    required this.color,
  });

  final IconData icon;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      constraints:
      const BoxConstraints(
        minWidth: 80,
      ),
      padding:
      const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        borderRadius:
        BorderRadius.circular(18),
        gradient:
        const LinearGradient(
          colors: [
            Color(0xFF091426),
            Color(0xFF0D1931),
          ],
        ),
        border: Border.all(
          color: color,
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: color.withValues(
              alpha: .18,
            ),
            blurRadius: 16,
          ),
        ],
      ),
      child: Row(
        mainAxisSize:
        MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: color,
            size: 20,
          ),

          const SizedBox(width: 6),

          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontWeight:
              FontWeight.w800,
              fontSize: 12,
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
      BorderRadius.circular(18),
      onTap: onTap,
      child: Container(
        width: 58,
        height: 58,
        decoration: BoxDecoration(
          borderRadius:
          BorderRadius.circular(
            18,
          ),
          gradient:
          const LinearGradient(
            colors: [
              Color(0xFF091426),
              Color(0xFF0D1931),
            ],
          ),
          border: Border.all(
            color:
            const Color(
              0xFF9A5FFF,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color:
              const Color(
                0xFF9A5FFF,
              ).withValues(
                alpha: .18,
              ),
              blurRadius: 16,
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