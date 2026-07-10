import 'package:flutter/material.dart';

class HomeLeftPanel extends StatelessWidget {
  const HomeLeftPanel({
    super.key,
    this.onLeaderboardTap,
    this.onAchievementsTap,
    this.onThemesTap,
    this.onShopTap,
  });

  final VoidCallback? onLeaderboardTap;
  final VoidCallback? onAchievementsTap;
  final VoidCallback? onThemesTap;
  final VoidCallback? onShopTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _DockButton(
          icon: Icons.emoji_events_rounded,
          glowColor: const Color(0xFFFFD54F),
          onTap: onLeaderboardTap,
        ),

        const SizedBox(height: 12),

        _DockButton(
          icon: Icons.workspace_premium_rounded,
          glowColor: const Color(0xFF53CFFF),
          onTap: onAchievementsTap,
        ),

        const SizedBox(height: 12),

        _DockButton(
          icon: Icons.palette_rounded,
          glowColor: const Color(0xFFAA6CFF),
          onTap: onThemesTap,
        ),

        const SizedBox(height: 12),

        _DockButton(
          icon: Icons.storefront_rounded,
          glowColor: const Color(0xFF64FFB4),
          onTap: onShopTap,
        ),
      ],
    );
  }
}

class _DockButton extends StatelessWidget {
  const _DockButton({
    required this.icon,
    required this.glowColor,
    this.onTap,
  });

  final IconData icon;
  final Color glowColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 62,
        height: 62,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF1A2140),
              Color(0xFF0D1328),
            ],
          ),
          border: Border.all(
            color: glowColor.withOpacity(.8),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: glowColor.withOpacity(.22),
              blurRadius: 18,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }
}