import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/app_initializer.dart';
import '../home/home_screen.dart';

import 'splash_controller.dart';
import 'widgets/animated_logo.dart';
import 'widgets/energy_beam.dart';
import 'widgets/floating_cubes.dart';
import 'widgets/loading_bar.dart';
import 'widgets/neon_glow.dart';
import 'widgets/particles_layer.dart';
import 'widgets/splash_background.dart';
import 'widgets/splash_overlay.dart';
import 'widgets/vignette.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final SplashController controller;

  bool _navigated = false;

  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersiveSticky,
    );

    controller = SplashController();
    controller.initialize(this);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.start();
    });

    _initialize();
  }

  Future<void> _initialize() async {
    try {
      await AppInitializer.initialize().timeout(
        const Duration(seconds: 5),
      );

      await Future.delayed(
        const Duration(seconds: 3),
      );

      _goToHome();
    } catch (e) {
      debugPrint("Splash Error: $e");

      _goToHome();
    }
  }

  void _goToHome() {
    if (!mounted || _navigated) return;

    _navigated = true;

    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        transitionDuration:
        const Duration(milliseconds: 700),
        reverseTransitionDuration:
        const Duration(milliseconds: 300),
        pageBuilder: (_, animation, __) =>
        const HomeScreen(),
        transitionsBuilder:
            (_, animation, __, child) {
          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(
              scale: Tween<double>(
                begin: .98,
                end: 1,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeOut,
                ),
              ),
              child: child,
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    controller.disposeController();

    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
    );

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          fit: StackFit.expand,
          children: [
            SplashBackground(
              zoom: controller.zoomAnimation,
            ),

            const FloatingCubes(),

            const ParticlesLayer(),

            const SplashOverlay(),

            const Vignette(),

            NeonGlow(
              animation: controller.glowAnimation,
            ),

            EnergyBeam(
              glow: controller.glowAnimation,
            ),

            Center(
              child: AnimatedLogo(
                fade: controller.fadeAnimation,
                floating: controller.floatAnimation,
                scale: controller.scaleAnimation,
              ),
            ),

            Positioned(
              left: 40,
              right: 40,
              bottom: 50,
              child: LoadingBar(
                progress: controller.loadingAnimation,
              ),
            ),
          ],
        ),
      ),
    );
  }
}