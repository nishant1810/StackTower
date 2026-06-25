import 'package:flutter/material.dart';

import '../../services/audio_service.dart';
import '../../services/storage_service.dart';

import '../../screens/game_screen.dart';
import '../../screens/settings_screen.dart';
import '../../screens/theme_shop_screen.dart';
import '../../screens/daily_reward_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> playPulse;

  Future<void> _loadCoins() async {
    final savedCoins =
    await StorageService.getCoins();

    if (!mounted) return;

    setState(() {
      coins = savedCoins;
    });
  }

  Future<void> _checkDailyReward() async {
    final today =
    DateTime.now().toIso8601String().split('T')[0];

    final lastDate =
    await StorageService.getLastRewardDate();

    if (lastDate == today) return;

    int rewardDay =
    await StorageService.getRewardDay();

    final rewards = [
      50,
      75,
      100,
      150,
      200,
      250,
      500,
    ];

    final reward =
    rewards[(rewardDay - 1) % rewards.length];

    await StorageService.addCoins(reward);

    await StorageService.saveLastRewardDate(
      today,
    );

    final displayDay = rewardDay;

    rewardDay++;

    if (rewardDay > 7) {
      rewardDay = 1;
    }

    await StorageService.saveRewardDay(
      rewardDay,
    );

    await _loadCoins();

    if (!mounted) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => DailyRewardDialog(
        day: displayDay,
        reward: reward,
      ),
    );
  }

  int bestScore = 0;
  int coins = 0;
  bool soundEnabled = true;

  @override
  void initState() {
    super.initState();

    _loadBestScore();
    _loadCoins();

    AudioService.startBackgroundMusic();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkDailyReward();
    });

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    playPulse = Tween<double>(
      begin: 0.96,
      end: 1.04,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  Future<void> _loadBestScore() async {
    final score = await StorageService.getBestScore();

    if (!mounted) return;

    setState(() {
      bestScore = score;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void openSettings() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const SettingsScreen(),
      ),
    );
  }

  Widget sideButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 62,
        height: 62,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.35),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: const Color(0xFF4FC3F7),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.4),
              blurRadius: 20,
            ),
          ],
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          /// BACKGROUND
          AnimatedBuilder(
            animation: _controller,
            builder: (_, child) {
              return Transform.scale(
                scale: 1.02 + (_controller.value * 0.03),
                child: child,
              );
            },
            child: Image.asset(
              "assets/images/home_bg.png",
              fit: BoxFit.cover,
            ),
          ),

          /// DARK OVERLAY
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.10),
                  Colors.black.withOpacity(0.55),
                ],
              ),
            ),
          ),

          /// UI
          SafeArea(
            child: Stack(
              children: [
                /// SETTINGS
                Positioned(
                  top: 10,
                  left: 15,
                  child: sideButton(
                    icon: Icons.settings,
                    onTap: openSettings,
                  ),
                ),

                /// SOUND
                Positioned(
                  top: 90,
                  left: 15,
                  child: sideButton(
                    icon: soundEnabled
                        ? Icons.volume_up_rounded
                        : Icons.volume_off_rounded,
                    onTap: () async {
                      setState(() {
                        soundEnabled = !soundEnabled;
                      });

                      if (soundEnabled) {
                        await AudioService.startBackgroundMusic();
                      } else {
                        await AudioService.stopBackgroundMusic();
                      }
                    },
                  ),
                ),

                Positioned(
                  top: 170,
                  left: 15,
                  child: sideButton(
                    icon: Icons.palette_rounded,
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                          const ThemeShopScreen(),
                        ),
                      );

                      _loadCoins();
                    },
                  ),
                ),

                /// COINS
                Positioned(
                  top: 15,
                  right: 15,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.35),
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: Colors.amber,
                        width: 1.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.amber.withOpacity(0.3),
                          blurRadius: 20,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.monetization_on,
                          color: Colors.amber,
                          size: 26,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          coins.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                /// PLAY BUTTON
                Positioned(
                  left: 40,
                  right: 40,
                  bottom: 120,
                  child: AnimatedBuilder(
                    animation: playPulse,
                    builder: (_, child) {
                      return Transform.scale(
                        scale: playPulse.value,
                        child: child,
                      );
                    },
                    child: Hero(
                      tag: "playButton",
                      child: Container(
                        height: 82,
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(28),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF9333EA),
                              Color(0xFFEC4899),
                            ],
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0xFFEC4899),
                              blurRadius: 30,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                const GameScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                            Colors.transparent,
                            shadowColor:
                            Colors.transparent,
                            shape:
                            RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(
                                28,
                              ),
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.play_arrow_rounded,
                                color: Colors.white,
                                size: 40,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "PLAY",
                                style: TextStyle(
                                  fontSize: 36,
                                  fontWeight:
                                  FontWeight.w900,
                                  letterSpacing: 3,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                /// FOOTER
                Positioned(
                  bottom: 15,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Text(
                      "STACK TOWER • v1.0",
                      style: TextStyle(
                        color:
                        Colors.white.withOpacity(
                          .45,
                        ),
                        fontSize: 12,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}