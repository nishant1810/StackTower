import '../models/shop_item.dart';

class ShopCatalog {
  static const List<ShopItem> coinPacks = [
    ShopItem(
      id: 'coins_1000',
      title: '1,000 Coins',
      amount: 1000,
      price: '₹10',
    ),
    ShopItem(
      id: 'coins_5000',
      title: '5,000 Coins',
      amount: 5000,
      price: '₹49',
    ),
    ShopItem(
      id: 'coins_10000',
      title: '10,000 Coins',
      amount: 10000,
      price: '₹99',
    ),
  ];

  static const List<ShopItem> diamondPacks = [
    ShopItem(
      id: 'diamond_50',
      title: '50 Diamonds',
      amount: 50,
      price: '₹10',
      isDiamond: true,
    ),
    ShopItem(
      id: 'diamond_250',
      title: '250 Diamonds',
      amount: 250,
      price: '₹49',
      isDiamond: true,
    ),
    ShopItem(
      id: 'diamond_500',
      title: '500 Diamonds',
      amount: 500,
      price: '₹99',
      isDiamond: true,
    ),
  ];
}