import 'package:flutter/material.dart';

import '../controllers/shop_controller.dart';
import '../data/shop_catalog.dart';
import '../models/shop_item.dart';

class DiamondShopPage extends StatefulWidget {
  const DiamondShopPage({super.key});

  @override
  State<DiamondShopPage> createState() =>
      _DiamondShopPageState();
}

class _DiamondShopPageState
    extends State<DiamondShopPage> {
  final ShopController controller = ShopController();

  @override
  void initState() {
    super.initState();
    controller.initialize().then((_) {
      if (mounted) setState(() {});
    });
  }

  Future<void> _buyPack(ShopItem item) async {
    final success = await controller.buyDiamondPack(
      diamondAmount: item.amount,
      coinCost: item.price,
    );

    if (!mounted) return;

    setState(() {});

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          success
              ? 'Purchased ${item.amount} Diamonds'
              : 'Not enough Coins',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final packs = ShopCatalog.diamondPacks;

    return Scaffold(
      backgroundColor: const Color(0xFF0F111A),
      appBar: AppBar(
        title: const Text('Diamond Shop'),
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
                  '🪙 ${controller.coins}',
                  style: const TextStyle(
                    color: Colors.amber,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '💎 ${controller.diamonds}',
                  style: const TextStyle(
                    color: Colors.lightBlueAccent,
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
                          top: 0,
                          right: 0,
                          child: Container(
                            padding:
                            const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration:
                            const BoxDecoration(
                              color: Colors.purple,
                              borderRadius:
                              BorderRadius.only(
                                topRight:
                                Radius.circular(20),
                                bottomLeft:
                                Radius.circular(20),
                              ),
                            ),
                            child: const Text(
                              'BEST VALUE',
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
                              width: 64,
                              height: 64,
                              decoration:
                              BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors
                                    .blueAccent
                                    .withOpacity(
                                    0.15),
                              ),
                              child: const Icon(
                                Icons.diamond,
                                color:
                                Colors.lightBlueAccent,
                                size: 36,
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
                                  '${item.price} 🪙',
                                  style:
                                  const TextStyle(
                                    color:
                                    Colors.amber,
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
                                    Colors
                                        .lightBlueAccent,
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