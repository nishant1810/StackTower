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
              color: Colors.black.withValues(
                alpha: 0.50,
              ),
            ),
          ),

          SafeArea(
            child:
            ValueListenableBuilder<
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
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(
                                context,
                              );
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color:
                              Colors.white,
                            ),
                          ),

                          const SizedBox(
                            width: 8,
                          ),

                          const Text(
                            'SETTINGS',
                            style: TextStyle(
                              color:
                              Colors.white,
                              fontSize: 34,
                              fontWeight:
                              FontWeight
                                  .w800,
                              letterSpacing: 2,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 8,
                      ),

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

                      SettingsSwitchTile(
                        icon: Icons
                            .vibration_rounded,
                        iconColor: Colors
                            .orangeAccent,
                        title:
                        'Vibration',
                        value: state
                            .vibrationEnabled,
                        onChanged:
                        controller
                            .toggleVibration,
                      ),

                      const SizedBox(
                        height: 4,
                      ),

                      SettingsTile(
                        icon:
                        Icons.privacy_tip,
                        iconColor: Colors
                            .greenAccent,
                        title:
                        'Privacy Policy',
                        onTap: () {},
                      ),

                      SettingsTile(
                        icon:
                        Icons.star_rate,
                        iconColor:
                        Colors.amber,
                        title: 'Rate App',
                        onTap: () {},
                      ),

                      SettingsTile(
                        icon: Icons.share,
                        iconColor: Colors
                            .lightBlue,
                        title:
                        'Share App',
                        onTap: () {},
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
                        height: 5,
                      ),

                      const SettingsFooter(),

                      const SizedBox(
                        height: 5,
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