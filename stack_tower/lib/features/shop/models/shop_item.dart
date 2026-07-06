class ShopItem {
  final String id;
  final String title;
  final int amount;
  final String price;
  final bool isDiamond;

  const ShopItem({
    required this.id,
    required this.title,
    required this.amount,
    required this.price,
    this.isDiamond = false,
  });
}