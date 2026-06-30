import 'package:flutter/material.dart';

import '../controllers/shop_controller.dart';
import '../widgets/currency_header.dart';
import '../widgets/shop_section_card.dart';

import '../../themes/pages/theme_shop_page.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final ShopController _controller = ShopController();

  @override
  void initState() {
    super.initState();
    _controller.initialize().then((_) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  Future<void> _openThemes() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const ThemeShopPage(),
      ),
    );

    await _controller.refresh();

    if (mounted) {
      setState(() {});
    }
  }

  void _comingSoon(String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$title Coming Soon'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1018),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Shop',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              CurrencyHeader(
                coins: _controller.coins,
                diamonds: _controller.diamonds,
              ),

              const SizedBox(height: 24),

              Expanded(
                child: ListView(
                  children: [
                    ShopSectionCard(
                      title: 'Themes',
                      subtitle:
                      'Unlock new visual styles',
                      icon: Icons.palette,
                      onTap: _openThemes,
                    ),

                    ShopSectionCard(
                      title: 'Coin Packs',
                      subtitle:
                      'Get more coins instantly',
                      icon: Icons.monetization_on,
                      onTap: () => _comingSoon(
                        'Coin Packs',
                      ),
                    ),

                    ShopSectionCard(
                      title: 'Diamond Packs',
                      subtitle:
                      'Premium currency',
                      icon: Icons.diamond,
                      onTap: () => _comingSoon(
                        'Diamond Packs',
                      ),
                    ),

                    ShopSectionCard(
                      title: 'Daily Rewards',
                      subtitle:
                      'Claim free rewards',
                      icon: Icons.card_giftcard,
                      onTap: () => _comingSoon(
                        'Daily Rewards',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}