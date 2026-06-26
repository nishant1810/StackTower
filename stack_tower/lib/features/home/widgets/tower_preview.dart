import 'package:flutter/material.dart';

import '../../../core/assets/app_assets.dart';
import '../controllers/home_controller.dart';

class TowerPreview extends StatelessWidget {
  const TowerPreview({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller.towerFloatAnimation,
      builder: (_, child) {
        return Transform.translate(
          offset: Offset(
            0,
            controller.towerFloatAnimation.value,
          ),
          child: child,
        );
      },
      child: const _TowerBody(),
    );
  }
}

class _TowerBody extends StatelessWidget {
  const _TowerBody();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 340,
      child: Stack(
        alignment: Alignment.center,
        children: const [
          _TowerGlow(),
          _TowerShadow(),
          _TowerImage(),
        ],
      ),
    );
  }
}

class _TowerGlow extends StatelessWidget {
  const _TowerGlow();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      height: 260,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            Color(0x5522D3EE),
            Colors.transparent,
          ],
        ),
      ),
    );
  }
}

class _TowerShadow extends StatelessWidget {
  const _TowerShadow();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 22,
      child: Container(
        width: 180,
        height: 26,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.black.withValues(alpha: .30),
          boxShadow: [
            BoxShadow(
              color: Colors.cyan.withValues(alpha: .18),
              blurRadius: 25,
            ),
          ],
        ),
      ),
    );
  }
}

class _TowerImage extends StatelessWidget {
  const _TowerImage();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.towerPreview,
      width: 210,
      fit: BoxFit.contain,
      filterQuality: FilterQuality.high,
    );
  }
}