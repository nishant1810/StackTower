import 'package:flutter/material.dart';
import 'package:stack_tower/features/shop/widgets/currency_header.dart';

import '../controllers/theme_shop_controller.dart';
import '../widgets/theme_card.dart';
import '../data/theme_catalog.dart';

class ThemeShopPage extends StatefulWidget {
  const ThemeShopPage({super.key});

  @override
  State<ThemeShopPage> createState() =>
      _ThemeShopPageState();
}

class _ThemeShopPageState
    extends State<ThemeShopPage> {
  final controller =
  ThemeShopController();

  bool loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    await controller.initialize();

    if (!mounted) return;

    setState(() {
      loading = false;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> _onThemePressed(
      String themeId) async {
    if (controller.isUnlocked(themeId)) {
      await controller.equipTheme(
        themeId,
      );

      setState(() {});
      return;
    }

    final success =
    await controller.buyTheme(
      themeId,
    );

    if (!mounted) return;

    if (!success) {
      ScaffoldMessenger.of(context)
          .showSnackBar(
        const SnackBar(
          content: Text(
            'Not enough coins',
          ),
        ),
      );

      return;
    }

    await controller.equipTheme(themeId);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
      const Color(0xFF090E19),
      appBar: AppBar(
        title: const Text(
          'Theme Shop',
        ),
        centerTitle: true,
      ),
      body: loading
          ? const Center(
        child:
        CircularProgressIndicator(),
      )
          : Column(
        children: [
          const SizedBox(height: 16),

          ValueListenableBuilder<int>(
            valueListenable:
            controller.coins,
            builder: (
                context,
                coins,
                _,
                ) {
              return Container(
                margin:
                const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                padding:
                const EdgeInsets.all(
                  16,
                ),
                decoration:
                BoxDecoration(
                  color:
                  const Color(
                    0xFF141B2D,
                  ),
                  borderRadius:
                  BorderRadius.circular(
                    20,
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.monetization_on,
                      color:
                      Colors.amber,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      '$coins Coins',
                      style:
                      const TextStyle(
                        color:
                        Colors.white,
                        fontSize: 18,
                        fontWeight:
                        FontWeight
                            .bold,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),

          const SizedBox(height: 20),

          Expanded(
            child:
            ValueListenableBuilder<
                String>(
              valueListenable:
              controller
                  .selectedTheme,
              builder: (
                  context,
                  selected,
                  _,
                  ) {
                return ListView.builder(
                  padding:
                  const EdgeInsets.all(
                    20,
                  ),
                  itemCount:
                  ThemeCatalog
                      .themes
                      .length,
                  itemBuilder:
                      (
                      context,
                      index,
                      ) {
                    final theme =
                    ThemeCatalog
                        .themes[
                    index];

                    return ThemeCard(
                      theme:
                      theme,
                      unlocked:
                      controller
                          .isUnlocked(
                        theme.id,
                      ),
                      selected:
                      selected ==
                          theme
                              .id,
                      onPressed:
                          () =>
                          _onThemePressed(
                            theme.id,
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
  }
}