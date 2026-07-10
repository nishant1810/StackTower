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
                  padding:
                  const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  child: Column(
                    children: [
                      /// HEADER
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(
                                context,
                              );
                            },
                            child: Container(
                              width: 58,
                              height: 58,
                              decoration:
                              BoxDecoration(
                                borderRadius:
                                BorderRadius
                                    .circular(
                                  18,
                                ),
                                gradient:
                                const LinearGradient(
                                  begin:
                                  Alignment
                                      .topLeft,
                                  end: Alignment
                                      .bottomRight,
                                  colors: [
                                    Color(
                                      0xFF1B2A7A,
                                    ),
                                    Color(
                                      0xFF0B1033,
                                    ),
                                  ],
                                ),
                                border:
                                Border.all(
                                  color:
                                  const Color(
                                    0xFF7B61FF,
                                  ).withOpacity(
                                    0.60,
                                  ),
                                  width: 1.5,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                    const Color(
                                      0xFF6A5CFF,
                                    ).withOpacity(
                                      0.35,
                                    ),
                                    blurRadius:
                                    22,
                                    spreadRadius:
                                    2,
                                  ),
                                ],
                              ),
                              child:
                              const Center(
                                child: Icon(
                                  Icons
                                      .arrow_back_rounded,
                                  color: Colors
                                      .white,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(
                            width: 18,
                          ),

                          Expanded(
                            child:
                            ShaderMask(
                              shaderCallback:
                                  (
                                  bounds,
                                  ) {
                                return const LinearGradient(
                                  colors: [
                                    Colors
                                        .white,
                                    Color(
                                      0xFFB7C7FF,
                                    ),
                                  ],
                                ).createShader(
                                  bounds,
                                );
                              },
                              child:
                              const Text(
                                'SETTINGS',
                                style:
                                TextStyle(
                                  color: Colors
                                      .white,
                                  fontSize:
                                  34,
                                  fontWeight:
                                  FontWeight
                                      .w900,
                                  letterSpacing:
                                  3,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 12,
                      ),

                      Container(
                        height: 2,
                        decoration:
                        BoxDecoration(
                          borderRadius:
                          BorderRadius
                              .circular(
                            10,
                          ),
                          gradient:
                          LinearGradient(
                            colors: [
                              Colors
                                  .transparent,
                              const Color(
                                0xFF7B61FF,
                              ).withOpacity(
                                0.9,
                              ),
                              Colors
                                  .transparent,
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 24,
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

                      const SizedBox(
                        height: 8,
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

                      const SizedBox(
                        height: 20,
                      ),

                      const SettingsFooter(),

                      const SizedBox(
                        height: 20,
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