import 'package:flutter/material.dart';

import '../../../core/assets/app_assets.dart';
import '../controllers/leaderboard_controller.dart';
import '../widgets/leaderboard_tile.dart';
import '../widgets/top_rank_card.dart';
import '../widgets/user_rank_card.dart';

class LeaderboardPage extends StatefulWidget {
  final int bestScore;

  const LeaderboardPage({
    super.key,
    required this.bestScore,
  });

  @override
  State<LeaderboardPage> createState() =>
      _LeaderboardPageState();
}

class _LeaderboardPageState
    extends State<LeaderboardPage> {
  final controller = LeaderboardController();

  @override
  void initState() {
    super.initState();
    controller.loadLeaderboard(widget.bestScore);
  }

  @override
  Widget build(BuildContext context) {
    final entries = controller.entries;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          /// BACKGROUND
          Image.asset(
            AppAssets.homeBackground,
            fit: BoxFit.cover,
          ),

          /// DARK OVERLAY
          Container(
            color: Colors.black.withOpacity(0.55),
          ),

          SafeArea(
            child: entries.isEmpty
                ? const Center(
              child: CircularProgressIndicator(),
            )
                : Column(
              children: [
                /// HEADER
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                        ),
                      ),
                      const Expanded(
                        child: Text(
                          'LEADERBOARD',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                      const SizedBox(width: 48),
                    ],
                  ),
                ),

                /// USER CARD
                UserRankCard(
                  rank: 4,
                  score: widget.bestScore,
                ),

                const SizedBox(height: 20),

                /// TOP 3
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,
                    children: [
                      TopRankCard(
                        rank: 2,
                        name: entries[1].name,
                        score: entries[1].score,
                      ),
                      Transform.translate(
                        offset: const Offset(0, -20),
                        child: TopRankCard(
                          rank: 1,
                          name: entries[0].name,
                          score: entries[0].score,
                        ),
                      ),
                      TopRankCard(
                        rank: 3,
                        name: entries[2].name,
                        score: entries[2].score,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                /// LIST
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.only(
                      bottom: 24,
                    ),
                    itemCount: entries.length,
                    itemBuilder: (_, index) {
                      return LeaderboardTile(
                        entry: entries[index],
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