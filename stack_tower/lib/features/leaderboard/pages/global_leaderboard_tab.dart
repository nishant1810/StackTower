import 'package:flutter/material.dart';

class GlobalLeaderboardTab extends StatelessWidget {
  const GlobalLeaderboardTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.08),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.white24,
            ),
          ),
          child: const Column(
            children: [
              Icon(
                Icons.public,
                color: Colors.white,
                size: 60,
              ),
              SizedBox(height: 16),
              Text(
                'Global Leaderboard',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Compete with players around the world.\nFirebase integration will power real-time rankings.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        _ComingSoonRow(
          icon: Icons.emoji_events,
          title: 'Global Rankings',
          subtitle: 'Top players worldwide',
        ),

        _ComingSoonRow(
          icon: Icons.person,
          title: 'Your Global Rank',
          subtitle: 'See where you stand',
        ),

        _ComingSoonRow(
          icon: Icons.update,
          title: 'Live Updates',
          subtitle: 'Automatic leaderboard refresh',
        ),

        _ComingSoonRow(
          icon: Icons.groups,
          title: 'Worldwide Competition',
          subtitle: 'Real player scores',
        ),
      ],
    );
  }
}

class _ComingSoonRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _ComingSoonRow({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white24,
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight:
                    FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
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