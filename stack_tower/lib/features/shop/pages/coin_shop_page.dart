import 'package:flutter/material.dart';

import '../data/shop_catalog.dart';
import '../widgets/shop_pack_card.dart';

class CoinShopPage extends StatelessWidget {
  const CoinShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:
      ShopCatalog.coinPacks.length,
      itemBuilder: (_, index) {
        final item =
        ShopCatalog.coinPacks[index];

        return ShopPackCard(
          item: item,
          onBuy: () {
            // IAP later
          },
        );
      },
    );
  }
}