import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import '../game/stack_game.dart';
import 'game_over_overlay.dart';
import 'home_screen.dart';
import 'pause_overlay.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() =>
      _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late StackGame game;

  @override
  void dispose() {
    game.pauseEngine();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    game = StackGame(
      onGameOver: () {
        game.overlays.add('gameOver');
      },
    );
  }

  void restartGame() {
    game.overlays.clear();

    final oldGame = game;

    setState(() {
      game = StackGame(
        onGameOver: () {
          game.overlays.add('gameOver');
        },
      );
    });

    oldGame.pauseEngine();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// GAME
          GameWidget<StackGame>(
            game: game,

            backgroundBuilder: (context) {
              return Image.asset(
                "assets/images/game_bg.png",
                fit: BoxFit.cover,
              );
            },

            overlayBuilderMap: {
              /// PAUSE SCREEN
              'pause': (context, game) {
                return PauseOverlay(
                  score: game.score,
                  bestScore: game.bestScore,

                  onResume: () {
                    game.resumeEngine();
                    game.overlays.remove(
                      'pause',
                    );
                  },

                  onRestart: restartGame,

                    onHome: () {
                      game.overlays.clear();
                      game.pauseEngine();

                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const HomeScreen(),
                        ),
                            (route) => false,
                      );
                    },
                );
              },

              /// GAME OVER SCREEN
              'gameOver': (
                  context,
                  game,
                  ) {
                return GameOverOverlay(
                  score: game.score,
                  bestScore:
                  game.bestScore,
                  coinsEarned: game.coinsEarned,
                  onRestart:
                  restartGame,
                );
              },
            },
          ),

          /// DARK GRADIENT
          IgnorePointer(
            child: Container(
              decoration: BoxDecoration(
                gradient:
                LinearGradient(
                  begin:
                  Alignment.topCenter,
                  end: Alignment
                      .bottomCenter,
                  colors: [
                    Colors.black
                        .withOpacity(
                        0.10),
                    Colors.black
                        .withOpacity(
                        0.25),
                  ],
                ),
              ),
            ),
          ),

          /// HUD
          AnimatedBuilder(
            animation: game,
            builder: (_, __) {
              if (game.overlays
                  .isActive(
                  'pause') ||
                  game.overlays
                      .isActive(
                      'gameOver')) {
                return const SizedBox();
              }

              return SafeArea(
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 12,
                  ),
                  child: Row(
                    crossAxisAlignment:
                    CrossAxisAlignment
                        .start,
                    children: [
                      _pauseButton(),

                      const Spacer(),

                      _scoreWidget(),

                      const Spacer(),

                      _bestWidget(),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _pauseButton() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius:
        BorderRadius.circular(18),
        border: Border.all(
          color:
          const Color(0xFF4FC3F7),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.blue
                .withOpacity(0.4),
            blurRadius: 20,
          ),
        ],
      ),
      child: IconButton(
        onPressed: () {
          game.pauseEngine();
          game.overlays.add(
            'pause',
          );
        },
        icon: const Icon(
          Icons.pause_rounded,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }

  Widget _scoreWidget() {
    return Column(
      children: [
        const Text(
          "SCORE",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight:
            FontWeight.bold,
            letterSpacing: 1,
          ),
        ),

        Text(
          game.score.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 48,
            fontWeight:
            FontWeight.w900,
            shadows: [
              Shadow(
                color:
                Color(0xFF60A5FA),
                blurRadius: 25,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _bestWidget() {
    return Column(
      children: [
        const Text(
          "BEST",
          style: TextStyle(
            color: Colors.amber,
            fontSize: 16,
            fontWeight:
            FontWeight.bold,
          ),
        ),

        Text(
          game.bestScore.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight:
            FontWeight.bold,
          ),
        ),
      ],
    );
  }
}