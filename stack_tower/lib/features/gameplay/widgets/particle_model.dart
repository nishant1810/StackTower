import 'package:flutter/material.dart';

class ParticleModel {
  ParticleModel({
    required this.position,
    required this.velocity,
    required this.color,
  });

  Offset position;
  Offset velocity;
  Color color;
}