import 'package:flutter/material.dart';

class RewardCards extends StatelessWidget {
  final VoidCallback onClaimGift;
  final VoidCallback onWatchAd;

  const RewardCards({
    super.key,
    required this.onClaimGift,
    required this.onWatchAd,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Row(
        children: [
          Expanded(
            child: _RewardCard(
              title: 'DAILY GIFT',
              subtitle: 'FREE REWARDS',
              icon: Icons.card_giftcard,
              buttonText: 'CLAIM',
              accent: const Color(0xFFFFB300),
              onTap: onClaimGift,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: _RewardCard(
              title: 'WATCH AD',
              subtitle: '+50 COINS',
              icon: Icons.play_circle_fill,
              buttonText: 'WATCH',
              accent: const Color(0xFF29B6F6),
              onTap: onWatchAd,
            ),
          ),
        ],
      ),
    );
  }
}

class _RewardCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttonText;
  final IconData icon;
  final Color accent;
  final VoidCallback onTap;

  const _RewardCard({
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.icon,
    required this.accent,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black.withOpacity(0.35),
        border: Border.all(
          color: accent.withOpacity(0.6),
        ),
        boxShadow: [
          BoxShadow(
            color: accent.withOpacity(0.2),
            blurRadius: 18,
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: accent,
            size: 34,
          ),

          const Spacer(),

          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: accent,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),

          const SizedBox(height: 10),

          SizedBox(
            width: double.infinity,
            height: 34,
            child: ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: accent,
                shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(12),
                ),
              ),
              child: Text(
                buttonText,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}