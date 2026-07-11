import 'package:flutter/material.dart';

class GlobalLeaderboardTab extends StatelessWidget {
  const GlobalLeaderboardTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ListView(
      padding: EdgeInsets.all(
        size.width * 0.04,
      ),
      children: [
        Container(
          padding: EdgeInsets.all(
            size.width * 0.05,
          ),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.08),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.white24,
            ),
          ),
          child: Column(
            children: [
              Icon(
                Icons.public,
                color: Colors.white,
                size: (size.width * 0.15)
                    .clamp(48.0, 72.0),
              ),

              SizedBox(
                height: size.height * 0.02,
              ),

              Text(
                'Global Leaderboard',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize:
                  (size.width * 0.055)
                      .clamp(18.0, 26.0),
                  fontWeight: FontWeight.w700,
                ),
              ),

              SizedBox(
                height: size.height * 0.01,
              ),

              Text(
                'Compete with players around the world.\nFirebase integration will power real-time rankings.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize:
                  (size.width * 0.035)
                      .clamp(12.0, 15.0),
                ),
              ),
            ],
          ),
        ),

        SizedBox(
          height: size.height * 0.03,
        ),

        const _ComingSoonRow(
          icon: Icons.emoji_events,
          title: 'Global Rankings',
          subtitle: 'Top players worldwide',
        ),

        const _ComingSoonRow(
          icon: Icons.person,
          title: 'Your Global Rank',
          subtitle: 'See where you stand',
        ),

        const _ComingSoonRow(
          icon: Icons.update,
          title: 'Live Updates',
          subtitle: 'Automatic leaderboard refresh',
        ),

        const _ComingSoonRow(
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
    final size = MediaQuery.of(context).size;

    final iconSize =
    (size.width * 0.065).clamp(22.0, 30.0);

    final titleSize =
    (size.width * 0.042).clamp(14.0, 18.0);

    final subtitleSize =
    (size.width * 0.034).clamp(11.0, 14.0);

    return Container(
      margin: EdgeInsets.only(
        bottom: size.height * 0.015,
      ),
      padding: EdgeInsets.all(
        size.width * 0.04,
      ),
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
            size: iconSize,
          ),

          SizedBox(
            width:
            (size.width * 0.04)
                .clamp(12.0, 18.0),
          ),

          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow:
                  TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight:
                    FontWeight.w600,
                    fontSize: titleSize,
                  ),
                ),

                SizedBox(
                  height:
                  size.height * 0.005,
                ),

                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: subtitleSize,
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