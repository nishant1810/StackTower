import 'package:flutter/material.dart';

import '../models/player_profile.dart';

class ProfileCard extends StatelessWidget {
  final PlayerProfile profile;

  const ProfileCard({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.blue.withOpacity(0.35),
            Colors.purple.withOpacity(0.35),
          ],
        ),
        border: Border.all(
          color: Colors.white.withOpacity(0.2),
        ),
      ),
      child: Column(
        children: [
          /// Avatar
          CircleAvatar(
            radius: 42,
            backgroundColor: Colors.white24,
            backgroundImage:
            profile.avatar.isNotEmpty
                ? NetworkImage(profile.avatar)
                : null,
            child: profile.avatar.isEmpty
                ? const Icon(
              Icons.person,
              size: 42,
              color: Colors.white,
            )
                : null,
          ),

          const SizedBox(height: 16),

          /// Name
          Text(
            profile.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          /// Level Badge
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.12),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              'LEVEL ${profile.level}',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
              ),
            ),
          ),

          const SizedBox(height: 24),

          /// Stats
          Row(
            children: [
              Expanded(
                child: _StatTile(
                  icon: Icons.emoji_events_rounded,
                  label: 'BEST',
                  value: '${profile.bestScore}',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _StatTile(
                  icon: Icons.monetization_on_rounded,
                  label: 'COINS',
                  value: '${profile.totalCoins}',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _StatTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.amber,
            size: 24,
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}