import '../models/shop_item.dart';

class ShopCatalog {
  static const List<ShopItem> coinPacks = [
    ShopItem(
      id: 'stack_coins_1000',
      title: '1,000',
      amount: 1000,
      price: '₹10',
    ),

    ShopItem(
      id: 'stack_coins_5000',
      title: '5,000',
      amount: 5000,
      price: '₹49',
      isPopular: true,
      bonusPercent: 10,
    ),

    ShopItem(
      id: 'stack_coins_12000',
      title: '12,000',
      amount: 12000,
      price: '₹99',
      isBestValue: true,
      bonusPercent: 25,
    ),

    ShopItem(
      id: 'stack_coins_30000',
      title: '30,000',
      amount: 30000,
      price: '₹199',
      isBestValue: true,
      bonusPercent: 50,
    ),
  ];

  static const List<ShopItem> diamondPacks = [
    ShopItem(
      id: 'stack_diamonds_50',
      title: '50',
      amount: 50,
      price: '₹10',
      isDiamond: true,
    ),

    ShopItem(
      id: 'stack_diamonds_150',
      title: '150',
      amount: 150,
      price: '₹49',
      isDiamond: true,
      isPopular: true,
      bonusPercent: 10,
    ),

    ShopItem(
      id: 'stack_diamonds_400',
      title: '400',
      amount: 400,
      price: '₹99',
      isDiamond: true,
      isBestValue: true,
      bonusPercent: 25,
    ),

    ShopItem(
      id: 'stack_diamonds_1200',
      title: '1,200',
      amount: 1200,
      price: '₹199',
      isDiamond: true,
      isBestValue: true,
      bonusPercent: 50,
    ),
  ];
}