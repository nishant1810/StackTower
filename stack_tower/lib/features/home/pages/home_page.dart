import 'package:flutter/material.dart';
import 'package:stack_tower/features/daily_reward/controllers/daily_reward_controller.dart';
import 'package:stack_tower/features/daily_reward/pages/daily_reward_page.dart';
import 'package:stack_tower/features/gameplay/pages/gameplay_page.dart';

import '../../../core/services/storage_service.dart';
import '../../leaderboard/pages/leaderboard_page.dart';

import '../controllers/home_controller.dart';
import '../widgets/aurora_layer.dart';
import '../widgets/feature_dock.dart';
import '../widgets/home_background.dart';
import '../widgets/home_center_panel.dart';
import '../widgets/home_hud.dart';
import '../widgets/home_left_panel.dart';
import '../widgets/home_right_panel.dart';
import '../widgets/particle_layer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin {
  late final HomeController controller;

  @override
  void initState() {
    super.initState();

    controller = HomeController(
      vsync: this,
    );

    controller.initialize();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkDailyReward();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> _startGame() async {
    if (!mounted) return;

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const GameplayPage(),
      ),
    );
  }

  Future<void> _openDailyReward() async {
    if (!mounted) return;

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => DailyRewardPage(),
      ),
    );
  }

  Future<void> _openLeaderboard() async {
    final bestScore = await StorageService.getBestScore();

    if (!mounted) return;

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => LeaderboardPage(
          bestScore: bestScore,
        ),
      ),
    );
  }

  Future<void> _checkDailyReward() async {
    final rewardController = DailyRewardController();

    await rewardController.initialize();

    if (!mounted) {
      rewardController.dispose();
      return;
    }

    if (rewardController.canClaim) {
      await Future.delayed(
        const Duration(milliseconds: 700),
      );

      if (!mounted) {
        rewardController.dispose();
        return;
      }

      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => DailyRewardPage(),
        ),
      );
    }

    rewardController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: controller.playOpacityAnimation,
        child: Stack(
          fit: StackFit.expand,
          children: [
            const HomeBackground(),
            const AuroraLayer(),
            const ParticleLayer(),

            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    HomeHud(
                      controller: controller,
                      onSettingsTap: controller.openSettings,
                    ),

                    const SizedBox(height: 10),

                    Expanded(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final isSmallPhone =
                              constraints.maxWidth < 380;

                          return Row(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              /// LEFT PANEL
                              SizedBox(
                                width: isSmallPhone ? 150 : 160,
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.only(
                                      top: 60,
                                    ),
                                    child: HomeLeftPanel(
                                      controller: controller,
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(
                                width: isSmallPhone ? 2 : 6,
                              ),

                              /// CENTER PANEL
                              Expanded(
                                child: HomeCenterPanel(
                                  controller: controller,
                                  onPlay: _startGame,
                                ),
                              ),

                              SizedBox(
                                width: isSmallPhone ? 2 : 6,
                              ),

                              /// RIGHT PANEL
                              SizedBox(
                                width: isSmallPhone ? 110 : 120,
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.only(
                                      top: 60,
                                    ),
                                    child: HomeRightPanel(
                                      controller: controller,
                                      onRewardTap:
                                      _openDailyReward,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 8),

                    FeatureDock(
                      onLeaderboard: _openLeaderboard,
                      onAchievements:
                      controller.openAchievements,
                      onShop: controller.openShop,
                      onThemes: controller.openThemes,
                    ),

                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}