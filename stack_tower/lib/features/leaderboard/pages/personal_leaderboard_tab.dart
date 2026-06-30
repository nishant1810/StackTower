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

  Widget _buildRankIcon(int rank) {
    switch (rank) {
      case 1:
        return const Text(
          '🥇',
          style: TextStyle(fontSize: 24),
        );

      case 2:
        return const Text(
          '🥈',
          style: TextStyle(fontSize: 24),
        );

      case 3:
        return const Text(
          '🥉',
          style: TextStyle(fontSize: 24),
        );

      default:
        return CircleAvatar(
          radius: 16,
          backgroundColor: Colors.white12,
          child: Text(
            '$rank',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (scores.isEmpty) {
      return const Center(
        child: Text(
          'Play a game to create your leaderboard',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _loadScores,
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: scores.length,
        itemBuilder: (_, index) {
          final rank = index + 1;

          return Container(
            margin:
            const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
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
                _buildRankIcon(rank),

                const SizedBox(width: 16),

                Expanded(
                  child: Text(
                    'Run #$rank',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight:
                      FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),

                Text(
                  '${scores[index]}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight:
                    FontWeight.bold,
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