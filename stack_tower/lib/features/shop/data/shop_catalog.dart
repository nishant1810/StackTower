import '../models/shop_item.dart';

class ShopCatalog {
  const ShopCatalog._();

  // Buy Coins using Diamonds
  static const List<ShopItem> coinPacks = [
    ShopItem(
      id: 'coins_small',
      title: 'Small Coin Pack',
      description: '500 Coins',
      amount: 500,
      price: 5,
      currencyType: CurrencyType.diamonds,
    ),

    ShopItem(
      id: 'coins_medium',
      title: 'Medium Coin Pack',
      description: '1,500 Coins',
      amount: 1500,
      price: 12,
      currencyType: CurrencyType.diamonds,
      isPopular: true,
    ),

    ShopItem(
      id: 'coins_large',
      title: 'Large Coin Pack',
      description: '5,000 Coins',
      amount: 5000,
      price: 35,
      currencyType: CurrencyType.diamonds,
    ),

    ShopItem(
      id: 'coins_mega',
      title: 'Mega Coin Vault',
      description: '15,000 Coins',
      amount: 15000,
      price: 80,
      currencyType: CurrencyType.diamonds,
    ),
  ];

  // Buy Diamonds using Coins
  static const List<ShopItem> diamondPacks = [
    ShopItem(
      id: 'diamonds_small',
      title: 'Starter Diamonds',
      description: '10 Diamonds',
      amount: 10,
      price: 1000,
      currencyType: CurrencyType.coins,
    ),

    ShopItem(
      id: 'diamonds_medium',
      title: 'Diamond Crate',
      description: '25 Diamonds',
      amount: 25,
      price: 2200,
      currencyType: CurrencyType.coins,
      isPopular: true,
    ),

    ShopItem(
      id: 'diamonds_large',
      title: 'Diamond Vault',
      description: '50 Diamonds',
      amount: 50,
      price: 4000,
      currencyType: CurrencyType.coins,
    ),

    ShopItem(
      id: 'diamonds_mega',
      title: 'Royal Diamond Chest',
      description: '100 Diamonds',
      amount: 100,
      price: 7500,
      currencyType: CurrencyType.coins,
    ),
  ];
}