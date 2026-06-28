import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final int stars;

  const StarRating({
    super.key,
    required this.stars,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildStar(
          active: stars >= 1,
          size: 58,
        ),
        const SizedBox(width: 6),
        _buildStar(
          active: stars >= 2,
          size: 70,
          center: true,
        ),
        const SizedBox(width: 6),
        _buildStar(
          active: stars >= 3,
          size: 58,
        ),
      ],
    );
  }

  Widget _buildStar({
    required bool active,
    required double size,
    bool center = false,
  }) {
    if (!active) {
      return Icon(
        Icons.star_rounded,
        size: size,
        color: Colors.white24,
      );
    }

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFFFB300)
                      .withValues(
                    alpha: 0.45,
                  ),
                  blurRadius: center ? 30 : 22,
                  spreadRadius: center ? 4 : 2,
                ),
              ],
            ),
          ),

          Icon(
            Icons.star_rounded,
            size: size,
            color: const Color(0xFFFFD54F),
            shadows: [
              Shadow(
                color: const Color(0xFFFFC107)
                    .withValues(
                  alpha: 0.90,
                ),
                blurRadius: 18,
              ),
              Shadow(
                color: Colors.white.withValues(
                  alpha: 0.70,
                ),
                blurRadius: 8,
              ),
            ],
          ),

          Icon(
            Icons.star_rounded,
            size: size * 0.45,
            color: Colors.white.withValues(
              alpha: 0.30,
            ),
          ),
        ],
      ),
    );
  }
}