import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class BlockModel {
  const BlockModel({
    required this.id,
    required this.x,
    required this.y,
    required this.width,
    required this.height,
    required this.color,
    this.isPlaced = false,
    this.isMoving = false,
    this.isFalling = false,
  });

  final int id;
  final double x;
  final double y;
  final double width;
  final double height;
  final Color color;

  final bool isPlaced;
  final bool isMoving;
  final bool isFalling;

  /// Geometry
  double get left => x;

  double get top => y;

  double get right => x + width;

  double get bottom => y + height;

  double get centerX => x + width / 2;

  double get centerY => y + height / 2;

  Size get size => Size(width, height);

  Offset get position => Offset(x, y);

  Rect get rect => Rect.fromLTWH(
    x,
    y,
    width,
    height,
  );

  BlockModel copyWith({
    int? id,
    double? x,
    double? y,
    double? width,
    double? height,
    Color? color,
    bool? isPlaced,
    bool? isMoving,
    bool? isFalling,
  }) {
    return BlockModel(
      id: id ?? this.id,
      x: x ?? this.x,
      y: y ?? this.y,
      width: width ?? this.width,
      height: height ?? this.height,
      color: color ?? this.color,
      isPlaced: isPlaced ?? this.isPlaced,
      isMoving: isMoving ?? this.isMoving,
      isFalling: isFalling ?? this.isFalling,
    );
  }

  @override
  String toString() {
    return 'BlockModel('
        'id: $id, '
        'x: $x, '
        'y: $y, '
        'width: $width, '
        'height: $height, '
        'placed: $isPlaced, '
        'moving: $isMoving, '
        'falling: $isFalling'
        ')';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is BlockModel &&
            id == other.id &&
            x == other.x &&
            y == other.y &&
            width == other.width &&
            height == other.height &&
            color == other.color &&
            isPlaced == other.isPlaced &&
            isMoving == other.isMoving &&
            isFalling == other.isFalling;
  }

  @override
  int get hashCode => Object.hash(
    id,
    x,
    y,
    width,
    height,
    color,
    isPlaced,
    isMoving,
    isFalling,
  );
}