class ShopItem {
  final String id;
  final String title;
  final int amount;
  final String price;
  final bool isDiamond;

  /// UI Metadata
  final bool isPopular;
  final bool isBestValue;
  final int bonusPercent;

  const ShopItem({
    required this.id,
    required this.title,
    required this.amount,
    required this.price,
    this.isDiamond = false,
    this.isPopular = false,
    this.isBestValue = false,
    this.bonusPercent = 0,
  });

  bool get hasBonus => bonusPercent > 0;
}