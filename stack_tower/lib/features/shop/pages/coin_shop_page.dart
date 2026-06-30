import 'package:flutter/material.dart';

import '../controllers/shop_controller.dart';
import '../data/shop_catalog.dart';
import '../models/shop_item.dart';

class CoinShopPage extends StatefulWidget {
  const CoinShopPage({super.key});

  @override
  State<CoinShopPage> createState() => _CoinShopPageState();
}

class _CoinShopPageState extends State<CoinShopPage> {
  final ShopController controller = ShopController();

  @override
  void initState() {
    super.initState();
    controller.initialize().then((_) {
      if (mounted) setState(() {});
    });
  }

  Future<void> _buyPack(ShopItem item) async {
    final success = await controller.buyCoinPack(
      coinAmount: item.amount,
      diamondCost: item.price,
    );

    if (!mounted) return;

    setState(() {});

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          success
              ? 'Purchased ${item.amount} Coins'
              : 'Not enough Diamonds',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final packs = ShopCatalog.coinPacks;

    return Scaffold(
      backgroundColor: const Color(0xFF0F111A),
      appBar: AppBar(
        title: const Text('Coin Shop'),
        centerTitle: true,
        backgroundColor: const Color(0xFF0F111A),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 14,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFF1C1E2D),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '💎 ${controller.diamonds}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '🪙 ${controller.coins}',
                  style: const TextStyle(
                    color: Colors.amber,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              itemCount: packs.length,
              itemBuilder: (context, index) {
                final item = packs[index];

                return Container(
                  margin:
                  const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1C1E2D),
                    borderRadius:
                    BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      if (item.isPopular)
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            padding:
                            const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration:
                            const BoxDecoration(
                              color: Colors.orange,
                              borderRadius:
                              BorderRadius.only(
                                topRight:
                                Radius.circular(20),
                                bottomLeft:
                                Radius.circular(20),
                              ),
                            ),
                            child: const Text(
                              'POPULAR',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight:
                                FontWeight.bold,
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ),

                      Padding(
                        padding:
                        const EdgeInsets.all(18),
                        child: Row(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration:
                              BoxDecoration(
                                color:
                                Colors.amber.shade700,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons
                                    .monetization_on_rounded,
                                color: Colors.white,
                                size: 34,
                              ),
                            ),

                            const SizedBox(width: 16),

                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment
                                    .start,
                                children: [
                                  Text(
                                    item.title,
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
                                  const SizedBox(
                                      height: 4),
                                  Text(
                                    item.description,
                                    style:
                                    const TextStyle(
                                      color: Colors
                                          .white70,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Column(
                              children: [
                                Text(
                                  '${item.price} 💎',
                                  style:
                                  const TextStyle(
                                    color: Colors
                                        .lightBlueAccent,
                                    fontWeight:
                                    FontWeight
                                        .bold,
                                  ),
                                ),
                                const SizedBox(
                                    height: 8),
                                ElevatedButton(
                                  onPressed: () =>
                                      _buyPack(item),
                                  style:
                                  ElevatedButton
                                      .styleFrom(
                                    backgroundColor:
                                    Colors.amber,
                                    foregroundColor:
                                    Colors.black,
                                  ),
                                  child:
                                  const Text('Buy'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}