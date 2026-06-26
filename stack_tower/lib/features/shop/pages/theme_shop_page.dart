import 'package:flutter/material.dart';

import '../core/app_assets.dart';
import '../data/theme_data.dart';
import '../models/theme_data.dart';
import '../services/storage_service.dart';

class ThemeShopScreen extends StatefulWidget {
  const ThemeShopScreen({super.key});

  @override
  State<ThemeShopScreen> createState() =>
      _ThemeShopScreenState();
}

class _ThemeShopScreenState extends State<ThemeShopScreen> {
  int coins = 0;
  String selectedTheme = 'neon';
  List<String> unlockedThemes = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    coins = await StorageService.getCoins();
    selectedTheme =
    await StorageService.getSelectedTheme();
    unlockedThemes =
    await StorageService.getUnlockedThemes();

    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _buyTheme(
      String themeId,
      int cost,
      ) async {
    if (coins < cost) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Not enough coins!'),
        ),
      );
      return;
    }

    final success =
    await StorageService.spendCoins(cost);

    if (!success) return;

    await StorageService.unlockTheme(themeId);
    await _loadData();

    if (!mounted) return;

    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: const Color(0xFF111827),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.auto_awesome,
                color: Colors.amber,
                size: 60,
              ),
              const SizedBox(height: 16),
              const Text(
                "Theme Unlocked!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                themeId.toUpperCase(),
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _equipTheme(
      String themeId,
      ) async {
    await StorageService.saveSelectedTheme(
      themeId,
    );

    setState(() {
      selectedTheme = themeId;
    });
  }

  Widget buildThemeCard(GameTheme theme) {
    final bool unlocked =
    unlockedThemes.contains(theme.id);

    final bool equipped =
        selectedTheme == theme.id;

    final Color glowColor =
        theme.colors.first;

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF1E293B)
                .withOpacity(0.95),
            const Color(0xFF0F172A)
                .withOpacity(0.95),
          ],
        ),
        border: Border.all(
          color: glowColor.withOpacity(
            equipped ? 1.0 : 0.7,
          ),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: glowColor.withOpacity(0.25),
            blurRadius: 30,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [
            Row(
              mainAxisAlignment:
              MainAxisAlignment.center,
              children: theme.colors
                  .map(
                    (color) => Container(
                  width: 42,
                  height: 42,
                  margin:
                  const EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: color.withOpacity(0.8),
                        blurRadius: 16,
                      ),
                    ],
                  ),
                ),
              )
                  .toList(),
            ),
            const SizedBox(height: 18),
            Text(
              theme.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              theme.cost == 0
                  ? "FREE"
                  : "${theme.cost} COINS",
              style: TextStyle(
                color: Colors.amber.shade300,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            if (equipped)
              Container(
                padding:
                const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.circular(16),
                  gradient:
                  const LinearGradient(
                    colors: [
                      Color(0xFF22C55E),
                      Color(0xFF16A34A),
                    ],
                  ),
                ),
                child: const Row(
                  mainAxisSize:
                  MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: Colors.white,
                      size: 18,
                    ),
                    SizedBox(width: 6),
                    Text(
                      "EQUIPPED",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            else if (unlocked)
              ElevatedButton(
                onPressed: () =>
                    _equipTheme(theme.id),
                child: const Text(
                  "USE THEME",
                ),
              )
            else
              ElevatedButton(
                onPressed: () =>
                    _buyTheme(
                      theme.id,
                      theme.cost,
                    ),
                child: const Text(
                  "UNLOCK",
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppAssets.homeBackground,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.65),
          ),
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 10),
                const Text(
                  "THEME SHOP",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    itemCount: themes.length,
                    itemBuilder: (_, index) =>
                        buildThemeCard(
                          themes[index],
                        ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}