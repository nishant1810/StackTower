import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/app_initializer.dart';
import '../../screens/home_screen.dart';
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

  @override
  void initState() {
    super.initState();

    // Full-screen immersive mode
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
    );

    controller = SplashController();
    controller.initialize(this);
    controller.start();

    _initialize();
  }

  Future<void> _initialize() async {
    await AppInitializer.initialize();

    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;

    Navigator.of(context).pushReplacement(_buildRoute());
  }

  Route _buildRoute() {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 800),
      reverseTransitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (_, animation, __) => const HomeScreen(),
      transitionsBuilder: (_, animation, __, child) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: Tween<double>(
              begin: 0.98,
              end: 1.0,
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
    );
  }

  @override
  void dispose() {
    controller.disposeController();

    // Restore system UI
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
            /// Background
            SplashBackground(
              zoom: controller.zoomAnimation,
            ),

            /// Floating cubes
            const FloatingCubes(),

            /// Particles
            const ParticlesLayer(),

            /// Overlay
            const SplashOverlay(),

            /// Vignette
            const Vignette(),

            /// Glow
            NeonGlow(
              animation: controller.glowAnimation,
            ),

            /// Energy beam
            EnergyBeam(
              glow: controller.glowAnimation,
            ),

            /// Logo
            Center(
              child: AnimatedLogo(
                fade: controller.fadeAnimation,
                floating: controller.floatAnimation,
                scale: controller.scaleAnimation,
              ),
            ),

            /// Loading bar
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