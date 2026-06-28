import 'package:flutter/material.dart';
import 'package:stack_tower/core/assets/app_assets.dart';

class HomeBackground extends StatelessWidget {
  const HomeBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          AppAssets.homeBackground,
          fit: BoxFit.cover,
        ),

        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(.15),
                Colors.transparent,
                Colors.black.withOpacity(.25),
              ],
            ),
          ),
        ),
      ],
    );
  }
}