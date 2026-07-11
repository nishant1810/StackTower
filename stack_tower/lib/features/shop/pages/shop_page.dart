  import 'package:flutter/material.dart';

  import '../../daily_reward/pages/daily_reward_page.dart';
  import '../../../core/services/ads/rewarded_ad_service.dart';
  import '../../../core/services/purchase/purchase_service.dart';
  
  import '../../../core/assets/app_assets.dart';
  import '../controllers/shop_controller.dart';
  import '../data/shop_catalog.dart';
  import '../widgets/currency_bar.dart';
  import '../widgets/reward_cards.dart';
  import '../widgets/shop_pack_card.dart';
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
  
    void _showComingSoon() {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'In-App Purchases Coming Soon!',
          ),
        ),
      );
    }
  
    @override
    Widget build(BuildContext context) {
      final backButtonSize =
      (MediaQuery.of(context).size.width * 0.13)
          .clamp(46.0, 60.0);

      final premiumIconSize =
      (MediaQuery.of(context).size.width * 0.18)
          .clamp(60.0, 90.0);

      return AnimatedBuilder(
        animation: controller,
        builder: (_, __) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    AppAssets.shopBackground,
                    fit: BoxFit.cover,
                  ),
                ),
  
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(.35),
                          Colors.black.withOpacity(.78),
                        ],
                      ),
                    ),
                  ),
                ),
  
                SafeArea(
                  child: Column(
                    children: [
                      // =================================================
                      // HEADER
                      // =================================================
  
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                          12,
                          0,
                          12,
                          0,
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: backButtonSize,
                              height: backButtonSize,
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(
                                  16,
                                ),
                                gradient:
                                const LinearGradient(
                                  colors: [
                                    Color(
                                      0xFF241544,
                                    ),
                                    Color(
                                      0xFF0C1024,
                                    ),
                                  ],
                                ),
                                border: Border.all(
                                  color: const Color(
                                    0xFF8B5CF6,
                                  ),
                                ),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pop(
                                    context,
                                  );
                                },
                                icon: const Icon(
                                  Icons
                                      .arrow_back_ios_new,
                                  color:
                                  Colors.white,
                                  size: 18,
                                ),
                              ),
                            ),
  
                            Expanded(
                              child: Column(
                                children: [
                                  // Container(
                                  //   width: 34,
                                  //   height: 34,
                                  // ),

                                  Text(
                                    'SHOP',
                                    style:
                                    TextStyle(
                                      color:
                                      Colors
                                          .white,
                                      fontSize:
                                      (MediaQuery.of(context).size.width * 0.085)
                                          .clamp(24.0, 38.0),
                                      fontWeight:
                                      FontWeight
                                          .w900,
                                      letterSpacing:
                                      3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
  
                            const SizedBox(
                              width: 50,
                            ),
                          ],
                        ),
                      ),
  
                      const SizedBox(height: 8),
  
                      // =================================================
                      // SHOP CONTENT
                      // =================================================

                      Expanded(
                        child: ListView(
                          padding: const EdgeInsets.only(
                            left: 14,
                            right: 14,
                            top: 8,
                            bottom: 20,
                          ),
                          children: [

                            CurrencyBar(
                              coins: controller.coins,
                              diamonds: controller.diamonds,
                            ),

                            const SizedBox(height: 16),

                        RewardCards(
                          onClaimGift: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const DailyRewardPage(),
                              ),
                            );

                            await controller.refreshBalances();
                          },

                          onWatchAd: () async {
                            final rewarded =
                            await RewardedAdService.showAd(
                              onRewardEarned: () async {
                                await controller.claimWatchAdReward();
                              },
                            );

                            if (!context.mounted) return;

                            if (rewarded) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    '🎥 +250 Coins Rewarded!',
                                  ),
                                ),
                              );

                              await controller.refreshBalances();
                            }
                          },
                        ),

                            const SizedBox(height: 18),

                            const ShopSectionTitle(
                              title: 'COIN PACKS',
                            ),

                            ...ShopCatalog.coinPacks.map(
                                  (item) => ShopPackCard(
                                item: item,
                                onBuy: () async {
                                  await PurchaseService.instance.buyProduct(
                                    item.id,
                                  );

                                  await controller.refreshBalances();
                                },
                              ),
                            ),
  
                            const SizedBox(
                              height: 12,
                            ),
  
                            const ShopSectionTitle(
                              title:
                              'DIAMOND PACKS',
                            ),

                            ...ShopCatalog.diamondPacks.map(
                                  (item) => ShopPackCard(
                                item: item,
                                onBuy: () async {
                                  await PurchaseService.instance.buyProduct(
                                    item.id,
                                  );

                                  await controller.refreshBalances();
                                },
                              ),
                            ),
  
                            const SizedBox(
                              height: 12,
                            ),
  
                            const ShopSectionTitle(
                              title:
                              'REMOVE ADS',
                            ),
  
                            const SizedBox(
                              height: 8,
                            ),
  
                            Container(
                              height:
                              (MediaQuery.of(context).size.height * 0.14)
                                  .clamp(110.0, 150.0),
                              decoration:
                              BoxDecoration(
                                borderRadius:
                                BorderRadius
                                    .circular(
                                  24,
                                ),
                                gradient:
                                const LinearGradient(
                                  colors: [
                                    Color(
                                      0xFFFFC107,
                                    ),
                                    Color(
                                      0xFFFF9800,
                                    ),
                                  ],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors
                                        .orange
                                        .withOpacity(
                                      .35,
                                    ),
                                    blurRadius:
                                    24,
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 18,
                                  ),
  
                                  Container(
                                    width: premiumIconSize,
                                    height: premiumIconSize,
                                    decoration:
                                    BoxDecoration(
                                      shape:
                                      BoxShape
                                          .circle,
                                      color: Colors
                                          .white24,
                                    ),
                                    child:
                                    const Icon(
                                      Icons
                                          .workspace_premium,
                                      color:
                                      Colors.white,
                                      size:
                                      42,
                                    ),
                                  ),
  
                                  const SizedBox(
                                    width: 14,
                                  ),
  
                                  const Expanded(
                                    child:
                                    Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'REMOVE ADS',
                                          style:
                                          TextStyle(
                                            color:
                                            Colors.white,
                                            fontSize:
                                            22,
                                            fontWeight:
                                            FontWeight.w900,
                                          ),
                                        ),
                                        SizedBox(
                                          height:
                                          6,
                                        ),
                                        Text(
                                          'Permanent Ad-Free Experience',
                                          style:
                                          TextStyle(
                                            color:
                                            Colors.white,
                                            fontSize:
                                            13,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
  
                                  Padding(
                                    padding:
                                    const EdgeInsets.only(
                                      right:
                                      18,
                                    ),
                                    child:
                                    SizedBox(
                                      width:
                                      (MediaQuery.of(context).size.width * 0.22)
                                          .clamp(80.0, 120.0),

                                      height:
                                      (MediaQuery.of(context).size.height * 0.055)
                                          .clamp(42.0, 56.0),
                                      child:
                                      ElevatedButton(
                                        onPressed:
                                        _showComingSoon,
                                        style:
                                        ElevatedButton.styleFrom(
                                          backgroundColor:
                                          Colors.white,
                                          foregroundColor:
                                          Colors.black,
                                          shape:
                                          RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(
                                              14,
                                            ),
                                          ),
                                        ),
                                        child:
                                        const Text(
                                          '₹99',
                                          style:
                                          TextStyle(
                                            fontSize:
                                            16,
                                            fontWeight:
                                            FontWeight.w900,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
  
                            const SizedBox(
                              height: 40,
                            ),
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
    }
  }