import 'package:flutter/material.dart';

import '../../../services/storage_service.dart';
import '../services/achievement_service.dart';
import '../widgets/achievement_card.dart';
import '../widgets/achievement_progress.dart';

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
  final service =
      AchievementService.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
      const Color(0xff08121F),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Achievements",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: AnimatedBuilder(
        animation: service,
        builder: (_, __) {
          final achievements =
              service.achievements;

          return Column(
            children: [

              //----------------------------------
              // Dashboard
              //----------------------------------

              AchievementProgress(
                achievements:
                achievements,
              ),

              //----------------------------------
              // List
              //----------------------------------

              Expanded(
                child: ListView.builder(
                  padding:
                  const EdgeInsets.only(
                    bottom: 30,
                  ),

                  itemCount:
                  achievements.length,

                  itemBuilder:
                      (_, index) {
                    final achievement =
                    achievements[
                    index];

                    return AchievementCard(
                      achievement:
                      achievement,

                      onClaim: () =>
                          _claimReward(
                            achievement.id,
                          ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  //----------------------------------------------------------

  Future<void> _claimReward(
      String id,
      ) async {
    final reward =
    service.claimReward(id);

    if (reward == 0) return;

    final coins =
    await StorageService.getCoins();

    await StorageService.setCoins(
      coins + reward,
    );

    if (!mounted) return;

    ScaffoldMessenger.of(context)
        .showSnackBar(
      SnackBar(
        behavior:
        SnackBarBehavior.floating,
        backgroundColor:
        Colors.green,
        content: Text(
          "+$reward Coins Added!",
        ),
      ),
    );
  }
}