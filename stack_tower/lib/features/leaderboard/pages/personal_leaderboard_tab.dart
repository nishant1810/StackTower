import 'package:flutter/material.dart';

import '../../../core/services/storage/storage_service.dart';

class PersonalLeaderboardTab extends StatefulWidget {
  const PersonalLeaderboardTab({
    super.key,
  });

  @override
  State<PersonalLeaderboardTab> createState() =>
      _PersonalLeaderboardTabState();
}

class _PersonalLeaderboardTabState
    extends State<PersonalLeaderboardTab> {
  List<int> scores = [];

  bool loading = true;

  @override
  void initState() {
    super.initState();
    _loadScores();
  }

  Future<void> _loadScores() async {
    final loadedScores =
    await StorageService.getTopScores();

    if (!mounted) return;

    setState(() {
      scores = loadedScores;
      loading = false;
    });
  }

  Widget _buildRankIcon(
      BuildContext context,
      int rank,
      ) {
    final size = MediaQuery.of(context).size;

    final emojiSize =
    (size.width * 0.06).clamp(20.0, 28.0);

    final avatarRadius =
    (size.width * 0.04).clamp(14.0, 18.0);

    switch (rank) {
      case 1:
        return Text(
          '🥇',
          style: TextStyle(
            fontSize: emojiSize,
          ),
        );

      case 2:
        return Text(
          '🥈',
          style: TextStyle(
            fontSize: emojiSize,
          ),
        );

      case 3:
        return Text(
          '🥉',
          style: TextStyle(
            fontSize: emojiSize,
          ),
        );

      default:
        return CircleAvatar(
          radius: avatarRadius,
          backgroundColor: Colors.white12,
          child: FittedBox(
            child: Text(
              '$rank',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (scores.isEmpty) {
      return Center(
        child: Text(
          'Play a game to create your leaderboard',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize:
            (size.width * 0.04)
                .clamp(14.0, 18.0),
          ),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _loadScores,
      child: ListView.builder(
        padding: EdgeInsets.all(
          size.width * 0.04,
        ),
        itemCount: scores.length,
        itemBuilder: (_, index) {
          final rank = index + 1;

          return Container(
            margin: EdgeInsets.only(
              bottom: size.height * 0.015,
            ),
            padding: EdgeInsets.symmetric(
              horizontal:
              size.width * 0.04,
              vertical:
              size.height * 0.018,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(
                0.08,
              ),
              borderRadius:
              BorderRadius.circular(16),
              border: Border.all(
                color: Colors.white24,
              ),
            ),
            child: Row(
              children: [
                _buildRankIcon(
                  context,
                  rank,
                ),

                SizedBox(
                  width:
                  size.width * 0.04,
                ),

                Expanded(
                  child: Text(
                    'Run #$rank',
                    maxLines: 1,
                    overflow:
                    TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight:
                      FontWeight.w600,
                      fontSize:
                      (size.width * 0.04)
                          .clamp(
                        14.0,
                        18.0,
                      ),
                    ),
                  ),
                ),

                FittedBox(
                  child: Text(
                    '${scores[index]}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize:
                      (size.width * 0.05)
                          .clamp(
                        16.0,
                        22.0,
                      ),
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}