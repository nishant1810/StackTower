import 'package:flutter/material.dart';

class GameTheme {
  final String id;
  final String name;
  final String previewImage;

  final int coinCost;
  final int diamondCost;

  final bool isPremium;

  final List<Color> colors;

  const GameTheme({
    required this.id,
    required this.name,
    required this.previewImage,
    required this.coinCost,
    required this.diamondCost,
    required this.isPremium,
    required this.colors,
  });
}