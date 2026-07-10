import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stack_tower/features/shop/pages/shop_page.dart';

import '../../../core/services/storage/storage_service.dart';

import '../../achievements/pages/achievements_page.dart';
import '../../settings/pages/settings_page.dart';
import '../models/home_state.dart';

class HomeController {
  HomeController({
    required TickerProvider vsync,
  }) : _vsync = vsync;

  final TickerProvider _vsync;

  bool _initialized = false;

  final ValueNotifier<HomeState> state = ValueNotifier(
    const HomeState(
      playerName: 'Player',
      level: 1,
      xp: 0,
      xpRequired: 100,
      coins: 0,
      gems: 0,
      bestScore: 0,
      dailyRewardAvailable: true,
    ),
  );

  final ValueNotifier<bool> isLoading = ValueNotifier(false);

  final ValueNotifier<String> selectedTheme =
  ValueNotifier('neon');

  late final AnimationController entranceController;
  late final AnimationController playGlowController;
  late final AnimationController towerFloatController;

  late final Animation<Offset> topBarSlideAnimation;
  late final Animation<double> towerOpacityAnimation;
  late final Animation<double> towerScaleAnimation;
  late final Animation<double> playOpacityAnimation;
  late final Animation<double> dockOpacityAnimation;
  late final Animation<Offset> dockSlideAnimation;
  late final Animation<double> playGlowAnimation;
  late final Animation<double> towerFloatAnimation;

  void initialize() {
    if (_initialized) return;

    _initialized = true;

    _initializeControllers();
    _initializeAnimations();
    _startAnimations();

    refresh();
  }

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

  void _startAnimations() {
    entranceController.forward();

    playGlowController.repeat(
      reverse: true,
    );

    towerFloatController.repeat(
      reverse: true,
    );
  }

  Future<void> _loadPlayerData() async {
    isLoading.value = true;

    try {
      final bestScore =
      await StorageService.getBestScore();

      final coins =
      await StorageService.getCoins();

      final diamonds =
      await StorageService.getDiamonds();

      final playerName =
      await StorageService.getPlayerName();

      final totalXp =
      await StorageService.getTotalXp();

      final level =
          (totalXp ~/ 1000) + 1;

      final xpRequired =
          level * 1000;

      selectedTheme.value =
      await StorageService.getSelectedTheme();

      state.value = state.value.copyWith(
        playerName: playerName,
        level: level,
        xp: totalXp,
        xpRequired: xpRequired,
        bestScore: bestScore,
        coins: coins,
        gems: diamonds,
      );
    } catch (e) {
      debugPrint(
        'HomeController load error: $e',
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> refresh() async {
    await _loadPlayerData();
  }

  Future<void> addCoins(int amount) async {
    final newValue =
        state.value.coins + amount;

    await StorageService.saveCoins(
      newValue,
    );

    state.value = state.value.copyWith(
      coins: newValue,
    );
  }

  Future<void> addGems(int amount) async {
    final newValue =
        state.value.gems + amount;

    await StorageService.saveDiamonds(
      newValue,
    );

    state.value = state.value.copyWith(
      gems: newValue,
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

  void startGame(BuildContext context) {}

  Future<void> openShop(
      BuildContext context,
      ) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const ShopPage(),
      ),
    );

    await refresh();
  }

  void openLeaderboard(
      BuildContext context,
      ) {}

  Future<void> openSettings(
      BuildContext context,
      ) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
        const SettingsPage(),
      ),
    );

    await refresh();
  }

  void openInventory(
      BuildContext context,
      ) {}

  void openMission(
      BuildContext context,
      ) {}

  void openAchievements(
      BuildContext context,
      ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
        const AchievementsPage(),
      ),
    );
  }

  void openDailyReward() {
    claimDailyReward();
  }

  Future<void> openThemes(
      BuildContext context,
      ) async {
    // Themes disabled temporarily
  }

  void dispose() {
    if (_initialized) {
      entranceController.dispose();
      playGlowController.dispose();
      towerFloatController.dispose();
    }

    state.dispose();
    isLoading.dispose();
    selectedTheme.dispose();
  }
}