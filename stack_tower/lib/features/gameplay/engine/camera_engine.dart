import '../models/tower_model.dart';

class CameraEngine {
  CameraEngine({
    this.followStartHeight = 300,
    this.followSpeed = 6,
  });

  final double followStartHeight;
  final double followSpeed;

  double _offsetY = 0;

  double get offsetY => _offsetY;

  void update({
    required TowerModel tower,
    required double screenHeight,
    required double dt,
  }) {
    if (tower.topBlock == null) return;

    final towerTop = tower.topBlock!.y;

    final targetY = screenHeight * 0.55;

    if (towerTop < targetY) {
      final desiredOffset = targetY - towerTop;

      _offsetY +=
          (desiredOffset - _offsetY) *
              dt *
              followSpeed;
    }
  }

  void reset() {
    _offsetY = 0;
  }
}