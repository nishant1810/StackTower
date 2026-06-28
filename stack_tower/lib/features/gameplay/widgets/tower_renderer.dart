import 'package:flutter/material.dart';

import '../models/block_model.dart';
import '../models/tower_model.dart';
import 'tower_block_widget.dart';

class TowerRenderer extends StatelessWidget {
  const TowerRenderer({
    super.key,
    required this.tower,
    required this.movingBlock,
  });

  final TowerModel tower;
  final BlockModel? movingBlock;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: IgnorePointer(
        child: LayoutBuilder(
          builder: (context, constraints) {
            const towerAreaWidth = 320.0;

            final centerX =
                (constraints.maxWidth - towerAreaWidth) / 2;

            final children = <Widget>[];

            // Render placed tower blocks
            for (final block in tower.blocks) {
              children.add(
                Positioned(
                  left: centerX + block.x,
                  top: block.y,
                  child: _GlowBlock(
                    child: TowerBlockWidget(
                      block: block,
                    ),
                  ),
                ),
              );
            }

            // Render active moving block
            if (movingBlock != null) {
              children.add(
                Positioned(
                  left: centerX + movingBlock!.x,
                  top: movingBlock!.y,
                  child: _GlowBlock(
                    glowStrength: 22,
                    child: TowerBlockWidget(
                      block: movingBlock!,
                    ),
                  ),
                ),
              );
            }

            // Center guide glow behind tower
            children.add(
              Positioned(
                bottom: 80,
                left: constraints.maxWidth / 2 - 90,
                child: IgnorePointer(
                  child: Container(
                    width: 180,
                    height: 500,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.cyan.withOpacity(0.12),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );

            return Stack(
              clipBehavior: Clip.none,
              children: children,
            );
          },
        ),
      ),
    );
  }
}

class _GlowBlock extends StatelessWidget {
  const _GlowBlock({
    required this.child,
    this.glowStrength = 14,
  });

  final Widget child;
  final double glowStrength;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.cyan.withOpacity(0.25),
            blurRadius: glowStrength,
            spreadRadius: 1,
          ),
        ],
      ),
      child: child,
    );
  }
}