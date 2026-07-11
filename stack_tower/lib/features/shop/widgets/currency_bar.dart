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
    final size = MediaQuery.of(context).size;

    final barHeight =
    (size.height * 0.11).clamp(80.0, 110.0);

    final horizontalMargin =
    (size.width * 0.03).clamp(8.0, 16.0);

    return Container(
      height: barHeight,
      margin: EdgeInsets.symmetric(
        horizontal: horizontalMargin,
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
              iconColor: const Color(0xFFFFC107),
              borderColor: const Color(0xFFFFC107),
            ),
          ),

          Container(
            width: 2,
            height: barHeight * 0.55,
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
              iconColor: const Color(0xFF42CFFF),
              borderColor: const Color(0xFF42CFFF),
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
    final size = MediaQuery.of(context).size;

    final iconBox =
    (size.width * 0.11).clamp(40.0, 54.0);

    final iconSize =
    (size.width * 0.055).clamp(18.0, 28.0);

    final valueFont =
    (size.width * 0.045).clamp(16.0, 22.0);

    final labelFont =
    (size.width * 0.022).clamp(8.0, 11.0);

    final addButtonSize =
    (size.width * 0.07).clamp(24.0, 32.0);

    return Row(
      children: [
        Container(
          width: iconBox,
          height: iconBox,
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
            size: iconSize,
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
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: valueFont,
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
                    fontSize: labelFont,
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
          width: addButtonSize,
          height: addButtonSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                borderColor,
                borderColor.withOpacity(.75),
              ],
            ),
          ),
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: addButtonSize * 0.55,
          ),
        ),
      ],
    );
  }
}