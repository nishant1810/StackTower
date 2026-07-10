import 'package:flutter/material.dart';

class CurrencyBar extends StatelessWidget {
  final int coins;
  final int diamonds;

  const CurrencyBar({
    super.key,
    required this.coins,
    required this.diamonds,
  });

  String _formatNumber(int value) {
    if (value >= 1000000) {
      return '${(value / 1000000).toStringAsFixed(1)}M';
    }

    if (value >= 1000) {
      return '${(value / 1000).toStringAsFixed(1)}K';
    }

    return value.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92,
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF241544),
            Color(0xFF0A1024),
          ],
        ),
        border: Border.all(
          color: const Color(0xFF8B5CF6),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF8B5CF6)
                .withOpacity(.30),
            blurRadius: 28,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: _CurrencyPanel(
              icon: Icons.monetization_on,
              value: _formatNumber(coins),
              label: 'COINS',
              iconColor:
              const Color(0xFFFFC107),
              borderColor:
              const Color(0xFFFFC107),
            ),
          ),

          Container(
            width: 2,
            height: 48,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.white30,
                  Colors.transparent,
                ],
              ),
            ),
          ),

          Expanded(
            child: _CurrencyPanel(
              icon: Icons.diamond,
              value: _formatNumber(diamonds),
              label: 'DIAMONDS',
              iconColor:
              const Color(0xFF42CFFF),
              borderColor:
              const Color(0xFF42CFFF),
            ),
          ),
        ],
      ),
    );
  }
}

class _CurrencyPanel extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color iconColor;
  final Color borderColor;

  const _CurrencyPanel({
    required this.icon,
    required this.value,
    required this.label,
    required this.iconColor,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [
                iconColor.withOpacity(.35),
                iconColor.withOpacity(.08),
              ],
            ),
            border: Border.all(
              color: borderColor,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: borderColor
                    .withOpacity(.35),
                blurRadius: 12,
              ),
            ],
          ),
          child: Icon(
            icon,
            color: iconColor,
            size: 24,
          ),
        ),

        const SizedBox(width: 8),

        Expanded(
          child: Column(
            mainAxisAlignment:
            MainAxisAlignment.center,
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                alignment:
                Alignment.centerLeft,
                child: Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight:
                    FontWeight.w900,
                  ),
                ),
              ),

              const SizedBox(height: 2),

              FittedBox(
                fit: BoxFit.scaleDown,
                alignment:
                Alignment.centerLeft,
                child: Text(
                  label,
                  style: TextStyle(
                    color: iconColor,
                    fontSize: 10,
                    fontWeight:
                    FontWeight.w900,
                    letterSpacing: .8,
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(width: 4),

        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                borderColor,
                borderColor
                    .withOpacity(.75),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: borderColor
                    .withOpacity(.35),
                blurRadius: 10,
              ),
            ],
          ),
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 16,
          ),
        ),
      ],
    );
  }
}