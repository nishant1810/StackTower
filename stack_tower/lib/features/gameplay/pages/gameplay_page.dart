import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/assets/app_assets.dart';
import '../controllers/gameplay_controller.dart';
import '../models/game_state.dart';
import '../widgets/gameplay_hud.dart';
import '../../game_over/game_over_overlay.dart';
import '../../pause/pause_overlay.dart';

class GameplayPage extends StatefulWidget {
  const GameplayPage({super.key});

  @override
  State<GameplayPage> createState() => _GameplayPageState();
}

class _GameplayPageState extends State<GameplayPage> {
  late GameplayController controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (mounted && !(_initialized)) {
      final size = MediaQuery.of(context).size;

      controller = GameplayController(
        screenWidth: size.width,
        groundY: size.height * .82,
      );

      controller.initialize();
      controller.startGame();

      _initialized = true;
    }
  }

  bool _initialized = false;

  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersiveSticky,
    );
  }

  @override
  void dispose() {
    controller.dispose();

    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
    );

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ValueListenableBuilder<GameState>(
        valueListenable: controller.state,
        builder: (_, state, __) {
          return Stack(
            fit: StackFit.expand,
            children: [

              //--------------------------------------------------
              // Background
              //--------------------------------------------------

              Image.asset(
                AppAssets.gameBackground,
                fit: BoxFit.cover,
              ),

              //--------------------------------------------------
              // TODO:
              // Tower Widget
              //--------------------------------------------------

              const Center(
                child: Text(
                  "GAME AREA",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              //--------------------------------------------------
              // HUD
              //--------------------------------------------------

              GameplayHud(
                controller: controller,
              ),

              //--------------------------------------------------
              // Pause
              //--------------------------------------------------

              if (state.status == GameStatus.paused)
                PauseOverlay(
                  score: state.score,
                  bestScore: state.bestScore,
                  onResume: controller.resumeGame,
                  onRestart: controller.restartGame,
                  onHome: () {
                    Navigator.pop(context);
                  },
                ),

              //--------------------------------------------------
              // Game Over
              //--------------------------------------------------

              if (state.status == GameStatus.gameOver)
                GameOverOverlay(
                  score: state.score,
                  bestScore: state.bestScore,
                  coinsEarned: state.coinsEarned,
                  onRestart: controller.restartGame,
                ),
            ],
          );
        },
      ),
    );
  }
}