// lib/core/utils/favorite_templates_helper.dart
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteTemplatesHelper {
  static const String _key = 'favorite_templates';

  /// Lấy danh sách template IDs yêu thích
  static Future<List<String>> getFavoriteTemplateIds() async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList(_key) ?? [];
    return favorites;
  }

  /// Kiểm tra template có phải yêu thích không
  static Future<bool> isFavorite(String templateId) async {
    final favorites = await getFavoriteTemplateIds();
    return favorites.contains(templateId);
  }

  /// Toggle favorite status của template
  static Future<bool> toggleFavorite(String templateId) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = await getFavoriteTemplateIds();
    
    if (favorites.contains(templateId)) {
      favorites.remove(templateId);
    } else {
      favorites.add(templateId);
    }
    
    return await prefs.setStringList(_key, favorites);
  }

  /// Thêm template vào yêu thích
  static Future<bool> addFavorite(String templateId) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = await getFavoriteTemplateIds();
    
    if (!favorites.contains(templateId)) {
      favorites.add(templateId);
      return await prefs.setStringList(_key, favorites);
    }
    return true;
  }

  /// Xóa template khỏi yêu thích
  static Future<bool> removeFavorite(String templateId) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = await getFavoriteTemplateIds();
    
    favorites.remove(templateId);
    return await prefs.setStringList(_key, favorites);
  }
}

