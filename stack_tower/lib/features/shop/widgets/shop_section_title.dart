import 'package:flutter/material.dart';

class ShopSectionTitle extends StatelessWidget {
  final String title;

  const ShopSectionTitle({
    super.key,
    required this.title,
  });

  bool get isDiamondSection =>
      title.toLowerCase().contains(
        'diamond',
      );

  @override
  Widget build(BuildContext context) {
    final accent =
    isDiamondSection
        ? const Color(0xFF42CFFF)
        : const Color(0xFFFFC107);

    return Padding(
      padding: const EdgeInsets.only(
        top: 28,
        bottom: 18,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 2,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    accent.withOpacity(.9),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(width: 14),

          Container(
            padding:
            const EdgeInsets.symmetric(
              horizontal: 22,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              borderRadius:
              BorderRadius.circular(
                18,
              ),
              gradient:
              const LinearGradient(
                begin:
                Alignment.topLeft,
                end:
                Alignment.bottomRight,
                colors: [
                  Color(0xFF241544),
                  Color(0xFF0C1024),
                ],
              ),
              border: Border.all(
                color: accent,
                width: 1.8,
              ),
              boxShadow: [
                BoxShadow(
                  color: accent
                      .withOpacity(.30),
                  blurRadius: 22,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Row(
              mainAxisSize:
              MainAxisSize.min,
              children: [
                Icon(
                  isDiamondSection
                      ? Icons.diamond
                      : Icons
                      .monetization_on,
                  color: accent,
                  size: 18,
                ),

                const SizedBox(width: 8),

                Text(
                  title.toUpperCase(),
                  style:
                  TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight:
                    FontWeight
                        .w900,
                    letterSpacing:
                    2,
                    shadows: [
                      Shadow(
                        color: accent
                            .withOpacity(
                          .6,
                        ),
                        blurRadius:
                        12,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Container(
              height: 2,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    accent.withOpacity(.9),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}