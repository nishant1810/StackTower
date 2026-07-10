import 'package:flutter/material.dart';

import '../../../core/assets/app_assets.dart';

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
        horizontal: 14,
      ),
      child: Row(
        children: [
          Expanded(
            child: _RewardCard(
              title: 'DAILY GIFT',
              subtitle: '+500 COINS',
              buttonText: 'CLAIM',
              accent: const Color(0xFFFFC107),
              onTap: onClaimGift,
              isGift: true,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: _RewardCard(
              title: 'WATCH AD',
              subtitle: '+250 COINS',
              buttonText: 'WATCH',
              accent: const Color(0xFF42CFFF),
              onTap: onWatchAd,
              isGift: false,
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
  final Color accent;
  final VoidCallback onTap;
  final bool isGift;

  const _RewardCard({
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.accent,
    required this.onTap,
    required this.isGift,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF25174A),
            Color(0xFF0A1024),
          ],
        ),
        border: Border.all(
          color: accent.withOpacity(.8),
          width: 1.8,
        ),
        boxShadow: [
          BoxShadow(
            color: accent.withOpacity(.25),
            blurRadius: 20,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: isGift
                    ? Container(
                  width: 85,
                  height: 85,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: accent.withOpacity(.45),
                        blurRadius: 24,
                      ),
                    ],
                  ),
                  child: Image.asset(
                    AppAssets.rewardChest,
                    fit: BoxFit.contain,
                  ),
                )
                    : Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        accent.withOpacity(.35),
                        accent.withOpacity(.08),
                      ],
                    ),
                    border: Border.all(
                      color: accent,
                      width: 2,
                    ),
                  ),
                  child: Icon(
                    Icons.smart_display_rounded,
                    color: accent,
                    size: 38,
                  ),
                ),
              ),
            ),

            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w900,
                letterSpacing: .8,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              subtitle,
              style: TextStyle(
                color: accent,
                fontSize: 13,
                fontWeight: FontWeight.w900,
              ),
            ),

            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              height: 42,
              child: ElevatedButton(
                onPressed: onTap,
                style: ElevatedButton.styleFrom(
                  backgroundColor: accent,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(14),
                  ),
                ),
                child: Text(
                  buttonText,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w900,
                    letterSpacing: .8,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}