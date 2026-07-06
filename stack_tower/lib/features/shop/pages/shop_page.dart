import 'package:flutter/material.dart';

import '../../../core/assets/app_assets.dart';
import '../controllers/shop_controller.dart';
import '../data/shop_catalog.dart';
import '../widgets/shop_pack_card.dart';
import '../widgets/currency_bar.dart';
import '../widgets/reward_cards.dart';
import '../widgets/shop_section_title.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final controller = ShopController();

  @override
  void initState() {
    super.initState();
    controller.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              /// Background
              Positioned.fill(
                child: Image.asset(
                  AppAssets.shopBackground,
                  fit: BoxFit.cover,
                ),
              ),

              /// Premium Overlay
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(.45),
                        Colors.black.withOpacity(.70),
                      ],
                    ),
                  ),
                ),
              ),

              SafeArea(
                child: Column(
                  children: [
                    /// Header
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                            ),
                          ),
                          const Expanded(
                            child: Text(
                              'SHOP',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 3,
                              ),
                            ),
                          ),
                          const SizedBox(width: 48),
                        ],
                      ),
                    ),

                    /// Currency Header
                    Column(
                      children: [
                        CurrencyBar(
                          coins: controller.coins,
                          diamonds: controller.diamonds,
                        ),

                        const SizedBox(height: 12),

                        RewardCards(
                          onClaimGift: () {
                            controller.claimDailyReward();
                          },
                          onWatchAd: () {
                            // rewarded ad
                          },
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        children: [
                          /// FEATURED OFFER
                          Container(
                            padding: const EdgeInsets.all(20),
                            margin: const EdgeInsets.only(
                              bottom: 24,
                            ),
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(24),
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFF8B5CF6),
                                  Color(0xFF5B21B6),
                                ],
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x668B5CF6),
                                  blurRadius: 20,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: const Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '🔥 BEST VALUE',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight:
                                    FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 12),
                                Text(
                                  '10,000 Coins',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight:
                                    FontWeight.w900,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  '+100 Bonus Diamonds',
                                  style: TextStyle(
                                    color: Colors.white70,
                                  ),
                                ),
                                SizedBox(height: 16),
                                Align(
                                  alignment:
                                  Alignment.centerRight,
                                  child: Text(
                                    '₹99',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 32,
                                      fontWeight:
                                      FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          /// COINS
                          const ShopSectionTitle(
                            title: 'COIN PACKS',
                          ),

                          const SizedBox(height: 12),

                          ...ShopCatalog.coinPacks.map(
                                (item) => Padding(
                              padding: const EdgeInsets.only(
                                bottom: 12,
                              ),
                              child: ShopPackCard(
                                item: item,
                                onBuy: () async {
                                  await controller.buyCoins(
                                    item.amount,
                                  );
                                },
                              ),
                            ),
                          ),

                          const SizedBox(height: 24),

                          const ShopSectionTitle(
                            title: 'DIAMOND PACKS',
                          ),

                          const SizedBox(height: 12),

                          ...ShopCatalog.diamondPacks.map(
                                (item) => Padding(
                              padding: const EdgeInsets.only(
                                bottom: 12,
                              ),
                              child: ShopPackCard(
                                item: item,
                                onBuy: () async {
                                  await controller.buyDiamonds(
                                    item.amount,
                                  );
                                },
                              ),
                            ),
                          ),

                          const SizedBox(height: 24),

                          /// FREE REWARDS
                          const Text(
                            'FREE REWARDS',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                          ),

                          const SizedBox(height: 12),

                          Container(
                            padding:
                            const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius:
                              BorderRadius.circular(
                                20,
                              ),
                              border: Border.all(
                                color: Colors.white10,
                              ),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.card_giftcard,
                                  color: Colors.amber,
                                  size: 32,
                                ),
                                const SizedBox(width: 12),
                                const Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text(
                                        'Daily Gift',
                                        style: TextStyle(
                                          color:
                                          Colors.white,
                                          fontWeight:
                                          FontWeight
                                              .bold,
                                        ),
                                      ),
                                      Text(
                                        'Claim Free Coins',
                                        style: TextStyle(
                                          color:
                                          Colors.white70,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child:
                                  const Text('CLAIM'),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 40),
                        ],
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
  }}