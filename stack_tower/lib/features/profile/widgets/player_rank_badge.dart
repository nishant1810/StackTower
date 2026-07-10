import 'package:flutter/material.dart';

class PlayerRankBadge extends StatelessWidget {
  final int level;

  const PlayerRankBadge({
    super.key,
    required this.level,
  });

  String get rank {
    if (level >= 50) return 'LEGEND';
    if (level >= 40) return 'MASTER';
    if (level >= 30) return 'DIAMOND';
    if (level >= 20) return 'PLATINUM';
    if (level >= 10) return 'GOLD';
    return 'ROOKIE';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.amber.withOpacity(.15),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.amber,
        ),
      ),
      child: Text(
        rank,
        style: const TextStyle(
          color: Colors.amber,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}