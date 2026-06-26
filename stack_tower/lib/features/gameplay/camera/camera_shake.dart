import 'dart:math';

import 'package:flutter/material.dart';

class CameraShake extends ChangeNotifier {
  CameraShake({
    this.damping = 10,
  });

  final double damping;

  final Random _random = Random();

  Offset _offset = Offset.zero;

  Offset get offset => _offset;

  double _intensity = 0;

  //----------------------------------------------------------
  // Trigger Shake
  //----------------------------------------------------------

  void shake({
    double intensity = 8,
  }) {
    if (intensity > _intensity) {
      _intensity = intensity;
    }
  }

  //----------------------------------------------------------
  // Update
  //----------------------------------------------------------

  void update(double dt) {
    if (_intensity <= .05) {
      _offset = Offset.zero;
      return;
    }

    _offset = Offset(
      (_random.nextDouble() * 2 - 1) * _intensity,
      (_random.nextDouble() * 2 - 1) * _intensity,
    );

    _intensity -= damping * dt;

    if (_intensity < 0) {
      _intensity = 0;
    }

    notifyListeners();
  }

  //----------------------------------------------------------
  // Reset
  //----------------------------------------------------------

  void reset() {
    _offset = Offset.zero;
    _intensity = 0;

    notifyListeners();
  }
}