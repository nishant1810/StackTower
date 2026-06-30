import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import '../../../core/assets/app_assets.dart';
import '../../../engine/game/stack_game.dart';
import '../../game_over/pages/game_over_page.dart';
import '../../pause/pages/pause_page.dart';
import '../../settings/pages/settings_page.dart';
import '../widgets/gameplay_hud.dart';

class GameplayPage extends StatefulWidget {
  const GameplayPage({super.key});

  @override
  State<GameplayPage> createState() => _GameplayPageState();
}

class _GameplayPageState extends State<GameplayPage> {
  late final StackGame game;

  @override
  void initState() {
    super.initState();

    game = StackGame(
      onGameOver: () {
        if (!mounted) return;

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => GameOverPage(
              score: game.score,
              bestScore: game.bestScore,
              coinsEarned: game.coinsEarned,
            ),
          ),
        );
      },
    );

    game.addListener(_onGameUpdate);
  }

  void _onGameUpdate() {
    if (mounted) {
      setState(() {});
    }
  }

  void _showPauseMenu() {
    game.pauseEngine();

    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (_) {
        return PausePage(
          onResume: () {
            Navigator.pop(context);
            game.resumeEngine();
          },

          onRestart: () {
            Navigator.pop(context);

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const GameplayPage(),
              ),
            );
          },

          onSettings: () async {
            Navigator.pop(context);

            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const SettingsPage(),
              ),
            );

            if (mounted) {
              game.resumeEngine();
            }
          },

          onHome: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
        );
      },
    );
  }

  @override
  void dispose() {
    game.removeListener(_onGameUpdate);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          /// BACKGROUND
          Image.asset(
            AppAssets.gameBackground,
            fit: BoxFit.cover,
          ),

          /// FLAME GAME
          GameWidget<StackGame>(
            game: game,
          ),

          /// HUD
          SafeArea(
            child: GameplayHud(
              score: game.score,
              combo: game.perfectCombo,
            ),
          ),

          /// PAUSE BUTTON
          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 12,
                  right: 16,
                ),
                child: Container(
                  width: 62,
                  height: 62,
                  decoration: BoxDecoration(
                    color: const Color(0xFF09152D)
                        .withValues(alpha: 0.75),
                    borderRadius:
                    BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color(0xFF00E5FF),
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF00E5FF)
                            .withValues(alpha: 0.35),
                        blurRadius: 24,
                      ),
                    ],
                  ),
                  child: IconButton(
                    onPressed: _showPauseMenu,
                    icon: const Icon(
                      Icons.pause_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}