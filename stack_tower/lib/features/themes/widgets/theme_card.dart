import 'package:flutter/material.dart';

import '../models/game_theme.dart';

class ThemeCard extends StatelessWidget {
  final GameTheme theme;
  final bool unlocked;
  final bool selected;

  final VoidCallback? onBuy;
  final VoidCallback? onSelect;

  const ThemeCard({
    super.key,
    required this.theme,
    required this.unlocked,
    required this.selected,
    this.onBuy,
    this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final cardHeight =
    (size.height * 0.24).clamp(170.0, 240.0);

    final titleSize =
    (size.width * 0.06).clamp(18.0, 28.0);

    final buttonHeight =
    (size.height * 0.06).clamp(44.0, 56.0);

    final padding =
    (size.width * 0.05).clamp(14.0, 24.0);

    return Container(
      height: cardHeight,
      margin: EdgeInsets.only(
        bottom: size.height * 0.02,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: selected
              ? Colors.white
              : Colors.white24,
          width: selected ? 3 : 1,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              theme.previewImage,
              fit: BoxFit.cover,
            ),

            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.15),
                    Colors.black.withOpacity(0.80),
                  ],
                ),
              ),
            ),

            Positioned(
              top: 12,
              right: 12,
              child: _buildBadge(context),
            ),

            Padding(
              padding: EdgeInsets.all(padding),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      theme.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: titleSize,
                        fontWeight: FontWeight.w900,
                        shadows: const [
                          Shadow(
                            color: Colors.black,
                            blurRadius: 10,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const Spacer(),

                  _buildActionButton(
                    context,
                    buttonHeight,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBadge(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final badgeFont =
    (size.width * 0.028).clamp(10.0, 13.0);

    if (selected) {
      return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Text(
          'SELECTED',
          style: TextStyle(
            color: Colors.white,
            fontSize: badgeFont,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    if (!unlocked) {
      return Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          Icons.lock,
          color: Colors.white,
          size:
          (size.width * 0.05).clamp(16.0, 22.0),
        ),
      );
    }

    return const SizedBox.shrink();
  }

  Widget _buildActionButton(
      BuildContext context,
      double buttonHeight,
      ) {
    final fontSize =
    (MediaQuery.of(context).size.width * 0.04)
        .clamp(13.0, 16.0);

    if (selected) {
      return Container(
        width: double.infinity,
        height: buttonHeight,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(14),
        ),
        child: FittedBox(
          child: Text(
            'SELECTED',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: fontSize,
            ),
          ),
        ),
      );
    }

    if (unlocked) {
      return SizedBox(
        width: double.infinity,
        height: buttonHeight,
        child: ElevatedButton(
          onPressed: onSelect,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(14),
            ),
          ),
          child: FittedBox(
            child: Text(
              'USE',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: fontSize,
              ),
            ),
          ),
        ),
      );
    }

    return SizedBox(
      width: double.infinity,
      height: buttonHeight,
      child: ElevatedButton(
        onPressed: onBuy,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(14),
          ),
        ),
        child: FittedBox(
          child: Text(
            theme.isPremium
                ? 'BUY ${theme.diamondCost} 💎'
                : 'BUY ${theme.coinCost} COINS',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: fontSize,
            ),
          ),
        ),
      ),
    );
  }
}