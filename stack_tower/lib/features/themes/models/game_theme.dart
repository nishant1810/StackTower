import 'package:flutter/material.dart';

class GameTheme {
  final String id;
  final String name;
  final int cost;

  final Color primary;
  final Color secondary;
  final Color glow;

  const GameTheme({
    required this.id,
    required this.name,
    required this.cost,
    required this.primary,
    required this.secondary,
    required this.glow,
  });
}