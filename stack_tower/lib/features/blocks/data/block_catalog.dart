import 'package:flutter/material.dart';

import '../models/block_skin.dart';

class BlockCatalog {
  static const skins = [

    BlockSkin(
      id: 'default',
      name: 'Default',
      description: 'Classic Stack Tower block',
      price: 0,
      currency: BlockCurrency.coins,
      primaryColor: Colors.cyan,
      secondaryColor: Colors.blue,
    ),

    BlockSkin(
      id: 'wood',
      name: 'Wood',
      description: 'Natural wooden block',
      price: 1000,
      currency: BlockCurrency.coins,
      primaryColor: Colors.brown,
      secondaryColor: Colors.orange,
    ),

    BlockSkin(
      id: 'crystal',
      name: 'Crystal',
      description: 'Shiny crystal block',
      price: 3000,
      currency: BlockCurrency.coins,
      primaryColor: Colors.lightBlue,
      secondaryColor: Colors.white,
    ),

    BlockSkin(
      id: 'gold',
      name: 'Gold',
      description: 'Luxury premium block',
      price: 100,
      currency: BlockCurrency.diamonds,
      premium: true,
      primaryColor: Colors.amber,
      secondaryColor: Colors.yellow,
    ),
  ];
}