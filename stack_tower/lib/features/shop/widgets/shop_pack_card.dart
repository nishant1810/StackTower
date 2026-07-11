import 'package:flutter/material.dart';

import '../models/shop_item.dart';

class ShopPackCard extends StatelessWidget {
  final ShopItem item;
  final VoidCallback onBuy;

  const ShopPackCard({
    super.key,
    required this.item,
    required this.onBuy,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final isDiamond = item.isDiamond;

    final borderColor = item.isBestValue
        ? const Color(0xFFFF4DA6)
        : item.isPopular
        ? const Color(0xFF44D16A)
        : isDiamond
        ? const Color(0xFF42CFFF)
        : const Color(0xFFFFC107);

    final cardHeight =
    (size.height * 0.17).clamp(120.0, 170.0);

    final iconBoxSize =
    (size.width * 0.18).clamp(60.0, 90.0);

    final iconSize =
    (size.width * 0.10).clamp(30.0, 46.0);

    final titleSize =
    (size.width * 0.06).clamp(18.0, 28.0);

    final descSize =
    (size.width * 0.03).clamp(10.0, 14.0);

    final priceSize =
    (size.width * 0.055).clamp(18.0, 28.0);

    final buyWidth =
    (size.width * 0.22).clamp(80.0, 120.0);

    final buyHeight =
    (size.height * 0.05).clamp(40.0, 50.0);

    return Container(
      height: cardHeight,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDiamond
              ? const [
            Color(0xFF1A1142),
            Color(0xFF090E21),
          ]
              : const [
            Color(0xFF241544),
            Color(0xFF0C1024),
          ],
        ),
        border: Border.all(
          color: borderColor,
          width: 1.8,
        ),
        boxShadow: [
          BoxShadow(
            color: borderColor.withOpacity(.35),
            blurRadius: 24,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Stack(
        children: [
          if (item.hasBonus)
            Positioned(
              top: 10,
              right: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: borderColor,
                  borderRadius:
                  BorderRadius.circular(20),
                ),
                child: Text(
                  '+${item.bonusPercent}% BONUS',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: descSize * 0.8,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 10,
            ),
            child: Row(
              children: [
                Container(
                  width: iconBoxSize,
                  height: iconBoxSize,
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(18),
                    gradient: LinearGradient(
                      colors: [
                        borderColor.withOpacity(.25),
                        borderColor.withOpacity(.05),
                      ],
                    ),
                    border: Border.all(
                      color:
                      borderColor.withOpacity(.4),
                    ),
                  ),
                  child: Icon(
                    isDiamond
                        ? Icons.diamond
                        : Icons.monetization_on,
                    color: borderColor,
                    size: iconSize,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        maxLines: 1,
                        overflow:
                        TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: titleSize,
                          fontWeight:
                          FontWeight.w900,
                        ),
                      ),

                      SizedBox(
                        height: cardHeight * 0.03,
                      ),

                      Text(
                        isDiamond
                            ? 'Premium Currency'
                            : 'Upgrade your tower',
                        maxLines: 2,
                        overflow:
                        TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: descSize,
                          fontWeight:
                          FontWeight.w600,
                        ),
                      ),

                      SizedBox(
                        height: cardHeight * 0.05,
                      ),

                      if (item.isBestValue)
                        const _Badge(
                          title: 'BEST VALUE',
                          color: Color(0xFFFF4DA6),
                        )
                      else if (item.isPopular)
                        const _Badge(
                          title: 'POPULAR',
                          color: Color(0xFF44D16A),
                        ),
                    ],
                  ),
                ),

                const SizedBox(width: 8),

                SizedBox(
                  width: buyWidth,
                  child: Column(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          item.price,
                          maxLines: 1,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: priceSize,
                            fontWeight:
                            FontWeight.w900,
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      Container(
                        height: buyHeight,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(
                            14,
                          ),
                          gradient: LinearGradient(
                            colors: [
                              borderColor,
                              borderColor
                                  .withOpacity(.75),
                            ],
                          ),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius:
                            BorderRadius.circular(
                              14,
                            ),
                            onTap: onBuy,
                            child: const Center(
                              child: Text(
                                'BUY',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight:
                                  FontWeight.w900,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String title;
  final Color color;

  const _Badge({
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius:
        BorderRadius.circular(20),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}