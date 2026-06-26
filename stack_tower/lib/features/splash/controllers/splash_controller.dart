import 'dart:async';

import 'package:flutter/material.dart';

import 'package:stack_tower/core/app_initializer.dart';

class SplashController {
  SplashController({
    required TickerProvider vsync,
    required VoidCallback onInitializationComplete,
  })  : _vsync = vsync,
        _onInitializationComplete = onInitializationComplete {
    _initializeAnimations();
  }

  final TickerProvider _vsync;
  final VoidCallback _onInitializationComplete;

  bool _disposed = false;
  bool _navigationTriggered = false;

  // ---------------------------------------------------------------------------
  // Animation Controllers
  // ---------------------------------------------------------------------------

  late final AnimationController _fadeController;
  late final AnimationController _floatController;
  late final AnimationController _glowController;
  late final AnimationController _zoomController;
  late final AnimationController _loadingController;

  // ---------------------------------------------------------------------------
  // Animations
  // ---------------------------------------------------------------------------

  late final Animation<double> fadeAnimation;
  late final Animation<double> scaleAnimation;
  late final Animation<double> floatAnimation;
  late final Animation<double> glowAnimation;
  late final Animation<double> zoomAnimation;
  late final Animation<double> loadingAnimation;

  // ---------------------------------------------------------------------------
  // Initialize Animations
  // ---------------------------------------------------------------------------

  void _initializeAnimations() {
    _fadeController = AnimationController(
      vsync: _vsync,
      duration: const Duration(milliseconds: 1200),
    );

    _floatController = AnimationController(
      vsync: _vsync,
      duration: const Duration(seconds: 3),
    );

    _glowController = AnimationController(
      vsync: _vsync,
      duration: const Duration(milliseconds: 1800),
    );

    _zoomController = AnimationController(
      vsync: _vsync,
      duration: const Duration(seconds: 4),
    );

    _loadingController = AnimationController(
      vsync: _vsync,
      duration: const Duration(seconds: 3),
    );

    fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeOut,
    );

    scaleAnimation = Tween<double>(
      begin: .85,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _fadeController,
        curve: Curves.easeOutBack,
      ),
    );

    floatAnimation = Tween<double>(
      begin: -8,
      end: 8,
    ).animate(
      CurvedAnimation(
        parent: _floatController,
        curve: Curves.easeInOut,
      ),
    );

    glowAnimation = Tween<double>(
      begin: .4,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _glowController,
        curve: Curves.easeInOut,
      ),
    );

    zoomAnimation = Tween<double>(
      begin: 1,
      end: 1.08,
    ).animate(
      CurvedAnimation(
        parent: _zoomController,
        curve: Curves.easeOut,
      ),
    );

    loadingAnimation = CurvedAnimation(
      parent: _loadingController,
      curve: Curves.linear,
    );
  }

  // ---------------------------------------------------------------------------
  // Start Splash
  // ---------------------------------------------------------------------------

  Future<void> start() async {
    _fadeController.forward();

    _floatController.repeat(reverse: true);

    _glowController.repeat(reverse: true);

    _zoomController.forward();

    unawaited(_loadingController.forward());

    await _initializeApplication();
  }

  // ---------------------------------------------------------------------------
  // App Initialization
  // ---------------------------------------------------------------------------

  Future<void> _initializeApplication() async {
    try {
      await AppInitializer.initialize().timeout(
        const Duration(seconds: 5),
      );

      // Ensure splash stays visible for at least 3 seconds.
      await Future.delayed(
        const Duration(seconds: 3),
      );
    } catch (e) {
      debugPrint('Splash Initialization Error: $e');
    }

    if (_disposed) return;

    if (_navigationTriggered) return;

    _navigationTriggered = true;

    _onInitializationComplete();
  }

  // ---------------------------------------------------------------------------
  // Dispose
  // ---------------------------------------------------------------------------

  void dispose() {
    _disposed = true;

    _fadeController.dispose();
    _floatController.dispose();
    _glowController.dispose();
    _zoomController.dispose();
    _loadingController.dispose();
  }
}