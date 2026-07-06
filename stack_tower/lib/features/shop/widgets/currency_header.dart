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
    return Container(
      margin: const EdgeInsets.fromLTRB(
        16,
        12,
        16,
        16,
      ),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.black.withOpacity(0.35),
        border: Border.all(
          color: Colors.white.withOpacity(0.12),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.15),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: _CurrencyCard(
              icon: Icons.monetization_on,
              value: coins.toString(),
              label: 'COINS',
              glowColor: const Color(0xFFFFC107),
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: _CurrencyCard(
              icon: Icons.diamond,
              value: diamonds.toString(),
              label: 'DIAMONDS',
              glowColor: const Color(0xFF00E5FF),
            ),
          ),
        ],
      ),
    );
  }
}

class _CurrencyCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color glowColor;

  const _CurrencyCard({
    required this.icon,
    required this.value,
    required this.label,
    required this.glowColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.white.withOpacity(0.05),
        border: Border.all(
          color: glowColor.withOpacity(0.4),
        ),
        boxShadow: [
          BoxShadow(
            color: glowColor.withOpacity(0.15),
            blurRadius: 16,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: glowColor.withOpacity(0.15),
            ),
            child: Icon(
              icon,
              color: glowColor,
              size: 24,
            ),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Column(
              mainAxisAlignment:
              MainAxisAlignment.center,
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
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