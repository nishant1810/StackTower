import 'package:flutter/foundation.dart';

import 'block_model.dart';

@immutable
class TowerModel {
  const TowerModel({
    this.blocks = const [],
  });

  /// All placed blocks.
  final List<BlockModel> blocks;

  //---------------------------------------------------------------------------
  // Getters
  //---------------------------------------------------------------------------

  int get length => blocks.length;

  bool get isEmpty => blocks.isEmpty;

  bool get isNotEmpty => blocks.isNotEmpty;

  BlockModel? get topBlock =>
      blocks.isEmpty ? null : blocks.last;

  BlockModel? get bottomBlock =>
      blocks.isEmpty ? null : blocks.first;

  double get height {
    if (blocks.isEmpty) return 0;

    return blocks.length * blocks.first.height;
  }

  double get width {
    if (blocks.isEmpty) return 0;

    return blocks.last.width;
  }

  double get topX => topBlock?.x ?? 0;

  double get topY => topBlock?.y ?? 0;

  //---------------------------------------------------------------------------
  // Operations
  //---------------------------------------------------------------------------

  TowerModel addBlock(BlockModel block) {
    return TowerModel(
      blocks: [
        ...blocks,
        block,
      ],
    );
  }

  TowerModel removeTopBlock() {
    if (blocks.isEmpty) return this;

    return TowerModel(
      blocks: blocks.sublist(
        0,
        blocks.length - 1,
      ),
    );
  }

  TowerModel replaceTop(BlockModel block) {
    if (blocks.isEmpty) {
      return addBlock(block);
    }

    final updated = List<BlockModel>.from(blocks);

    updated[updated.length - 1] = block;

    return TowerModel(
      blocks: updated,
    );
  }

  TowerModel clear() {
    return const TowerModel();
  }

  TowerModel copyWith({
    List<BlockModel>? blocks,
  }) {
    return TowerModel(
      blocks: blocks ?? this.blocks,
    );
  }

  //---------------------------------------------------------------------------
  // Equality
  //---------------------------------------------------------------------------

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is TowerModel &&
            listEquals(
              other.blocks,
              blocks,
            );
  }

  @override
  int get hashCode =>
      Object.hashAll(blocks);

  @override
  String toString() =>
      'TowerModel(blocks: $length)';
}