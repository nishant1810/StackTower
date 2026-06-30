import 'package:flutter/material.dart';

class FeatureDock extends StatelessWidget {
  const FeatureDock({
    super.key,
    required this.onLeaderboard,
    required this.onAchievements,
    required this.onShop,
    required this.onThemes,
  });

  final VoidCallback onLeaderboard;
  final VoidCallback onAchievements;
  final VoidCallback onShop;
  final VoidCallback onThemes;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 78,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _DockCard(
            icon: Icons.emoji_events_rounded,
            label: 'RANK',
            color: const Color(0xFF3BCFFF),
            onTap: onLeaderboard,
          ),
          _DockCard(
            icon: Icons.workspace_premium_rounded,
            label: 'MISSION',
            color: const Color(0xFFFFB347),
            onTap: onAchievements,
          ),
          _DockCard(
            icon: Icons.storefront_rounded,
            label: 'SHOP',
            color: const Color(0xFFFF69F8),
            onTap: onShop,
          ),
          _DockCard(
            icon: Icons.palette_rounded,
            label: 'THEMES',
            color: const Color(0xFF4FB8FF),
            onTap: onThemes,
          ),
        ],
      ),
    );
  }
}

class _DockCard extends StatelessWidget {
  const _DockCard({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
    this.showBadge = false,
  });

  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;
  final bool showBadge;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 60,
            height: 70,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF0D1830),
                  Color(0xFF081326),
                ],
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: color,
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(0.22),
                  blurRadius: 18,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: color,
                  size: 24,
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 2,
                  ),
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.8,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (showBadge)
            Positioned(
              top: -3,
              right: -3,
              child: Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 1,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}