// lib/data/local/models/spin_model.dart
import '../../../domain/entities/spin.dart';
import '../../../core/utils/constants.dart';

class SpinModel extends Spin {
  const SpinModel({
    super.id,
    required super.name,
    super.themeColor,
    required super.createdAt,
    super.spinDuration,
    super.isFavorite = false,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'theme_color': themeColor,
        'created_at': createdAt,
        'spin_duration': spinDuration ?? AppConstants.defaultSpinDuration,
        'is_favorite': isFavorite ? 1 : 0,
      };

  factory SpinModel.fromMap(Map<String, dynamic> map) => SpinModel(
        id: map['id'] as int?,
        name: map['name'] as String,
        themeColor: map['theme_color'] as String?,
        createdAt: map['created_at'] as int,
        spinDuration: map['spin_duration'] as int?,
        isFavorite: (map['is_favorite'] as int? ?? 0) == 1,
      );
}
