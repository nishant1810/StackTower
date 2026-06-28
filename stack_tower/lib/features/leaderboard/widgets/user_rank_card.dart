import 'package:flutter/material.dart';

class UserRankCard extends StatelessWidget {
  final int rank;
  final int score;

  const UserRankCard({
    super.key,
    required this.rank,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFF4FC3FF)
            .withOpacity(.15),
        border: Border.all(
          color: const Color(0xFF4FC3FF),
        ),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 24,
            child: Icon(Icons.person),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              'YOU',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Column(
            crossAxisAlignment:
            CrossAxisAlignment.end,
            children: [
              Text(
                '#$rank',
                style: const TextStyle(
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '$score',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}