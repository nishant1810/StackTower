import 'package:flutter/material.dart';

enum BlockCurrency {
  coins,
  diamonds,
}

class BlockSkin {
  final String id;
  final String name;
  final String description;

  final int price;
  final BlockCurrency currency;

  final bool premium;

  final Color primaryColor;
  final Color secondaryColor;

  const BlockSkin({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.currency,
    required this.primaryColor,
    required this.secondaryColor,
    this.premium = false,
  });
}