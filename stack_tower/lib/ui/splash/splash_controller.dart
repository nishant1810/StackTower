import 'package:flutter/material.dart';

class SplashController {
  late final AnimationController fadeController;
  late final AnimationController zoomController;
  late final AnimationController floatController;
  late final AnimationController glowController;
  late final AnimationController loadingController;

  late final Animation<double> fadeAnimation;
  late final Animation<double> zoomAnimation;
  late final Animation<double> floatAnimation;
  late final Animation<double> glowAnimation;
  late final Animation<double> scaleAnimation;
  late final Animation<double> loadingAnimation;

  bool _isInitialized = false;

  void initialize(TickerProvider vsync) {
    if (_isInitialized) return;

    fadeController = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 1200),
    );

    zoomController = AnimationController(
      vsync: vsync,
      duration: const Duration(seconds: 4),
    );

    floatController = AnimationController(
      vsync: vsync,
      duration: const Duration(seconds: 2),
    );

    glowController = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 1800),
    );

    loadingController = AnimationController(
      vsync: vsync,
      duration: const Duration(seconds: 3),
    );

    fadeAnimation = CurvedAnimation(
      parent: fadeController,
      curve: Curves.easeOut,
    );

    zoomAnimation = Tween<double>(
      begin: 1.0,
      end: 1.05,
    ).animate(
      CurvedAnimation(
        parent: zoomController,
        curve: Curves.easeOutCubic,
      ),
    );

    floatAnimation = Tween<double>(
      begin: -8.0,
      end: 8.0,
    ).animate(
      CurvedAnimation(
        parent: floatController,
        curve: Curves.easeInOut,
      ),
    );

    glowAnimation = Tween<double>(
      begin: 0.9,
      end: 1.1,
    ).animate(
      CurvedAnimation(
        parent: glowController,
        curve: Curves.easeInOut,
      ),
    );

    scaleAnimation = Tween<double>(
      begin: 0.98,
      end: 1.03,
    ).animate(
      CurvedAnimation(
        parent: glowController,
        curve: Curves.easeInOut,
      ),
    );

    loadingAnimation = CurvedAnimation(
      parent: loadingController,
      curve: Curves.easeOutCubic,
    );

    _isInitialized = true;
  }

  void start() {
    fadeController
      ..reset()
      ..forward();

    zoomController
      ..reset()
      ..forward();

    loadingController
      ..reset()
      ..forward();

    floatController.repeat(reverse: true);
    glowController.repeat(reverse: true);
  }

  void stop() {
    fadeController.stop();
    zoomController.stop();
    floatController.stop();
    glowController.stop();
    loadingController.stop();
  }

  void reset() {
    fadeController.reset();
    zoomController.reset();
    floatController.reset();
    glowController.reset();
    loadingController.reset();
  }

  void disposeController() {
    if (!_isInitialized) return;

    fadeController.dispose();
    zoomController.dispose();
    floatController.dispose();
    glowController.dispose();
    loadingController.dispose();

    _isInitialized = false;
  }
}