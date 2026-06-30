import 'package:flutter/material.dart';

class CurrencyHeader extends StatelessWidget {
  final int coins;
  final int diamonds;

  const CurrencyHeader({
    super.key,
    required this.coins,
    required this.diamonds,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _CurrencyCard(
            icon: Icons.monetization_on_rounded,
            title: 'COINS',
            value: coins.toString(),
            gradient: const [
              Color(0xFFFFD54F),
              Color(0xFFFFA000),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _CurrencyCard(
            icon: Icons.diamond_rounded,
            title: 'DIAMONDS',
            value: diamonds.toString(),
            gradient: const [
              Color(0xFF64B5F6),
              Color(0xFF1976D2),
            ],
          ),
        ),
      ],
    );
  }
}

class _CurrencyCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final List<Color> gradient;

  const _CurrencyCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: gradient,
        ),
        boxShadow: [
          BoxShadow(
            color: gradient.first.withOpacity(0.35),
            blurRadius: 16,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -15,
            top: -15,
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.12),
                shape: BoxShape.circle,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            child: Row(
              children: [
                Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius:
                    BorderRadius.circular(14),
                  ),
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 26,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 11,
                          fontWeight:
                          FontWeight.w600,
                          letterSpacing: 1.2,
                        ),
                      ),

                      const SizedBox(height: 4),

                      Text(
                        value,
                        overflow:
                        TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),
                    ],
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