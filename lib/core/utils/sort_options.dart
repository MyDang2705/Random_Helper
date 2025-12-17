// lib/core/utils/sort_options.dart
import 'package:flutter/material.dart';

enum SpinSortOption {
  newestFirst, // Mới nhất trước (mặc định)
  oldestFirst, // Cũ nhất trước
  nameAZ, // Tên A-Z
  nameZA, // Tên Z-A
  favoriteFirst, // Yêu thích trước
  notFavoriteFirst, // Không yêu thích trước
}

extension SpinSortOptionExtension on SpinSortOption {
  String get displayName {
    switch (this) {
      case SpinSortOption.newestFirst:
        return 'Mới nhất trước';
      case SpinSortOption.oldestFirst:
        return 'Cũ nhất trước';
      case SpinSortOption.nameAZ:
        return 'Tên A-Z';
      case SpinSortOption.nameZA:
        return 'Tên Z-A';
      case SpinSortOption.favoriteFirst:
        return 'Yêu thích trước';
      case SpinSortOption.notFavoriteFirst:
        return 'Không yêu thích trước';
    }
  }

  IconData get icon {
    switch (this) {
      case SpinSortOption.newestFirst:
        return Icons.access_time;
      case SpinSortOption.oldestFirst:
        return Icons.history;
      case SpinSortOption.nameAZ:
        return Icons.sort_by_alpha;
      case SpinSortOption.nameZA:
        return Icons.sort_by_alpha;
      case SpinSortOption.favoriteFirst:
        return Icons.favorite;
      case SpinSortOption.notFavoriteFirst:
        return Icons.favorite_border;
    }
  }
}

