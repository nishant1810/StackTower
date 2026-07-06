import 'package:flutter/material.dart';

import '../../../core/assets/app_assets.dart';
import '../controllers/theme_controller.dart';
import '../data/theme_catalog.dart';
import '../widgets/theme_card.dart';

class ThemesPage extends StatefulWidget {
  const ThemesPage({super.key});

  @override
  State<ThemesPage> createState() => _ThemesPageState();
}

class _ThemesPageState extends State<ThemesPage> {
  final ThemesController controller = ThemesController();

  @override
  void initState() {
    super.initState();
    controller.load();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            fit: StackFit.expand,
            children: [
              /// Background
              Image.asset(
                AppAssets.themesBackground,
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),

              /// Dark Overlay
              Container(
                color: Colors.black.withOpacity(0.35),
              ),

              /// Back Button
              Positioned(
                top: topPadding + 8,
                left: 12,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ),

              /// Title
              Positioned(
                top: topPadding + 18,
                left: 0,
                right: 0,
                child: const Center(
                  child: Text(
                    'THEMES',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 2,
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          blurRadius: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              /// Currency Header
              Positioned(
                top: topPadding + 70,
                left: 16,
                right: 16,
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    _currencyCard(
                      icon: Icons.monetization_on,
                      value: controller.coins.toString(),
                      color: Colors.amber,
                    ),
                    _currencyCard(
                      icon: Icons.diamond,
                      value: controller.diamonds.toString(),
                      color: Colors.cyan,
                    ),
                  ],
                ),
              ),

              /// Theme List
              Padding(
                padding: EdgeInsets.only(
                  top: topPadding + 130,
                ),
                child: ListView.builder(
                  physics:
                  const BouncingScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(
                    16,
                    8,
                    16,
                    24,
                  ),
                  itemCount:
                  ThemeCatalog.themes.length,
                  itemBuilder: (context, index) {
                    final theme =
                    ThemeCatalog.themes[index];

                    return ThemeCard(
                      theme: theme,
                      unlocked: controller
                          .unlockedThemes
                          .contains(theme.id),
                      selected:
                      controller.selectedTheme ==
                          theme.id,

                      onSelect: () async {
                        await controller
                            .selectTheme(
                          theme.id,
                        );

                        if (!mounted) return;

                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(
                          SnackBar(
                            content: Text(
                              '${theme.name} selected',
                            ),
                          ),
                        );
                      },

                      onBuy: () async {
                        final success =
                        await controller.buyTheme(
                          theme,
                        );

                        if (!mounted) return;

                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(
                          SnackBar(
                            content: Text(
                              success
                                  ? '${theme.name} unlocked!'
                                  : 'Not enough ${theme.isPremium ? 'diamonds' : 'coins'}',
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _currencyCard({
    required IconData icon,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.6),
        borderRadius:
        BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white24,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: color,
            size: 22,
          ),
          const SizedBox(width: 6),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}