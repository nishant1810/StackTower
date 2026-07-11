import 'package:flutter/material.dart';

import '../../../core/assets/app_assets.dart';
import '../controllers/settings_controller.dart';
import '../models/settings_state.dart';
import '../widgets/settings_footer.dart';
import '../widgets/settings_switch_tile.dart';
import '../widgets/settings_tile.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() =>
      _SettingsPageState();
}

class _SettingsPageState
    extends State<SettingsPage> {
  late final SettingsController controller;

  @override
  void initState() {
    super.initState();
    controller = SettingsController();
    controller.initialize();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> _showResetDialog() async {
    final confirmed =
        await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor:
              const Color(0xFF131A4D),
              title: const Text(
                'Reset Progress?',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              content: const Text(
                'This will permanently delete all progress, coins, themes, achievements and statistics.',
                style: TextStyle(
                  color: Colors.white70,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(
                      context,
                      false,
                    );
                  },
                  child: const Text(
                    'Cancel',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(
                      context,
                      true,
                    );
                  },
                  child: const Text(
                    'Reset',
                  ),
                ),
              ],
            );
          },
        ) ??
            false;

    if (!confirmed) return;

    await controller.resetProgress();

    if (!mounted) return;

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(
      const SnackBar(
        content: Text(
          'Progress Reset Successfully',
        ),
      ),
    );
  }

  static void _emptyAction() {}

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final backButtonSize =
    (MediaQuery.of(context).size.width * 0.14)
        .clamp(52.0, 68.0);

    final titleSize =
    (MediaQuery.of(context).size.width *
        0.085)
        .clamp(26.0, 38.0);

    final horizontalPadding =
    (size.width * 0.05)
        .clamp(16.0, 24.0);

    final verticalPadding =
    (size.height * 0.02)
        .clamp(12.0, 24.0);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppAssets.homeBackground,
              fit: BoxFit.cover,
            ),
          ),

          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(
                0.55,
              ),
            ),
          ),

          SafeArea(
            child: ValueListenableBuilder<
                SettingsState>(
              valueListenable:
              controller.state,
              builder: (
                  context,
                  state,
                  _,
                  ) {
                return SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding,
                    vertical: verticalPadding,
                  ),
                  child: Column(
                    children: [
                      /// HEADER
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: backButtonSize,
                              height: backButtonSize,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xFF1B2A7A),
                                    Color(0xFF0B1033),
                                  ],
                                ),
                                border: Border.all(
                                  color: const Color(
                                    0xFF7B61FF,
                                  ).withOpacity(0.60),
                                  width: 1.5,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(
                                      0xFF6A5CFF,
                                    ).withOpacity(0.35),
                                    blurRadius: 22,
                                    spreadRadius: 2,
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.arrow_back_rounded,
                                  color: Colors.white,
                                  size: (backButtonSize * 0.45)
                                      .clamp(22.0, 30.0),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(
                            width: size.width * 0.04,
                          ),

                          Expanded(
                            child: Center(
                              child: ShaderMask(
                                shaderCallback: (bounds) {
                                  return const LinearGradient(
                                    colors: [
                                      Colors.white,
                                      Color(0xFFB7C7FF),
                                    ],
                                  ).createShader(bounds);
                                },
                                child: Text(
                                  'SETTINGS',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: titleSize,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 3,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(
                            width: backButtonSize,
                          ),
                        ],
                      ),

                      SizedBox(
                        height: size.height * 0.015,
                      ),

                      Container(
                        height: 2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              const Color(
                                0xFF7B61FF,
                              ).withOpacity(0.9),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        height: size.height * 0.03,
                      ),

                      /// AUDIO
                      SettingsSwitchTile(
                        icon: Icons
                            .music_note_rounded,
                        iconColor: Colors
                            .purpleAccent,
                        title: 'Music',
                        value: state
                            .musicEnabled,
                        onChanged:
                        controller
                            .toggleMusic,
                      ),

                      SettingsSwitchTile(
                        icon: Icons
                            .volume_up_rounded,
                        iconColor:
                        Colors.cyanAccent,
                        title:
                        'Sound Effects',
                        value: state
                            .soundEnabled,
                        onChanged:
                        controller
                            .toggleSound,
                      ),

                      SizedBox(
                        height: size.height * 0.01,
                      ),

                      /// ACTIONS
                      SettingsTile(
                        icon:
                        Icons.privacy_tip,
                        iconColor: Colors
                            .greenAccent,
                        title:
                        'Privacy Policy',
                        onTap:
                        _emptyAction,
                      ),

                      SettingsTile(
                        icon:
                        Icons.star_rate,
                        iconColor:
                        Colors.amber,
                        title:
                        'Rate App',
                        onTap:
                        _emptyAction,
                      ),

                      SettingsTile(
                        icon:
                        Icons.share,
                        iconColor: Colors
                            .lightBlue,
                        title:
                        'Share App',
                        onTap:
                        _emptyAction,
                      ),

                      SettingsTile(
                        icon: Icons
                            .delete_forever_rounded,
                        iconColor:
                        Colors.redAccent,
                        title:
                        'Reset Progress',
                        onTap:
                        _showResetDialog,
                      ),

                      SizedBox(
                        height: size.height * 0.025,
                      ),

                      const SettingsFooter(),

                      SizedBox(
                        height: size.height * 0.025,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}