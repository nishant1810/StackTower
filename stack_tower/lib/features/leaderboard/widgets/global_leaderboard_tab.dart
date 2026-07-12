import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/leaderboard_entry.dart';
import 'leaderboard_tile.dart';

class GlobalLeaderboardTab extends StatelessWidget {
  const GlobalLeaderboardTab({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;

    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('leaderboard')
          .orderBy('bestScore', descending: true)
          .limit(100)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState ==
            ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasError) {
          return Center(
            child: Text(
              'Error: ${snapshot.error}',
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          );
        }

        if (!snapshot.hasData ||
            snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text(
              'No leaderboard data yet',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          );
        }

        final docs = snapshot.data!.docs;

        final players = <LeaderboardEntry>[];

        int currentUserRank = -1;
        int currentUserScore = 0;

        for (int i = 0; i < docs.length; i++) {
          final data = docs[i].data();

          final isCurrentUser =
              currentUser != null &&
                  docs[i].id == currentUser.uid;

          if (isCurrentUser) {
            currentUserRank = i + 1;
            currentUserScore =
                data['bestScore'] ?? 0;
          }

          players.add(
            LeaderboardEntry(
              rank: i + 1,
              name: data['name'] ?? 'Player',
              photoUrl: data['photoUrl'],
              score: data['bestScore'] ?? 0,
              isUser: isCurrentUser,
            ),
          );
        }

        return Column(
          children: [
            if (currentUser != null &&
                currentUserRank != -1)
              Container(
                margin: const EdgeInsets.fromLTRB(
                  16,
                  12,
                  16,
                  8,
                ),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF8B5CF6),
                      Color(0xFF6D28D9),
                    ],
                  ),
                  borderRadius:
                  BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.workspace_premium,
                      color: Colors.amber,
                      size: 32,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'YOUR GLOBAL RANK',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                              fontWeight:
                              FontWeight.w600,
                            ),
                          ),
                          Text(
                            '#$currentUserRank',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight:
                              FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'BEST SCORE',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          currentUserScore
                              .toString(),
                          style: const TextStyle(
                            color: Colors.amber,
                            fontSize: 24,
                            fontWeight:
                            FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(
                  bottom: 20,
                ),
                itemCount: players.length,
                itemBuilder: (context, index) {
                  return LeaderboardTile(
                    entry: players[index],
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}