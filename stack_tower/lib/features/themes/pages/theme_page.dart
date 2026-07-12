import 'package:flutter/material.dart';

import '../../../core/assets/app_assets.dart';
import '../../../core/services/auth/auth_service.dart';
import '../../auth/pages/login_page.dart';
import '../../gameplay/pages/gameplay_page.dart';
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
    final size = MediaQuery.of(context).size;

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
                color: Colors.black.withOpacity(
                  0.65,
                ),
              ),

              SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        size.width * 0.04,
                        size.height * 0.015,
                        size.width * 0.04,
                        size.height * 0.015,
                      ),
                      child: Row(
                        children: [
                          _BackButton(
                            onTap: () =>
                                Navigator.pop(
                                  context,
                                ),
                          ),

                          SizedBox(
                            width:
                            size.width * 0.04,
                          ),

                          Expanded(
                            child: Text(
                              'THEMES',
                              style: TextStyle(
                                color:
                                Colors.white,
                                fontSize:
                                (size.width *
                                    0.08)
                                    .clamp(
                                  24.0,
                                  36.0,
                                ),
                                fontWeight:
                                FontWeight
                                    .w900,
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
                        EdgeInsets.all(
                          size.width * 0.04,
                        ),
                        itemCount:
                        ThemeCatalog
                            .themes
                            .length,
                        itemBuilder:
                            (context, index) {
                          final theme =
                          ThemeCatalog
                              .themes[
                          index];

                          return ThemeCard(
                            theme: theme,
                            unlocked: true,
                            selected:
                            controller
                                .themeId ==
                                theme.id,

                            onSelect:
                                () async {
                              await controller
                                  .changeTheme(
                                theme.id,
                              );

                              if (!mounted) {
                                return;
                              }

                              /// Already logged in
                              if (AuthService
                                  .isAuthenticated) {
                                Navigator
                                    .pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                    const GameplayPage(),
                                  ),
                                );
                                return;
                              }

                              /// Not logged in
                              final result =
                              await Navigator
                                  .push<bool>(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                  const LoginPage(),
                                ),
                              );

                              if (!mounted) {
                                return;
                              }

                              if (result ==
                                  true) {
                                Navigator
                                    .pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                    const GameplayPage(),
                                  ),
                                );
                              }
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
    final size = MediaQuery.of(context).size;

    final buttonSize =
    (size.width * 0.15).clamp(
      52.0,
      70.0,
    );

    return InkWell(
      borderRadius:
      BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        width: buttonSize,
        height: buttonSize,
        decoration: BoxDecoration(
          borderRadius:
          BorderRadius.circular(20),
          border: Border.all(
            color: const Color(
              0xFF7B61FF,
            ).withOpacity(0.45),
            width: 1.4,
          ),
          gradient:
          const LinearGradient(
            colors: [
              Color(0xFF0B1033),
              Color(0xFF131A4D),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(
                0xFF6A5CFF,
              ).withOpacity(0.15),
              blurRadius: 16,
            ),
          ],
        ),
        child: Icon(
          Icons.arrow_back_ios_new,
          color: Colors.white,
          size: (buttonSize * 0.32)
              .clamp(
            18.0,
            26.0,
          ),
        ),
      ),
    );
  }
}