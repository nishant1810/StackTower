import 'package:flutter/material.dart';

import '../data/shop_catalog.dart';
import '../widgets/shop_pack_card.dart';

class DiamondShopPage extends StatelessWidget {
  const DiamondShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:
      ShopCatalog.diamondPacks.length,
      itemBuilder: (_, index) {
        final item =
        ShopCatalog.diamondPacks[index];

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