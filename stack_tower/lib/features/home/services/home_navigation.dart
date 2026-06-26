import 'package:flutter/material.dart';

import '../../achievements/pages/achievements_page.dart';
import '../../inventory/pages/inventory_page.dart';
import '../../leaderboard/pages/leaderboard_page.dart';
import '../../missions/pages/missions_page.dart';
import '../../settings/pages/settings_page.dart';
import '../../shop/pages/shop_page.dart';
import '../../gameplay/pages/gameplay_page.dart';

class HomeNavigation {
  const HomeNavigation._();

  static Future<void> openGameplay(
      BuildContext context,
      ) {
    return Navigator.push(
      context,
      _page(const GameplayPage()),
    );
  }

  static Future<void> openShop(
      BuildContext context,
      ) {
    return Navigator.push(
      context,
      _page(const ShopPage()),
    );
  }

  static Future<void> openInventory(
      BuildContext context,
      ) {
    return Navigator.push(
      context,
      _page(const InventoryPage()),
    );
  }

  static Future<void> openAchievements(
      BuildContext context,
      ) {
    return Navigator.push(
      context,
      _page(const AchievementsPage()),
    );
  }

  static Future<void> openLeaderboard(
      BuildContext context,
      ) {
    return Navigator.push(
      context,
      _page(const LeaderboardPage()),
    );
  }

  static Future<void> openMissions(
      BuildContext context,
      ) {
    return Navigator.push(
      context,
      _page(const MissionsPage()),
    );
  }

  static Future<void> openSettings(
      BuildContext context,
      ) {
    return Navigator.push(
      context,
      _page(const SettingsPage()),
    );
  }

  static Route _page(
      Widget page,
      ) {
    return PageRouteBuilder(
      transitionDuration:
      const Duration(milliseconds: 350),
      reverseTransitionDuration:
      const Duration(milliseconds: 250),
      pageBuilder:
          (_, animation, __) => page,
      transitionsBuilder:
          (_, animation, __, child) {
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(.08, 0),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeOutCubic,
              ),
            ),
            child: child,
          ),
        );
      },
    );
  }
}