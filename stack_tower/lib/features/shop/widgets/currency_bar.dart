import 'package:flutter/material.dart';

class CurrencyBar extends StatelessWidget {
  final int coins;
  final int diamonds;

  const CurrencyBar({
    super.key,
    required this.coins,
    required this.diamonds,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: const Color(0xFF0B0820),
        border: Border.all(
          color: const Color(0xFF5A2DFF),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF7B3FFF)
                .withOpacity(0.3),
            blurRadius: 20,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: _CurrencyPanel(
              icon: Icons.monetization_on,
              value: coins.toString(),
              label: 'COINS',
              iconColor: const Color(0xFFFFC107),
              borderColor: const Color(0xFFFFB300),
            ),
          ),

          Container(
            width: 1,
            height: 50,
            color: Colors.white24,
          ),

          Expanded(
            child: _CurrencyPanel(
              icon: Icons.diamond,
              value: diamonds.toString(),
              label: 'DIAMONDS',
              iconColor: const Color(0xFF4FC3F7),
              borderColor: const Color(0xFF00E5FF),
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
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: iconColor.withOpacity(0.12),
              border: Border.all(
                color: iconColor,
              ),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 28,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              mainAxisAlignment:
              MainAxisAlignment.center,
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    value,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: borderColor,
              ),
            ),
            child: Icon(
              Icons.add,
              color: borderColor,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}