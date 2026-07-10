  import 'dart:math' as math;

  import 'package:flame/game.dart';
  import 'package:flutter/material.dart';

  import '../../../core/assets/app_assets.dart';
  import '../../../core/services/storage/storage_service.dart';
  import '../../../engine/game/stack_game.dart';

  import '../../themes/data/theme_catalog.dart';
  import '../../game_over/pages/game_over_page.dart';
  import '../../pause/pages/pause_page.dart';
  import '../../settings/pages/settings_page.dart';
  import '../widgets/gameplay_hud.dart';

  class GameplayPage extends StatefulWidget {
    const GameplayPage({super.key});

    @override
    State<GameplayPage> createState() => _GameplayPageState();
  }

  class _GameplayPageState extends State<GameplayPage>
      with SingleTickerProviderStateMixin {
    late final StackGame game;

    late AnimationController _bgController;

    List<Color> themeColors = [
      const Color(0xFF00E5FF),
      const Color(0xFF2979FF),
    ];

    String backgroundImage = AppAssets.skyGameplayBg;

    @override
    void initState() {
      super.initState();

      _bgController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 24),
      )..repeat();

      _loadTheme();

      game = StackGame(
        onGameOver: () {
          if (!mounted) return;

          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => GameOverPage(
              score: game.score,
              bestScore: game.bestScore,
              coinsEarned: game.coinsEarned,
              themeId: game.selectedTheme,

              onRetry: () {
                Navigator.pop(context);

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const GameplayPage(),
                  ),
                );
              },

              onHome: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },

              onRevive: () {
                Navigator.pop(context);

                game.revivePlayer();
              },
            ),
          );
        },
      );

      game.addListener(_onGameUpdate);
    }

    Future<void> _loadTheme() async {
      final selectedTheme =
      await StorageService.getSelectedTheme();

      final palette =
      ThemeCatalog.getPalette(selectedTheme);

      String bgImage;

      switch (selectedTheme) {
        case 'sky':
          bgImage = AppAssets.skyGameplayBg;
          break;

        case 'neon':
          bgImage = AppAssets.neonGameplayBg;
          break;

        case 'purple':
          bgImage = AppAssets.purpleGameplayBg;
          break;

        case 'emerald':
          bgImage = AppAssets.emeraldGameplayBg;
          break;

        case 'lava':
          bgImage = AppAssets.lavaGameplayBg;
          break;

        case 'galaxy':
          bgImage = AppAssets.galaxyGameplayBg;
          break;

        default:
          bgImage = AppAssets.neonGameplayBg;
          break;
      }

      if (!mounted) return;

      setState(() {
        themeColors = palette;
        backgroundImage = bgImage;
      });
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
                  builder: (_) =>
                  const GameplayPage(),
                ),
              );
            },
            onSettings: () async {
              Navigator.pop(context);

              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                  const SettingsPage(),
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
      _bgController.dispose();
      super.dispose();
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            /// PREMIUM PARALLAX BACKGROUND
            AnimatedBuilder(
              animation: _bgController,
              builder: (_, __) {
                final t = _bgController.value;
                final angle = t * 2 * math.pi;

                return Stack(
                  fit: StackFit.expand,
                  children: [
                    Transform.scale(
                      scale: 1.12 +
                          (0.03 * math.sin(angle)),
                      child: Image.asset(
                        backgroundImage,
                        fit: BoxFit.cover,
                      ),
                    ),

                    Transform.translate(
                      offset: Offset(
                        20 * math.cos(angle),
                        12 * math.sin(angle),
                      ),
                      child: Transform.scale(
                        scale: 1.05,
                        child: Opacity(
                          opacity: 0.65,
                          child: Image.asset(
                            backgroundImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),

                    Positioned.fill(
                      child: IgnorePointer(
                        child: Transform.translate(
                          offset: Offset(
                            -500 + (1000 * t),
                            0,
                          ),
                          child: Align(
                            alignment:
                            Alignment.centerLeft,
                            child: Container(
                              width: 220,
                              decoration:
                              BoxDecoration(
                                gradient:
                                LinearGradient(
                                  colors: [
                                    Colors
                                        .transparent,
                                    Colors.white
                                        .withOpacity(
                                      0.08,
                                    ),
                                    Colors
                                        .transparent,
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),

            /// PREMIUM OVERLAY
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.10),
                    Colors.transparent,
                    Colors.black.withOpacity(0.20),
                  ],
                ),
              ),
            ),

            /// GAME
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
                alignment:
                Alignment.topRight,
                child: Padding(
                  padding:
                  const EdgeInsets.only(
                    top: 12,
                    right: 16,
                  ),
                  child: Container(
                    width: 62,
                    height: 62,
                    decoration: BoxDecoration(
                      color: Colors.black
                          .withOpacity(0.4),
                      borderRadius:
                      BorderRadius.circular(
                        20,
                      ),
                      border: Border.all(
                        color:
                        themeColors.first,
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: themeColors
                              .first
                              .withOpacity(
                            0.4,
                          ),
                          blurRadius: 24,
                        ),
                      ],
                    ),
                    child: IconButton(
                      onPressed:
                      _showPauseMenu,
                      icon: const Icon(
                        Icons.pause_rounded,
                        color:
                        Colors.white,
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