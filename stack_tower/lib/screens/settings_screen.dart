import 'dart:ui';

import 'package:flutter/material.dart';

import '../services/audio_service.dart';
import '../services/settings_service.dart';
import '../services/storage_service.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  State<SettingsScreen> createState() =>
      _SettingsScreenState();
}

class _SettingsScreenState
    extends State<SettingsScreen> {
  bool sound = true;
  bool music = true;
  bool vibration = true;

  @override
  void initState() {
    super.initState();

    sound = SettingsService.soundEnabled;
    music = SettingsService.musicEnabled;
    vibration =
        SettingsService.vibrationEnabled;
  }

  Future<void> _resetBestScore() async {
    await StorageService.resetBestScore();

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "Best Score Reset Successfully",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// BACKGROUND
          Positioned.fill(
            child: Image.asset(
              "assets/images/home_bg.png",
              fit: BoxFit.cover,
            ),
          ),

          /// DARK OVERLAY
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(
                0.50,
              ),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              padding:
              const EdgeInsets.all(20),
              child: Center(
                child: ClipRRect(
                  borderRadius:
                  BorderRadius.circular(
                    32,
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 15,
                      sigmaY: 15,
                    ),
                    child: Container(
                      constraints:
                      const BoxConstraints(
                        maxWidth: 500,
                      ),
                      padding:
                      const EdgeInsets.all(
                        24,
                      ),
                      decoration:
                      BoxDecoration(
                        color:
                        const Color(
                          0xFF081124,
                        ).withOpacity(
                          0.90,
                        ),
                        borderRadius:
                        BorderRadius
                            .circular(
                          32,
                        ),
                        border: Border.all(
                          color:
                          const Color(
                            0xFF4FC3F7,
                          ),
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color:
                            const Color(
                              0xFF4FC3F7,
                            ).withOpacity(
                              0.35,
                            ),
                            blurRadius:
                            30,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize:
                        MainAxisSize.min,
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
                                  Icons
                                      .arrow_back_ios_new_rounded,
                                  color:
                                  Colors
                                      .white,
                                ),
                              ),

                              const Expanded(
                                child: Center(
                                  child: Text(
                                    "SETTINGS",
                                    style:
                                    TextStyle(
                                      color:
                                      Colors
                                          .white,
                                      fontSize:
                                      32,
                                      fontWeight:
                                      FontWeight
                                          .w900,
                                      letterSpacing:
                                      2,
                                      shadows: [
                                        Shadow(
                                          color:
                                          Color(
                                            0xFF60A5FA,
                                          ),
                                          blurRadius:
                                          20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(
                                width: 48,
                              ),
                            ],
                          ),

                          const SizedBox(
                            height: 25,
                          ),

                          _settingTile(
                            icon: Icons
                                .volume_up_rounded,
                            title:
                            "Sound Effects",
                            value: sound,
                            onChanged:
                                (value) async {
                              setState(() {
                                sound =
                                    value;
                              });

                              await SettingsService
                                  .setSound(
                                value,
                              );
                            },
                          ),

                          _settingTile(
                            icon: Icons
                                .music_note_rounded,
                            title: "Music",
                            value: music,
                            onChanged:
                                (value) async {
                              setState(() {
                                music =
                                    value;
                              });

                              await SettingsService
                                  .setMusic(
                                value,
                              );

                              if (value) {
                                await AudioService
                                    .startBackgroundMusic();
                              } else {
                                await AudioService
                                    .stopBackgroundMusic();
                              }
                            },
                          ),

                          _settingTile(
                            icon: Icons
                                .vibration_rounded,
                            title:
                            "Vibration",
                            value:
                            vibration,
                            onChanged:
                                (value) async {
                              setState(() {
                                vibration =
                                    value;
                              });

                              await SettingsService
                                  .setVibration(
                                value,
                              );
                            },
                          ),

                          const SizedBox(
                            height: 12,
                          ),

                          SizedBox(
                            width:
                            double.infinity,
                            height: 60,
                            child:
                            ElevatedButton.icon(
                              onPressed:
                              _resetBestScore,
                              icon:
                              const Icon(
                                Icons
                                    .delete_outline_rounded,
                              ),
                              label:
                              const Text(
                                "RESET BEST SCORE",
                              ),
                              style:
                              ElevatedButton
                                  .styleFrom(
                                backgroundColor:
                                Colors
                                    .redAccent,
                                foregroundColor:
                                Colors
                                    .white,
                                shape:
                                RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(
                                    18,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 24,
                          ),

                          Container(
                            width:
                            double.infinity,
                            padding:
                            const EdgeInsets
                                .all(
                              16,
                            ),
                            decoration:
                            BoxDecoration(
                              color: Colors
                                  .white
                                  .withOpacity(
                                .05,
                              ),
                              borderRadius:
                              BorderRadius
                                  .circular(
                                18,
                              ),
                            ),
                            child:
                            const Column(
                              children: [
                                Text(
                                  "STACK TOWER",
                                  style:
                                  TextStyle(
                                    color:
                                    Colors
                                        .white,
                                    fontWeight:
                                    FontWeight
                                        .bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "Version 1.0",
                                  style:
                                  TextStyle(
                                    color: Colors
                                        .white70,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(
                            height: 24,
                          ),

                          Material(
                            color: Colors
                                .transparent,
                            child: InkWell(
                              borderRadius:
                              BorderRadius
                                  .circular(
                                20,
                              ),
                              onTap: () {
                                Navigator.pop(
                                  context,
                                );
                              },
                              child: Container(
                                width: double
                                    .infinity,
                                height: 65,
                                decoration:
                                BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(
                                    20,
                                  ),
                                  gradient:
                                  const LinearGradient(
                                    colors: [
                                      Color(
                                        0xFF9333EA,
                                      ),
                                      Color(
                                        0xFFEC4899,
                                      ),
                                    ],
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(
                                        0xFF9333EA,
                                      ).withOpacity(
                                        .4,
                                      ),
                                      blurRadius:
                                      25,
                                    ),
                                  ],
                                ),
                                child:
                                const Center(
                                  child: Text(
                                    "CLOSE",
                                    style:
                                    TextStyle(
                                      color: Colors
                                          .white,
                                      fontSize:
                                      18,
                                      fontWeight:
                                      FontWeight
                                          .bold,
                                      letterSpacing:
                                      1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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

  Widget _settingTile({
    required IconData icon,
    required String title,
    required bool value,
    required ValueChanged<bool>
    onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 14,
      ),
      padding:
      const EdgeInsets.symmetric(
        horizontal: 18,
      ),
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(
          .05,
        ),
        borderRadius:
        BorderRadius.circular(
          18,
        ),
        border: Border.all(
          color: Colors.white12,
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.amber,
            size: 26,
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight:
                FontWeight.w600,
              ),
            ),
          ),

          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.white,
            activeTrackColor:
            const Color(
              0xFF06B6D4,
            ),
          ),
        ],
      ),
    );
  }
}