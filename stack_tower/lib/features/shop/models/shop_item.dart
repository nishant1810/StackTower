enum CurrencyType {
  coins,
  diamonds,
}

class ShopItem {
  final String id;
  final String title;
  final String description;
  final int amount;
  final int price;
  final CurrencyType currencyType;
  final bool isPopular;

  const ShopItem({
    required this.id,
    required this.title,
    required this.description,
    required this.amount,
    required this.price,
    required this.currencyType,
    this.isPopular = false,
  });
}