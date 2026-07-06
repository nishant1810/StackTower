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

  bool get isBestValue {
    final amount = _extractAmount();
    return amount >= 10000;
  }

  bool get isPopular {
    final amount = _extractAmount();
    return amount >= 5000 && amount < 10000;
  }

  int _extractAmount() {
    final numbers = RegExp(r'\d+')
        .allMatches(item.title)
        .map((e) => int.tryParse(e.group(0) ?? '0') ?? 0)
        .toList();

    if (numbers.isEmpty) return 0;
    return numbers.first;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.08),
            Colors.white.withOpacity(0.03),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(
          color: isBestValue
              ? const Color(0xFFFFD54F)
              : Colors.white12,
          width: 1.4,
        ),
        boxShadow: [
          if (isBestValue)
            const BoxShadow(
              color: Color(0x33FFD54F),
              blurRadius: 20,
              spreadRadius: 2,
            ),
        ],
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          if (isBestValue)
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFFFD54F)
                    .withOpacity(0.15),
                borderRadius:
                BorderRadius.circular(12),
              ),
              child: const Text(
                '🔥 BEST VALUE',
                style: TextStyle(
                  color: Color(0xFFFFD54F),
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

          if (isPopular)
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.15),
                borderRadius:
                BorderRadius.circular(12),
              ),
              child: const Text(
                '⭐ MOST POPULAR',
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

          const SizedBox(height: 16),

          Row(
            children: [
              Text(
                item.title.contains('Diamond')
                    ? '💎'
                    : '🪙',
                style: const TextStyle(
                  fontSize: 32,
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Text(
                  item.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Text(
            'Instant delivery',
            style: TextStyle(
              color: Colors.white.withOpacity(0.65),
              fontSize: 13,
            ),
          ),

          const SizedBox(height: 20),

          Row(
            children: [
              Text(
                item.price,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Spacer(),

              SizedBox(
                height: 44,
                child: ElevatedButton(
                  onPressed: onBuy,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                    const Color(0xFF8B5CF6),
                    elevation: 0,
                    padding:
                    const EdgeInsets.symmetric(
                      horizontal: 24,
                    ),
                    shape:
                    RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    'BUY',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}