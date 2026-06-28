import 'package:flutter/material.dart';

import '../models/block_model.dart';

class TowerBlockWidget extends StatelessWidget {
  const TowerBlockWidget({
    super.key,
    required this.block,
    this.glowing = false,
  });

  final BlockModel block;
  final bool glowing;

  @override
  Widget build(BuildContext context) {
    final Color glowColor = block.color;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 120),
      curve: Curves.easeOut,
      width: block.width,
      height: block.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white.withOpacity(0.28),
            glowColor.withOpacity(0.95),
            glowColor.withOpacity(0.80),
          ],
        ),
        border: Border.all(
          color: Colors.white.withOpacity(0.35),
          width: 1.5,
        ),
        boxShadow: [
          // Main glow
          BoxShadow(
            color: glowColor.withOpacity(
              glowing ? 0.90 : 0.40,
            ),
            blurRadius: glowing ? 30 : 14,
            spreadRadius: glowing ? 5 : 1,
          ),

          // Depth shadow
          const BoxShadow(
            color: Colors.black54,
            offset: Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          children: [
            // Top reflective strip
            Positioned(
              top: 2,
              left: 4,
              right: 4,
              child: Container(
                height: 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white.withOpacity(0.65),
                ),
              ),
            ),

            // Left inner glow
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              child: Container(
                width: 3,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.white.withOpacity(0.22),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),

            // Right reflective edge
            Positioned(
              top: 0,
              bottom: 0,
              right: 0,
              child: Container(
                width: 5,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.transparent,
                      Colors.white.withOpacity(0.18),
                    ],
                  ),
                ),
              ),
            ),

            // Center shine
            Positioned.fill(
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: block.height * 0.35,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white.withOpacity(0.15),
                        Colors.transparent,
                      ],
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