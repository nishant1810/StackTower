import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:stack_tower/features/home/pages/home_page.dart';

import '../controllers/splash_controller.dart';
import '../widgets/animated_logo.dart';
import '../widgets/energy_beam.dart';
import '../widgets/floating_cubes.dart';
import '../widgets/loading_bar.dart';
import '../widgets/neon_glow.dart';
import '../widgets/particles_layer.dart';
import '../widgets/splash_background.dart';
import '../widgets/splash_overlay.dart';
import '../widgets/vignette.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() =>
      _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with TickerProviderStateMixin {
  late final SplashController _controller;

  @override
  void initState() {
    super.initState();

    _enterFullscreen();

    _controller = SplashController(
      vsync: this,
      onInitializationComplete:
      _navigateToHome,
    );

    WidgetsBinding.instance
        .addPostFrameCallback((_) {
      _controller.start();
    });
  }

  @override
  void dispose() {
    _controller.dispose();

    _exitFullscreen();

    super.dispose();
  }

  void _navigateToHome() {
    if (!mounted) return;

    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        transitionDuration:
        const Duration(
          milliseconds: 700,
        ),
        reverseTransitionDuration:
        const Duration(
          milliseconds: 300,
        ),
        pageBuilder: (
            _,
            animation,
            secondaryAnimation,
            ) {
          return const HomePage();
        },
        transitionsBuilder: (
            _,
            animation,
            secondaryAnimation,
            child,
            ) {
          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(
              scale: Tween<double>(
                begin: .98,
                end: 1.0,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve:
                  Curves.easeOutCubic,
                ),
              ),
              child: child,
            ),
          );
        },
      ),
    );
  }

  void _enterFullscreen() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersiveSticky,
    );
  }

  void _exitFullscreen() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size =
        MediaQuery.of(context).size;

    return AnnotatedRegion<
        SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          fit: StackFit.expand,
          children: [
            /// Background
            SplashBackground(
              zoom:
              _controller.zoomAnimation,
            ),

            /// Floating Cubes
            const FloatingCubes(),

            /// Particles
            const ParticlesLayer(),

            /// Overlay
            const SplashOverlay(),

            /// Vignette
            const Vignette(),

            /// Glow
            NeonGlow(
              animation:
              _controller.glowAnimation,
            ),

            /// Energy Beam
            EnergyBeam(
              glow:
              _controller.glowAnimation,
            ),

            /// Logo
            Center(
              child: AnimatedLogo(
                fade:
                _controller.fadeAnimation,
                scale:
                _controller.scaleAnimation,
                floating:
                _controller.floatAnimation,
              ),
            ),

            /// Loading Bar
            SafeArea(
              minimum: EdgeInsets.fromLTRB(
                size.width * 0.10,
                0,
                size.width * 0.10,
                size.height * 0.04,
              ),
              child: Align(
                alignment:
                Alignment.bottomCenter,
                child: LoadingBar(
                  progress:
                  _controller
                      .loadingAnimation,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}