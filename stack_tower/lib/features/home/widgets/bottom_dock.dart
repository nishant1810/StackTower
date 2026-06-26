import 'package:flutter/material.dart';

import 'dock_item.dart';

class BottomDock extends StatelessWidget {
  const BottomDock({
    super.key,
    required this.onShop,
    required this.onLeaderboard,
    this.onInventory,
    this.onMission,
    this.onAchievement,
  });

  final VoidCallback onShop;
  final VoidCallback onLeaderboard;
  final VoidCallback? onInventory;
  final VoidCallback? onMission;
  final VoidCallback? onAchievement;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.30),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: Colors.white10,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.25),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: DockItem(
              icon: Icons.storefront_rounded,
              label: "Shop",
              onTap: onShop,
            ),
          ),

          Expanded(
            child: DockItem(
              icon: Icons.inventory_2_rounded,
              label: "Items",
              onTap: onInventory ?? () {},
            ),
          ),

          Expanded(
            child: DockItem(
              icon: Icons.flag_rounded,
              label: "Mission",
              badge: 2,
              onTap: onMission ?? () {},
            ),
          ),

          Expanded(
            child: DockItem(
              icon: Icons.emoji_events_rounded,
              label: "Awards",
              onTap: onAchievement ?? () {},
            ),
          ),

          Expanded(
            child: DockItem(
              icon: Icons.leaderboard_rounded,
              label: "Ranks",
              onTap: onLeaderboard,
            ),
          ),
        ],
      ),
    );
  }
}