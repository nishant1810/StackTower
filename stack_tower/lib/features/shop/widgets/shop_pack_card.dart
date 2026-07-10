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
    final isDiamond = item.isDiamond;

    final borderColor = item.isBestValue
        ? const Color(0xFFFF4DA6)
        : item.isPopular
        ? const Color(0xFF44D16A)
        : isDiamond
        ? const Color(0xFF42CFFF)
        : const Color(0xFFFFC107);

    return Container(
      height: 140,
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
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '+${item.bonusPercent}% BONUS',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 9,
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
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    gradient: LinearGradient(
                      colors: [
                        borderColor.withOpacity(.25),
                        borderColor.withOpacity(.05),
                      ],
                    ),
                    border: Border.all(
                      color: borderColor.withOpacity(.4),
                    ),
                  ),
                  child: Icon(
                    isDiamond
                        ? Icons.diamond
                        : Icons.monetization_on,
                    color: borderColor,
                    size: 40,
                  ),
                ),

                const SizedBox(width: 14),

                Expanded(
                  flex: 5,
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
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                        ),
                      ),

                      const SizedBox(height: 4),

                      Text(
                        isDiamond
                            ? 'Premium Currency'
                            : 'Upgrade your tower',
                        maxLines: 2,
                        overflow:
                        TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 8),

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
                  width: 95,
                  child: Column(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: [
                      Text(
                        item.price,
                        maxLines: 1,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Container(
                        height: 42,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(
                            14,
                          ),
                          gradient:
                          LinearGradient(
                            colors: [
                              borderColor,
                              borderColor
                                  .withOpacity(.75),
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: borderColor
                                  .withOpacity(.35),
                              blurRadius: 12,
                            ),
                          ],
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
                                  color:
                                  Colors.white,
                                  fontSize: 13,
                                  fontWeight:
                                  FontWeight
                                      .w900,
                                  letterSpacing:
                                  1,
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
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(.4),
            blurRadius: 10,
          ),
        ],
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