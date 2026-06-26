import 'package:flutter/material.dart';

import '../models/block_model.dart';
import '../models/tower_model.dart';

class TowerWidget extends StatelessWidget {
  const TowerWidget({
    super.key,
    required this.tower,
  });

  final TowerModel tower;

  @override
  Widget build(BuildContext context) {
    if (tower.isEmpty) {
      return const SizedBox.shrink();
    }

    return IgnorePointer(
      child: Stack(
        children: [
          for (final block in tower.blocks)
            _TowerBlock(
              key: ValueKey(block.id),
              block: block,
            ),
        ],
      ),
    );
  }
}

class _TowerBlock extends StatelessWidget {
  const _TowerBlock({
    required this.block,
  });

  final BlockModel block;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(
        milliseconds: 80,
      ),
      curve: Curves.linear,
      left: block.x,
      top: block.y,
      width: block.width,
      height: block.height,
      child: RepaintBoundary(
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius:
            BorderRadius.circular(4),

            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                block.color.withValues(
                  alpha: .95,
                ),
                block.color,
              ],
            ),

            border: Border.all(
              color: Colors.white24,
              width: 1.2,
            ),

            boxShadow: [
              BoxShadow(
                color: block.color.withValues(
                  alpha: .40,
                ),
                blurRadius: 12,
              ),
            ],
          ),

          child: Stack(
            children: [

              //--------------------------------------
              // Top Highlight
              //--------------------------------------

              Positioned(
                left: 3,
                right: 3,
                top: 2,
                child: Container(
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(10),
                    gradient: LinearGradient(
                      colors: [
                        Colors.white.withValues(
                          alpha: .35,
                        ),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),

              //--------------------------------------
              // Bottom Shadow
              //--------------------------------------

              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: 4,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withValues(
                          alpha: .18,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}