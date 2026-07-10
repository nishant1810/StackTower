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
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.55),
              ),
            ),

            SafeArea(
              child: Column(
                children: [
                  // Header
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(16),
                            gradient:
                            const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFF241544),
                                Color(0xFF0C1024),
                              ],
                            ),
                            border: Border.all(
                              color: const Color(
                                0xFF8B5CF6,
                              ),
                              width: 1.5,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(
                                  0x668B5CF6,
                                ),
                                blurRadius: 12,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons
                                  .arrow_back_ios_new_rounded,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ),

                        const SizedBox(width: 12),

                        const Expanded(
                          child: Text(
                            'LEADERBOARD',
                            textAlign:
                            TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight:
                              FontWeight.w900,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),

                        const SizedBox(
                          width: 62,
                        ),
                      ],
                    ),
                  ),

                  // Tabs
                  Container(
                    margin:
                    const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius:
                      BorderRadius.circular(
                        16,
                      ),
                      border: Border.all(
                        color: const Color(
                          0x338B5CF6,
                        ),
                      ),
                    ),
                    child: const TabBar(
                      indicatorSize:
                      TabBarIndicatorSize.tab,
                      dividerColor:
                      Colors.transparent,
                      labelColor:
                      Colors.white,
                      unselectedLabelColor:
                      Colors.white60,
                      labelStyle: TextStyle(
                        fontWeight:
                        FontWeight.w800,
                        letterSpacing: 1,
                      ),
                      indicator: BoxDecoration(
                        borderRadius:
                        BorderRadius.all(
                          Radius.circular(16),
                        ),
                        gradient:
                        LinearGradient(
                          colors: [
                            Color(
                              0xFF8B5CF6,
                            ),
                            Color(
                              0xFF6D28D9,
                            ),
                          ],
                        ),
                      ),
                      tabs: [
                        Tab(
                          text: 'GLOBAL',
                        ),
                        Tab(
                          text:
                          'PERSONAL BEST',
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

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