// lib/data/local/models/item_model.dart
import '../../../domain/entities/item.dart';

class ItemModel extends Item {
  const ItemModel({
    super.id,
    super.spinId,
    required super.label,
    super.weight = 1,
    super.color,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'spin_id': spinId,
        'label': label,
        'weight': weight,
        'color': color,
      };

  factory ItemModel.fromMap(Map<String, dynamic> map) => ItemModel(
        id: map['id'] as int?,
        spinId: map['spin_id'] as int?,
        label: map['label'] as String,
        weight: map['weight'] as int,
        color: map['color'] as String?,
      );
}
