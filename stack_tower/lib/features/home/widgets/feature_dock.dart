import 'package:flutter/material.dart';

class FeatureDock extends StatelessWidget {
  const FeatureDock({
    super.key,
    required this.onLeaderboard,
    required this.onAchievements,
    required this.onReward,
    required this.onShop,
    required this.onThemes,
  });

  final VoidCallback onLeaderboard;
  final VoidCallback onAchievements;
  final VoidCallback onReward;
  final VoidCallback onShop;
  final VoidCallback onThemes;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      child: Row(
        mainAxisAlignment:
        MainAxisAlignment.spaceEvenly,
        children: [
          _DockCard(
            icon: Icons.emoji_events_rounded,
            label: 'RANK',
            color: const Color(0xFF3BCFFF),
            onTap: onLeaderboard,
          ),

          _DockCard(
            icon: Icons.card_giftcard_rounded,
            label: 'REWARD',
            color: const Color(0xFFFFC84A),
            onTap: onReward,
            showBadge: true,
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
            width: 52,
            height: 64,
            decoration: BoxDecoration(
              color: const Color(0xFF081326)
                  .withOpacity(0.92),
              borderRadius:
              BorderRadius.circular(18),
              border: Border.all(
                color: color,
                width: 1.4,
              ),
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(.22),
                  blurRadius: 16,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment:
              MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: color,
                  size: 22,
                ),

                const SizedBox(height: 4),

                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 7,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.8,
                  ),
                ),
              ],
            ),
          ),

          if (showBadge)
            Positioned(
              top: -2,
              right: -2,
              child: Container(
                width: 12,
                height: 12,
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