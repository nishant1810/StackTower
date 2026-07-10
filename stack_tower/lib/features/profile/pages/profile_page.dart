import 'package:flutter/material.dart';

import '../../../core/assets/app_assets.dart';
import '../controllers/profile_controller.dart';
import '../models/player_profile.dart';
import '../widgets/profile_card.dart';
import '../widgets/stats_card.dart';
import '../widgets/achievement_preview.dart';
import '../widgets/profile_section_title.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    const controller = ProfileController();

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppAssets.homeBackground,
              fit: BoxFit.cover,
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        'PROFILE',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                      const Spacer(),
                      const SizedBox(width: 48),
                    ],
                  ),
                ),

                Expanded(
                  child: FutureBuilder<PlayerProfile>(
                    future: controller.loadProfile(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState !=
                          ConnectionState.done) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      if (!snapshot.hasData) {
                        return const Center(
                          child: Text(
                            'Failed to load profile',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        );
                      }

                      final profile = snapshot.data!;

                      return SingleChildScrollView(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            ProfileCard(
                              profile: profile,
                            ),

                            const SizedBox(height: 24),

                            GridView.count(
                              crossAxisCount: 2,
                              shrinkWrap: true,
                              physics:
                              const NeverScrollableScrollPhysics(),
                              crossAxisSpacing: 14,
                              mainAxisSpacing: 14,
                              childAspectRatio: 1.25,
                              children: [
                                StatsCard(
                                  title: 'Best Score',
                                  value: '${profile.bestScore}',
                                  icon: Icons.emoji_events,
                                ),
                                StatsCard(
                                  title: 'Coins',
                                  value: '${profile.totalCoins}',
                                  icon: Icons.monetization_on,
                                ),
                                StatsCard(
                                  title: 'Games',
                                  value: '${profile.gamesPlayed}',
                                  icon: Icons.sports_esports,
                                ),
                                StatsCard(
                                  title: 'Perfects',
                                  value: '${profile.perfectRecord}',
                                  icon: Icons.star,
                                ),
                              ],
                            ),

                            const SizedBox(height: 24),

                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.08),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Column(
                                children: [
                                  const Text(
                                    'Highest Combo',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    '${profile.highestCombo}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 36,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 30),

                            const ProfileSectionTitle(
                              title: 'Achievements',
                            ),

                            const SizedBox(height: 16),

                            SizedBox(
                              height: 110,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: const [
                                  AchievementPreview(
                                    title: 'First Tower',
                                    icon: Icons.looks_one,
                                    unlocked: true,
                                  ),
                                  SizedBox(width: 12),
                                  AchievementPreview(
                                    title: 'Score 100',
                                    icon: Icons.star,
                                    unlocked: true,
                                  ),
                                  SizedBox(width: 12),
                                  AchievementPreview(
                                    title: 'Perfect Stack',
                                    icon: Icons.bolt,
                                    unlocked: false,
                                  ),
                                  SizedBox(width: 12),
                                  AchievementPreview(
                                    title: 'Tower Legend',
                                    icon: Icons.emoji_events,
                                    unlocked: false,
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 30),
                          ],
                        ),
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