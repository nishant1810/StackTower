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

  List<AchievementModel> achievements = [];

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
    final size = MediaQuery.of(context).size;

    final horizontalPadding =
    (size.width * 0.04).clamp(12.0, 20.0);

    final cardPadding =
    (size.width * 0.04).clamp(12.0, 20.0);

    final iconSize =
    (size.width * 0.10).clamp(32.0, 48.0);

    final titleSize =
    (size.width * 0.045).clamp(16.0, 22.0);

    final subtitleSize =
    (size.width * 0.035).clamp(12.0, 16.0);

    final spacing =
    (size.height * 0.015).clamp(8.0, 16.0);

    final unlockedCount = achievements
        .where((e) => e.unlocked)
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
            color: Colors.black.withOpacity(
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
                  EdgeInsets.symmetric(
                    horizontal:
                    horizontalPadding,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(
                      cardPadding,
                    ),
                    decoration:
                    BoxDecoration(
                      color: Colors.white
                          .withOpacity(
                        0.08,
                      ),
                      borderRadius:
                      BorderRadius
                          .circular(
                        20,
                      ),
                      border: Border.all(
                        color: Colors.cyan
                            .withOpacity(
                          0.4,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons
                              .emoji_events,
                          color:
                          Colors.amber,
                          size: iconSize,
                        ),

                        SizedBox(
                          width:
                          horizontalPadding,
                        ),

                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment
                                .start,
                            children: [
                              Text(
                                'Achievement Progress',
                                maxLines: 1,
                                overflow:
                                TextOverflow
                                    .ellipsis,
                                style:
                                TextStyle(
                                  color: Colors
                                      .white,
                                  fontSize:
                                  titleSize,
                                  fontWeight:
                                  FontWeight
                                      .w700,
                                ),
                              ),

                              SizedBox(
                                height:
                                spacing *
                                    0.4,
                              ),

                              Text(
                                '$unlockedCount / ${achievements.length} Unlocked',
                                maxLines: 1,
                                overflow:
                                TextOverflow
                                    .ellipsis,
                                style:
                                TextStyle(
                                  color: Colors
                                      .white70,
                                  fontSize:
                                  subtitleSize,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: spacing,
                ),

                Expanded(
                  child:
                  ListView.builder(
                    padding:
                    EdgeInsets.only(
                      bottom:
                      size.height *
                          0.03,
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