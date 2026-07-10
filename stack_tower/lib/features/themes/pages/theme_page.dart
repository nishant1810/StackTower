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
  final ThemeController controller =
      ThemeController.instance;

  @override
  void initState() {
    super.initState();
    controller.loadTheme();
  }

  @override
  Widget build(BuildContext context) {
    final topPadding =
        MediaQuery.of(context).padding.top;

    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                AppAssets.themesBackground,
                fit: BoxFit.cover,
              ),

              Container(
                color: Colors.black.withValues(
                  alpha: 0.65,
                ),
              ),

              SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        16,
                        12,
                        16,
                        12,
                      ),
                      child: Row(
                        children: [
                          _BackButton(
                            onTap: () =>
                                Navigator.pop(
                                  context,
                                ),
                          ),

                          const SizedBox(width: 16),

                          const Expanded(
                            child: Text(
                              'THEMES',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight:
                                FontWeight.w900,
                                letterSpacing: 2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Expanded(
                      child: ListView.builder(
                        padding:
                        const EdgeInsets.all(16),
                        itemCount:
                        ThemeCatalog.themes.length,
                        itemBuilder:
                            (context, index) {
                          final theme =
                          ThemeCatalog
                              .themes[index];

                          return ThemeCard(
                            theme: theme,
                            unlocked: true,
                            selected:
                            controller.themeId ==
                                theme.id,
                            onSelect: () async {
                              await controller
                                  .changeTheme(
                                theme.id,
                              );

                              if (!mounted) {
                                return;
                              }

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
                            onBuy: () {},
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton({
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius:
      BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          borderRadius:
          BorderRadius.circular(20),
          border: Border.all(
            color: const Color(
              0xFF7B61FF,
            ).withValues(alpha: 0.45),
            width: 1.4,
          ),
          gradient: const LinearGradient(
            colors: [
              Color(0xFF0B1033),
              Color(0xFF131A4D),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(
                0xFF6A5CFF,
              ).withValues(alpha: 0.15),
              blurRadius: 16,
            ),
          ],
        ),
        child: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.white,
        ),
      ),
    );
  }
}