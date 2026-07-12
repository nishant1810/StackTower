import 'package:flutter/material.dart';

import '../models/leaderboard_entry.dart';

class LeaderboardTile extends StatelessWidget {
  final LeaderboardEntry entry;

  const LeaderboardTile({
    super.key,
    required this.entry,
  });

  Color _rankColor() {
    switch (entry.rank) {
      case 1:
        return const Color(0xFFFFD700);
      case 2:
        return const Color(0xFFC0C0C0);
      case 3:
        return const Color(0xFFCD7F32);
      default:
        return Colors.white;
    }
  }

  IconData? _rankIcon() {
    switch (entry.rank) {
      case 1:
      case 2:
      case 3:
        return Icons.workspace_premium_rounded;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isTopThree = entry.rank <= 3;

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 6,
      ),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: entry.isUser
            ? const Color(0xFF4FC3FF).withOpacity(.18)
            : Colors.black.withOpacity(.28),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: entry.isUser
              ? const Color(0xFF4FC3FF)
              : isTopThree
              ? _rankColor().withOpacity(.6)
              : Colors.white24,
          width: entry.isUser ? 2 : 1,
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 48,
            child: Row(
              children: [
                if (_rankIcon() != null)
                  Icon(
                    _rankIcon(),
                    color: _rankColor(),
                    size: 18,
                  ),
                if (_rankIcon() != null)
                  const SizedBox(width: 4),
                Text(
                  '#${entry.rank}',
                  style: TextStyle(
                    color: _rankColor(),
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          CircleAvatar(
            radius: 22,
            backgroundColor: const Color(0xFF8B5CF6),
            backgroundImage:
            entry.photoUrl != null &&
                entry.photoUrl!.isNotEmpty
                ? NetworkImage(entry.photoUrl!)
                : null,
            child:
            entry.photoUrl == null ||
                entry.photoUrl!.isEmpty
                ? const Icon(
              Icons.person,
              color: Colors.white,
            )
                : null,
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(
                  entry.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: entry.isUser
                        ? const Color(0xFF4FC3FF)
                        : Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
                if (entry.isUser)
                  const Text(
                    'YOU',
                    style: TextStyle(
                      color: Color(0xFF4FC3FF),
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
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
                'BEST',
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 10,
                ),
              ),
              Text(
                entry.score.toString(),
                style: const TextStyle(
                  color: Color(0xFFFFD54F),
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}