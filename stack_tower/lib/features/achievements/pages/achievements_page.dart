import 'package:flutter/material.dart';

import '../../../core/assets/app_assets.dart';

import '../controller/achievements_controller.dart';
import '../models/achievement_model.dart';
import '../widgets/achievement_card.dart';
import '../widgets/achievement_header.dart';

class AchievementsPage extends StatefulWidget {
  const AchievementsPage({
    super.key,
  });

  @override
  State<AchievementsPage> createState() =>
      _AchievementsPageState();
}

class _AchievementsPageState
    extends State<AchievementsPage> {
  final controller =
  AchievementsController();

  List<AchievementModel> achievements =
  [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadAchievements();
  }

  Future<void> _loadAchievements() async {
    achievements =
    await controller.loadAchievements();

    if (!mounted) return;

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final unlockedCount =
        achievements
            .where(
              (e) => e.unlocked,
        )
            .length;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            AppAssets.achievementBackground,
            fit: BoxFit.cover,
          ),

          Container(
            color:
            Colors.black.withOpacity(
              0.55,
            ),
          ),

          SafeArea(
            child: isLoading
                ? const Center(
              child:
              CircularProgressIndicator(),
            )
                : Column(
              children: [
                const AchievementHeader(),

                Padding(
                  padding:
                  const EdgeInsets
                      .symmetric(
                    horizontal: 16,
                  ),
                  child: Container(
                    padding:
                    const EdgeInsets
                        .all(16),
                    decoration:
                    BoxDecoration(
                      color: Colors
                          .white
                          .withOpacity(
                        0.08,
                      ),
                      borderRadius:
                      BorderRadius
                          .circular(
                        20,
                      ),
                      border:
                      Border.all(
                        color: Colors
                            .cyan
                            .withOpacity(
                          0.4,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons
                              .emoji_events,
                          color:
                          Colors
                              .amber,
                          size: 40,
                        ),

                        const SizedBox(
                          width: 16,
                        ),

                        Expanded(
                          child:
                          Column(
                            crossAxisAlignment:
                            CrossAxisAlignment
                                .start,
                            children: [
                              const Text(
                                'Achievement Progress',
                                style:
                                TextStyle(
                                  color:
                                  Colors.white,
                                  fontSize:
                                  18,
                                  fontWeight:
                                  FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height:
                                4,
                              ),
                              Text(
                                '$unlockedCount / ${achievements.length} Unlocked',
                                style:
                                const TextStyle(
                                  color:
                                  Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(
                  height: 12,
                ),

                Expanded(
                  child:
                  ListView.builder(
                    padding:
                    const EdgeInsets
                        .only(
                      bottom: 24,
                    ),
                    itemCount:
                    achievements
                        .length,
                    itemBuilder:
                        (
                        context,
                        index,
                        ) {
                      return AchievementCard(
                        achievement:
                        achievements[
                        index],
                      );
                    },
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