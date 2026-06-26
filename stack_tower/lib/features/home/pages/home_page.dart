import 'package:flutter/material.dart';

import 'package:stack_tower/features/gameplay/pages/gameplay_page.dart';

import '../controllers/home_controller.dart';
import '../widgets/aurora_layer.dart';
import '../widgets/bottom_dock.dart';
import '../widgets/home_background.dart';
import '../widgets/particle_layer.dart';
import '../widgets/play_button.dart';
import '../widgets/top_bar.dart';

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
    final screenHeight = MediaQuery.of(context).size.height;

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
                  horizontal: 18,
                  vertical: 14,
                ),
                child: Column(
                  children: [
                    TopBar(
                      controller: controller,
                      onSettingsTap: controller.openSettings,
                    ),

                    const Spacer(),

                    TweenAnimationBuilder<double>(
                      duration: const Duration(
                        milliseconds: 1200,
                      ),
                      curve: Curves.easeOutBack,
                      tween: Tween(
                        begin: 0.75,
                        end: 1.0,
                      ),
                      builder: (_, scale, child) {
                        return Transform.scale(
                          scale: scale,
                          child: child,
                        );
                      },
                      child: PlayButton(
                        controller: controller,
                        onPressed: _startGame,
                      ),
                    ),

                    SizedBox(
                      height: screenHeight * 0.05,
                    ),

                    BottomDock(
                      onShop: controller.openShop,
                      onInventory: controller.openInventory,
                      onMission: controller.openMission,
                      onAchievement: controller.openAchievements,
                      onLeaderboard: controller.openLeaderboard,
                    ),

                    const SizedBox(height: 12),
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