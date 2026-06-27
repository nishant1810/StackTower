import 'package:flutter/material.dart';
import 'package:stack_tower/features/gameplay/pages/gameplay_page.dart';

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
                    /// TOP HUD
                    HomeHud(
                      controller: controller,
                      onSettingsTap:
                      controller.openSettings,
                    ),

                    const SizedBox(height: 10),

                    /// MAIN CONTENT
                    Expanded(
                      child: LayoutBuilder(
                        builder: (
                            context,
                            constraints,
                            ) {
                          final isSmallPhone =
                              constraints.maxWidth <
                                  380;

                          return Row(
                            crossAxisAlignment:
                            CrossAxisAlignment
                                .center,
                            children: [
                              /// LEFT SIDE
                              SizedBox(
                                width: isSmallPhone
                                    ? 105
                                    : 125,
                                child: Center(
                                  child:
                                  HomeLeftPanel(
                                    controller:
                                    controller,
                                  ),
                                ),
                              ),

                              SizedBox(
                                width: isSmallPhone
                                    ? 6
                                    : 12,
                              ),

                              /// CENTER
                              Expanded(
                                child:
                                HomeCenterPanel(
                                  controller:
                                  controller,
                                  onPlay:
                                  _startGame,
                                ),
                              ),

                              SizedBox(
                                width: isSmallPhone
                                    ? 6
                                    : 12,
                              ),

                              /// RIGHT SIDE
                              SizedBox(
                                width: isSmallPhone
                                    ? 105
                                    : 125,
                                child: Center(
                                  child:
                                  HomeRightPanel(
                                    controller:
                                    controller,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 8),

                    /// BOTTOM FEATURE DOCK
                    FeatureDock(
                      onLeaderboard:
                      controller
                          .openLeaderboard,
                      onAchievements:
                      controller
                          .openAchievements,
                      onReward:
                      controller
                          .openDailyReward,
                      onShop:
                      controller.openShop,
                      onThemes:
                      controller.openThemes,
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