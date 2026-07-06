import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';

class ShopBackground extends StatelessWidget {
  const ShopBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            AppAssets.shopBackground,
            fit: BoxFit.cover,
          ),
        ),

        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(.35),
                  Colors.black.withOpacity(.55),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}