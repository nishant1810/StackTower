class CameraModel {
  const CameraModel({
    required this.offsetY,
  });

  final double offsetY;

  CameraModel copyWith({
    double? offsetY,
  }) {
    return CameraModel(
      offsetY: offsetY ?? this.offsetY,
    );
  }
}