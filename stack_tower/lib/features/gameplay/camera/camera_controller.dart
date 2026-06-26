import 'package:flutter/material.dart';

class CameraController extends ChangeNotifier {
  CameraController({
    this.followSpeed = 6,
  });

  final double followSpeed;

  double _offsetY = 0;

  double get offsetY => _offsetY;

  double _targetOffset = 0;

  //------------------------------------------------------------

  void update({
    required double towerTop,
    required double screenHeight,
    double safeArea = 220,
    double dt = 1 / 60,
  }) {
    final desired =
        towerTop - screenHeight + safeArea;

    _targetOffset =
    desired < 0 ? 0 : desired;

    _offsetY +=
        (_targetOffset - _offsetY) *
            followSpeed *
            dt;

    notifyListeners();
  }

  //------------------------------------------------------------

  void reset() {
    _offsetY = 0;
    _targetOffset = 0;

    notifyListeners();
  }
}