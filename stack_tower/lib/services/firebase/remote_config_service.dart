import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigService {
  RemoteConfigService._();

  static final instance =
  RemoteConfigService._();

  late final FirebaseRemoteConfig _config;

  //==========================================================
  // Initialize
  //==========================================================

  Future<void> initialize() async {
    _config = FirebaseRemoteConfig.instance;

    await _config.setDefaults(
      {
        // Ads

        "interstitial_every": 3,

        "reward_continue_limit": 1,

        // Gameplay

        "perfect_bonus": 2,

        "combo_multiplier": 1.5,

        "block_speed": 260,

        // Rewards

        "daily_day1": 100,
        "daily_day2": 150,
        "daily_day3": 200,
        "daily_day4": 300,
        "daily_day5": 400,
        "daily_day6": 500,
        "daily_day7": 1000,

        // Events

        "double_coins": false,

        "event_theme": "default",
      },
    );

    await _config.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(
          seconds: 15,
        ),
        minimumFetchInterval:
        const Duration(
          hours: 1,
        ),
      ),
    );

    await fetch();
  }

  //==========================================================
  // Fetch
  //==========================================================

  Future<void> fetch() async {
    await _config.fetchAndActivate();
  }

  //==========================================================
  // Getters
  //==========================================================

  int get interstitialEvery =>
      _config.getInt(
        "interstitial_every",
      );

  int get continueLimit =>
      _config.getInt(
        "reward_continue_limit",
      );

  int get perfectBonus =>
      _config.getInt(
        "perfect_bonus",
      );

  double get comboMultiplier =>
      _config.getDouble(
        "combo_multiplier",
      );

  int get blockSpeed =>
      _config.getInt(
        "block_speed",
      );

  bool get doubleCoins =>
      _config.getBool(
        "double_coins",
      );

  String get eventTheme =>
      _config.getString(
        "event_theme",
      );

  List<int> get dailyRewards => [
    _config.getInt("daily_day1"),
    _config.getInt("daily_day2"),
    _config.getInt("daily_day3"),
    _config.getInt("daily_day4"),
    _config.getInt("daily_day5"),
    _config.getInt("daily_day6"),
    _config.getInt("daily_day7"),
  ];
}