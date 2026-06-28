import 'package:flutter/material.dart';

class TopRankCard extends StatelessWidget {
  final String name;
  final int score;
  final int rank;

  const TopRankCard({
    super.key,
    required this.name,
    required this.score,
    required this.rank,
  });

  Color get borderColor {
    switch (rank) {
      case 1:
        return const Color(0xFFFFD700);
      case 2:
        return const Color(0xFFC0C0C0);
      default:
        return const Color(0xFFCD7F32);
    }
  }

  IconData get icon {
    switch (rank) {
      case 1:
        return Icons.emoji_events;
      case 2:
        return Icons.workspace_premium;
      default:
        return Icons.military_tech;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.35),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: borderColor.withOpacity(.35),
            blurRadius: 20,
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: borderColor,
            size: 30,
          ),
          const SizedBox(height: 8),
          Text(
            "#$rank",
            style: TextStyle(
              color: borderColor,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 8),
          const CircleAvatar(
            radius: 24,
            child: Icon(Icons.person),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            "$score",
            style: TextStyle(
              color: borderColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}