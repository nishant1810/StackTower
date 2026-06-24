// lib/models/game_theme.dart

import 'package:flutter/material.dart';

class GameTheme {
  final String id;
  final String name;
  final int cost;
  final List<Color> colors;

  const GameTheme({
    required this.id,
    required this.name,
    required this.cost,
    required this.colors,
  });
}