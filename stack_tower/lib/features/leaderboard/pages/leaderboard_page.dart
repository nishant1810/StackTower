import 'package:flutter/material.dart';

import '../../../core/assets/app_assets.dart';
import '../widgets/global_leaderboard_tab.dart';
import '../widgets/personal_leaderboard_tab.dart';

class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              AppAssets.homeBackground,
              fit: BoxFit.cover,
            ),

            Container(
              color: Colors.black54,
            ),

            SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 8,
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(width: 8),

                        const Text(
                          'LEADERBOARD',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const TabBar(
                      indicatorSize:
                      TabBarIndicatorSize.tab,
                      dividerColor:
                      Colors.transparent,
                      tabs: [
                        Tab(
                          text: 'GLOBAL',
                        ),
                        Tab(
                          text: 'PERSONAL BEST',
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  const Expanded(
                    child: TabBarView(
                      children: [
                        GlobalLeaderboardTab(),
                        PersonalLeaderboardTab(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}