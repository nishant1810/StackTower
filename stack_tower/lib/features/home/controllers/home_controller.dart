import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/home_state.dart';

class HomeController {
  HomeController({
    required TickerProvider vsync,
  }) : _vsync = vsync;

  final TickerProvider _vsync;

  bool _initialized = false;

  //=========================================================
  // STATE
  //=========================================================

  final ValueNotifier<HomeState> state = ValueNotifier(
    const HomeState(
      playerName: 'Player',
      level: 42,
      xp: 0.72,
      coins: 98750,
      gems: 2450,
      bestScore: 125,
      dailyRewardAvailable: true,
    ),
  );

  final ValueNotifier<bool> isLoading = ValueNotifier(false);

  //=========================================================
  // ANIMATION CONTROLLERS
  //=========================================================

  late final AnimationController entranceController;
  late final AnimationController playGlowController;
  late final AnimationController towerFloatController;

  //=========================================================
  // ANIMATIONS
  //=========================================================

  late final Animation<Offset> topBarSlideAnimation;
  late final Animation<double> towerOpacityAnimation;
  late final Animation<double> towerScaleAnimation;
  late final Animation<double> playOpacityAnimation;
  late final Animation<double> dockOpacityAnimation;
  late final Animation<Offset> dockSlideAnimation;

  late final Animation<double> playGlowAnimation;
  late final Animation<double> towerFloatAnimation;

  //=========================================================
  // INITIALIZE
  //=========================================================

  void initialize() {
    if (_initialized) return;

    _initialized = true;

    _initializeControllers();
    _initializeAnimations();
    _startAnimations();

    _loadPlayerData();
  }

  //=========================================================
  // CONTROLLERS
  //=========================================================

  void _initializeControllers() {
    entranceController = AnimationController(
      vsync: _vsync,
      duration: const Duration(milliseconds: 900),
    );

    playGlowController = AnimationController(
      vsync: _vsync,
      duration: const Duration(seconds: 2),
    );

    towerFloatController = AnimationController(
      vsync: _vsync,
      duration: const Duration(seconds: 5),
    );
  }

  //=========================================================
  // ANIMATIONS
  //=========================================================

  void _initializeAnimations() {
    topBarSlideAnimation = Tween<Offset>(
      begin: const Offset(0, -0.35),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: entranceController,
        curve: const Interval(
          0.0,
          0.35,
          curve: Curves.easeOutCubic,
        ),
      ),
    );

    towerOpacityAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: entranceController,
        curve: const Interval(
          0.15,
          0.65,
          curve: Curves.easeOut,
        ),
      ),
    );

    towerScaleAnimation = Tween<double>(
      begin: 0.75,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: entranceController,
        curve: const Interval(
          0.15,
          0.65,
          curve: Curves.easeOutBack,
        ),
      ),
    );

    playOpacityAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: entranceController,
        curve: const Interval(
          0.45,
          0.85,
          curve: Curves.easeOut,
        ),
      ),
    );

    dockOpacityAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: entranceController,
        curve: const Interval(
          0.60,
          1.00,
          curve: Curves.easeOut,
        ),
      ),
    );

    dockSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.40),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: entranceController,
        curve: const Interval(
          0.60,
          1.00,
          curve: Curves.easeOutCubic,
        ),
      ),
    );

    playGlowAnimation = Tween<double>(
      begin: 0.96,
      end: 1.04,
    ).animate(
      CurvedAnimation(
        parent: playGlowController,
        curve: Curves.easeInOut,
      ),
    );

    towerFloatAnimation = Tween<double>(
      begin: -8,
      end: 8,
    ).animate(
      CurvedAnimation(
        parent: towerFloatController,
        curve: Curves.easeInOut,
      ),
    );
  }

  //=========================================================
  // START ANIMATIONS
  //=========================================================

  void _startAnimations() {
    entranceController.forward();

    playGlowController.repeat(reverse: true);

    towerFloatController.repeat(reverse: true);
  }

  //=========================================================
  // LOAD DATA
  //=========================================================

  void _loadPlayerData() {
    isLoading.value = true;

    // TODO:
    // Load SharedPreferences
    // Audio
    // Theme
    // Ads

    isLoading.value = false;
  }

  //=========================================================
  // ACTIONS
  //=========================================================

  void addCoins(int amount) {
    state.value = state.value.copyWith(
      coins: state.value.coins + amount,
    );
  }

  void addGems(int amount) {
    state.value = state.value.copyWith(
      gems: state.value.gems + amount,
    );
  }

  void updateBestScore(int score) {
    if (score > state.value.bestScore) {
      state.value = state.value.copyWith(
        bestScore: score,
      );
    }
  }

  void claimDailyReward() {
    state.value = state.value.copyWith(
      dailyRewardAvailable: false,
    );
  }

  void refresh() {
    _loadPlayerData();
  }

  //=========================================================
  // NAVIGATION
  //=========================================================

  void startGame() {}

  void openShop() {}

  void openLeaderboard() {}

  void openSettings() {}

  void openInventory() {}

  void openMission() {}

  void openAchievements() {}

  //=========================================================
  // DISPOSE
  //=========================================================

  void dispose() {
    if (_initialized) {
      entranceController.dispose();
      playGlowController.dispose();
      towerFloatController.dispose();
    }

    state.dispose();
    isLoading.dispose();
  }
}