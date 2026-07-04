import 'package:flutter/material.dart';
import 'package:stack_tower/features/daily_reward/controllers/daily_reward_controller.dart';
import 'package:stack_tower/features/daily_reward/pages/daily_reward_page.dart';
import 'package:stack_tower/features/gameplay/pages/gameplay_page.dart';

import '../../../core/services/audio/audio_service.dart';
import '../../../core/services/storage/storage_service.dart';

import '../../leaderboard/pages/leaderboard_page.dart';

import '../controllers/home_controller.dart';

import '../widgets/aurora_layer.dart';
import '../widgets/feature_dock.dart';
import '../widgets/home_background.dart';
import '../widgets/home_center_panel.dart';
import '../widgets/home_hud.dart';
import '../widgets/home_right_panel.dart';
import '../widgets/particle_layer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin, WidgetsBindingObserver {

  @override
  void didChangeAppLifecycleState(
      AppLifecycleState state,
      ) {
    switch (state) {
      case AppLifecycleState.resumed:
        AudioService.startBackgroundMusic();
        break;

      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        AudioService.stopBackgroundMusic();
        break;

      default:
        break;
    }
  }

  late final HomeController controller;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);

    controller = HomeController(
      vsync: this,
    );

    controller.initialize();

    _initializeAudio();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkDailyReward();
    });
  }

  Future<void> _initializeAudio() async {
    await AudioService.initialize();

    final musicEnabled =
    await StorageService.getMusicEnabled();

    await AudioService.setMusicEnabled(
      musicEnabled,
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    AudioService.dispose();

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

    await controller.refresh();
  }

  Future<void> _openDailyReward() async {
    if (!mounted) return;

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => DailyRewardPage(),
      ),
    );

    await controller.refresh();
  }

  Future<void> _openLeaderboard() async {
    if (!mounted) return;

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const LeaderboardPage(),
      ),
    );
  }

  Future<void> _checkDailyReward() async {
    final rewardController =
    DailyRewardController();

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

      await controller.refresh();
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

            IgnorePointer(
              child: Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: const Alignment(
                      0,
                      -0.05,
                    ),
                    radius: .85,
                    colors: [
                      const Color(
                        0xFF3BCFFF,
                      ).withValues(alpha: .06),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),

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
                      onSettingsTap: () =>
                          controller.openSettings(
                            context,
                          ),
                    ),

                    const SizedBox(height: 16),

                    Expanded(
                      child: LayoutBuilder(
                        builder: (
                            context,
                            constraints,
                            ) {
                          final isSmallPhone =
                              constraints.maxWidth <
                                  380;

                          return Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Center(
                                child:
                                HomeCenterPanel(
                                  controller:
                                  controller,
                                  onPlay:
                                  _startGame,
                                ),
                              ),
                              Positioned(
                                right: isSmallPhone
                                    ? 0
                                    : 8,
                                top: isSmallPhone
                                    ? 70
                                    : 90,
                                child:
                                HomeRightPanel(
                                  controller:
                                  controller,
                                  onRewardTap:
                                  _openDailyReward,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 16),

                    Padding(
                      padding:
                      const EdgeInsets.symmetric(
                        horizontal: 6,
                      ),
                      child: FeatureDock(
                        onLeaderboard:
                        _openLeaderboard,
                        onAchievements: () =>
                            controller
                                .openAchievements(
                              context,
                            ),
                        onShop: () =>
                            controller.openShop(
                              context,
                            ),
                        onThemes: () =>
                            controller.openThemes(
                              context,
                            ),
                      ),
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