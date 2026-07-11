import 'package:flutter/material.dart';

import '../../../core/assets/app_assets.dart';
import '../widgets/global_leaderboard_tab.dart';
import '../widgets/personal_leaderboard_tab.dart';

class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final backButtonSize =
    (size.width * 0.13).clamp(46.0, 60.0);

    final titleSize =
    (size.width * 0.065).clamp(22.0, 32.0);

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
                  // HEADER
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.04,
                      vertical: size.height * 0.01,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: backButtonSize,
                          height: backButtonSize,
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(16),
                            gradient:
                            const LinearGradient(
                              begin: Alignment.topLeft,
                              end:
                              Alignment.bottomRight,
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
                              Navigator.pop(
                                context,
                              );
                            },
                            icon: Icon(
                              Icons
                                  .arrow_back_ios_new_rounded,
                              color: Colors.white,
                              size:
                              (backButtonSize *
                                  0.36)
                                  .clamp(
                                16.0,
                                22.0,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          width:
                          size.width * 0.03,
                        ),

                        Expanded(
                          child: Text(
                            'LEADERBOARD',
                            textAlign:
                            TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: titleSize,
                              fontWeight:
                              FontWeight.w900,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),

                        SizedBox(
                          width:
                          backButtonSize +
                              (size.width *
                                  0.03),
                        ),
                      ],
                    ),
                  ),

                  // TAB BAR
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal:
                      size.width * 0.04,
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
                    child: TabBar(
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
                        fontSize:
                        (size.width * 0.035)
                            .clamp(
                          12.0,
                          16.0,
                        ),
                      ),
                      indicator:
                      const BoxDecoration(
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
                      tabs: const [
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

                  SizedBox(
                    height:
                    size.height * 0.02,
                  ),

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