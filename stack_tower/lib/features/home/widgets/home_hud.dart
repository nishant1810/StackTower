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
          height: 70,
          child: Row(
            children: [
              Expanded(
                child: _ProfileHud(state: state),
              ),

              const SizedBox(width: 8),

              _CurrencyChip(
                icon: Icons.monetization_on_rounded,
                value: state.coins.toString(),
                color: const Color(0xFFFFC84A),
              ),

              const SizedBox(width: 6),

              _CurrencyChip(
                icon: Icons.diamond_rounded,
                value: state.gems.toString(),
                color: const Color(0xFFB46CFF),
              ),

              const SizedBox(width: 6),

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
    return Container(
      height: 62,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF081326).withOpacity(.92),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF3BCFFF),
          width: 1.3,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF3BCFFF).withOpacity(.20),
            blurRadius: 16,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF3BCFFF),
                  Color(0xFF9A5FFF),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF3BCFFF).withOpacity(.25),
                  blurRadius: 12,
                ),
              ],
            ),
            child: const Icon(
              Icons.person_rounded,
              color: Colors.white,
              size: 22,
            ),
          ),

          const SizedBox(width: 8),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.playerName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                const SizedBox(height: 4),

                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: state.xp.clamp(0.0, 1.0),
                    minHeight: 4,
                    backgroundColor: Colors.white10,
                    valueColor: const AlwaysStoppedAnimation(
                      Color(0xFF3BCFFF),
                    ),
                  ),
                ),

                const SizedBox(height: 3),

                Text(
                  'LV ${state.level}',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 9,
                    fontWeight: FontWeight.w700,
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
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF081326).withOpacity(.92),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: color,
          width: 1.3,
        ),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(.18),
            blurRadius: 12,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: color,
            size: 18,
          ),

          const SizedBox(width: 4),

          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.w800,
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
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: const Color(0xFF081326).withOpacity(.92),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: const Color(0xFF9A5FFF),
            width: 1.3,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF9A5FFF).withOpacity(.18),
              blurRadius: 12,
            ),
          ],
        ),
        child: const Icon(
          Icons.settings_rounded,
          color: Colors.white,
          size: 22,
        ),
      ),
    );
  }
}