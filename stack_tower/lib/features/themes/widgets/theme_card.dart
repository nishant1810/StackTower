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
    return Container(
      height: 200,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: selected ? Colors.white : Colors.white24,
          width: selected ? 3 : 1,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          fit: StackFit.expand,
          children: [
            /// Theme Background
            Image.asset(
              theme.previewImage,
              fit: BoxFit.cover,
            ),

            /// Dark Overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.15),
                    Colors.black.withOpacity(0.75),
                  ],
                ),
              ),
            ),

            /// Badge
            Positioned(
              top: 12,
              right: 12,
              child: _buildBadge(),
            ),

            /// Content
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    theme.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                  ),

                  const Spacer(),

                  _buildActionButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBadge() {
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
        child: const Text(
          'SELECTED',
          style: TextStyle(
            color: Colors.white,
            fontSize: 11,
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
        child: const Icon(
          Icons.lock,
          color: Colors.white,
          size: 18,
        ),
      );
    }

    return const SizedBox.shrink();
  }

  Widget _buildActionButton() {
    /// Selected Theme
    if (selected) {
      return Container(
        width: double.infinity,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(14),
        ),
        child: const Text(
          'SELECTED',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      );
    }

    /// Unlocked Theme
    if (unlocked) {
      return SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: onSelect,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          child: const Text(
            'USE',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      );
    }

    /// Locked Theme
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onBuy,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Text(
          theme.isPremium
              ? 'BUY ${theme.diamondCost} 💎'
              : 'BUY ${theme.coinCost} Coins',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}