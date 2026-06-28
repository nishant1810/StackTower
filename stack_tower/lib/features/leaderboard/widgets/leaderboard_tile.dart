import 'package:flutter/material.dart';

import '../models/leaderboard_entry.dart';

class LeaderboardTile extends StatelessWidget {
  final LeaderboardEntry entry;

  const LeaderboardTile({
    super.key,
    required this.entry,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 6,
      ),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: entry.isUser
            ? const Color(0xFF4FC3FF).withOpacity(.15)
            : Colors.black.withOpacity(.2),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: entry.isUser
              ? const Color(0xFF4FC3FF)
              : Colors.white24,
        ),
      ),
      child: Row(
        children: [
          Text(
            '#${entry.rank}',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 16),
          const CircleAvatar(
            radius: 18,
            child: Icon(Icons.person, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              entry.name,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Text(
            '${entry.score}',
            style: const TextStyle(
              color: Colors.amber,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}