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
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal:
        (size.width * 0.035).clamp(10.0, 18.0),
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

          SizedBox(
            width:
            (size.width * 0.03).clamp(8.0, 14.0),
          ),

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
    final size = MediaQuery.of(context).size;

    final cardHeight =
    (size.height * 0.22).clamp(150.0, 210.0);

    final imageSize =
    (size.width * 0.20).clamp(55.0, 90.0);

    final iconSize =
    (size.width * 0.09).clamp(24.0, 42.0);

    final titleSize =
    (size.width * 0.035).clamp(11.0, 16.0);

    final subtitleSize =
    (size.width * 0.03).clamp(10.0, 14.0);

    final buttonHeight =
    (size.height * 0.05).clamp(38.0, 48.0);

    return Container(
      height: cardHeight,
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
                  width: imageSize,
                  height: imageSize,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: accent
                            .withOpacity(.45),
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
                  width: imageSize * 0.85,
                  height: imageSize * 0.85,
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
                    size: iconSize,
                  ),
                ),
              ),
            ),

            FittedBox(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: titleSize,
                  fontWeight: FontWeight.w900,
                  letterSpacing: .8,
                ),
              ),
            ),

            const SizedBox(height: 4),

            FittedBox(
              child: Text(
                subtitle,
                style: TextStyle(
                  color: accent,
                  fontSize: subtitleSize,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),

            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              height: buttonHeight,
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
                child: FittedBox(
                  child: Text(
                    buttonText,
                    style: TextStyle(
                      fontSize:
                      subtitleSize,
                      fontWeight:
                      FontWeight.w900,
                      letterSpacing: .8,
                    ),
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