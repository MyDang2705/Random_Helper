import 'package:flutter/material.dart';
import '../../domain/entities/spin_template.dart';
import 'color_palettes.dart';

/// Danh sách các template gợi ý để tạo vòng quay
class SpinTemplates {
  static final List<SpinTemplate> allTemplates = [
    // Category: Ăn uống
    SpinTemplate(
      id: 'food_vietnamese',
      name: 'Món ăn Việt Nam',
      category: 'Ăn uống',
      description: 'Các món ăn truyền thống Việt Nam',
      icon: '🍜',
      items: [
        'Phở',
        'Bún chả',
        'Bánh mì',
        'Cơm tấm',
        'Bánh xèo',
        'Chả giò',
        'Gỏi cuốn',
        'Bún bò Huế',
      ],
      suggestedColorPalette: ColorPalettes.paletteToJson([
        const Color(0xFFFF8C00), // Orange
        const Color(0xFFFF4500), // Orange Red
        const Color(0xFFFF6347), // Tomato
        const Color(0xFFFFD700), // Gold
      ]),
    ),
    SpinTemplate(
      id: 'food_fast',
      name: 'Đồ ăn nhanh',
      category: 'Ăn uống',
      description: 'Các món đồ ăn nhanh phổ biến',
      icon: '🍔',
      items: [
        'Burger',
        'Pizza',
        'Gà rán',
        'Mì Ý',
        'Taco',
        'Sandwich',
        'Hot dog',
        'Sushi',
      ],
      suggestedColorPalette: ColorPalettes.paletteToJson([
        const Color(0xFFFF0000), // Red
        const Color(0xFFFF8C00), // Orange
        const Color(0xFFFFD700), // Yellow
        const Color(0xFFFF1493), // Deep Pink
      ]),
    ),
    SpinTemplate(
      id: 'food_dessert',
      name: 'Tráng miệng',
      category: 'Ăn uống',
      description: 'Các món tráng miệng ngọt ngào',
      icon: '🍰',
      items: [
        'Bánh kem',
        'Kem',
        'Chè',
        'Bánh flan',
        'Macaron',
        'Tiramisu',
        'Cheesecake',
        'Mochi',
      ],
      suggestedColorPalette: ColorPalettes.paletteToJson([
        const Color(0xFFFFB6C1), // Light Pink
        const Color(0xFFFFC0CB), // Pink
        const Color(0xFFFFE4E1), // Misty Rose
        const Color(0xFFFF69B4), // Hot Pink
      ]),
    ),

    // Category: Du lịch
    SpinTemplate(
      id: 'travel_vietnam',
      name: 'Đi đâu ở Việt Nam?',
      category: 'Du lịch',
      description: 'Các điểm du lịch trong nước',
      icon: '🏞️',
      items: [
        'Đà Lạt',
        'Hạ Long',
        'Phú Quốc',
        'Sapa',
        'Hội An',
        'Nha Trang',
        'Đà Nẵng',
        'Mũi Né',
      ],
      suggestedColorPalette: ColorPalettes.paletteToJson([
        const Color(0xFF20B2AA), // Light Sea Green
        const Color(0xFF40E0D0), // Turquoise
        const Color(0xFF87CEEB), // Sky Blue
        const Color(0xFF00CED1), // Dark Turquoise
      ]),
    ),
    SpinTemplate(
      id: 'travel_world',
      name: 'Du lịch thế giới',
      category: 'Du lịch',
      description: 'Các điểm du lịch quốc tế',
      icon: '✈️',
      items: [
        'Tokyo',
        'Paris',
        'Bali',
        'Singapore',
        'Thái Lan',
        'Dubai',
        'New York',
        'London',
      ],
      suggestedColorPalette: ColorPalettes.paletteToJson([
        const Color(0xFF4B0082), // Indigo
        const Color(0xFF6A5ACD), // Slate Blue
        const Color(0xFF9370DB), // Medium Purple
        const Color(0xFFBA55D3), // Medium Orchid
      ]),
    ),
    SpinTemplate(
      id: 'travel_activity',
      name: 'Hoạt động du lịch',
      category: 'Du lịch',
      description: 'Các hoạt động khi đi du lịch',
      icon: '🏖️',
      items: [
        'Tắm biển',
        'Leo núi',
        'Tham quan',
        'Shopping',
        'Ăn uống',
        'Chụp ảnh',
        'Nghỉ dưỡng',
        'Khám phá',
      ],
      suggestedColorPalette: ColorPalettes.paletteToJson([
        const Color(0xFFFFD700), // Gold
        const Color(0xFFFF8C00), // Orange
        const Color(0xFF00CED1), // Turquoise
        const Color(0xFF00BFFF), // Deep Sky Blue
      ]),
    ),

    // Category: Con vật
    SpinTemplate(
      id: 'animal_pet',
      name: 'Thú cưng',
      category: 'Con vật',
      description: 'Các loài thú cưng phổ biến',
      icon: '🐾',
      items: [
        'Chó',
        'Mèo',
        'Chim',
        'Cá',
        'Thỏ',
        'Hamster',
        'Rùa',
        'Nhím',
      ],
      suggestedColorPalette: ColorPalettes.paletteToJson([
        const Color(0xFF8B4513), // Saddle Brown
        const Color(0xFFD2691E), // Chocolate
        const Color(0xFFF4A460), // Sandy Brown
        const Color(0xFFFFD700), // Gold
      ]),
    ),
    SpinTemplate(
      id: 'animal_wild',
      name: 'Động vật hoang dã',
      category: 'Con vật',
      description: 'Các loài động vật hoang dã',
      icon: '🦁',
      items: [
        'Sư tử',
        'Hổ',
        'Voi',
        'Gấu',
        'Cá heo',
        'Đại bàng',
        'Khỉ',
        'Rắn',
      ],
      suggestedColorPalette: ColorPalettes.paletteToJson([
        const Color(0xFFFF4500), // Orange Red
        const Color(0xFFFF8C00), // Dark Orange
        const Color(0xFF8B4513), // Saddle Brown
        const Color(0xFF654321), // Dark Brown
      ]),
    ),

    // Category: Giải trí
    SpinTemplate(
      id: 'entertainment_movie',
      name: 'Xem phim gì?',
      category: 'Giải trí',
      description: 'Thể loại phim yêu thích',
      icon: '🎬',
      items: [
        'Hành động',
        'Tình cảm',
        'Hài',
        'Kinh dị',
        'Khoa học viễn tưởng',
        'Hoạt hình',
        'Tài liệu',
        'Cổ trang',
      ],
      suggestedColorPalette: ColorPalettes.paletteToJson([
        const Color(0xFF8A2BE2), // Blue Violet
        const Color(0xFF9370DB), // Medium Purple
        const Color(0xFF4B0082), // Indigo
        const Color(0xFFFF1493), // Deep Pink
      ]),
    ),
    SpinTemplate(
      id: 'entertainment_music',
      name: 'Nghe nhạc gì?',
      category: 'Giải trí',
      description: 'Thể loại nhạc yêu thích',
      icon: '🎵',
      items: [
        'Pop',
        'Rock',
        'EDM',
        'Hip Hop',
        'Jazz',
        'Classical',
        'Country',
        'R&B',
      ],
      suggestedColorPalette: ColorPalettes.paletteToJson([
        const Color(0xFFFF0000), // Red
        const Color(0xFFFF8C00), // Orange
        const Color(0xFFFFD700), // Yellow
        const Color(0xFF00FF00), // Lime
        const Color(0xFF0000FF), // Blue
        const Color(0xFFFF1493), // Deep Pink
      ]),
    ),
    SpinTemplate(
      id: 'entertainment_game',
      name: 'Chơi game gì?',
      category: 'Giải trí',
      description: 'Thể loại game',
      icon: '🎮',
      items: [
        'Action',
        'RPG',
        'Puzzle',
        'Strategy',
        'Racing',
        'Sports',
        'Fighting',
        'Simulation',
      ],
      suggestedColorPalette: ColorPalettes.paletteToJson([
        const Color(0xFF00FF00), // Lime
        const Color(0xFF00CED1), // Dark Turquoise
        const Color(0xFF1E90FF), // Dodger Blue
        const Color(0xFFFF1493), // Deep Pink
      ]),
    ),

    // Category: Học tập
    SpinTemplate(
      id: 'study_subject',
      name: 'Học môn gì?',
      category: 'Học tập',
      description: 'Các môn học',
      icon: '📚',
      items: [
        'Toán',
        'Văn',
        'Anh',
        'Lý',
        'Hóa',
        'Sinh',
        'Sử',
        'Địa',
      ],
      suggestedColorPalette: ColorPalettes.paletteToJson([
        const Color(0xFF4682B4), // Steel Blue
        const Color(0xFF1E90FF), // Dodger Blue
        const Color(0xFF00CED1), // Dark Turquoise
        const Color(0xFF20B2AA), // Light Sea Green
      ]),
    ),
    SpinTemplate(
      id: 'study_skill',
      name: 'Học kỹ năng gì?',
      category: 'Học tập',
      description: 'Các kỹ năng cần học',
      icon: '💡',
      items: [
        'Lập trình',
        'Tiếng Anh',
        'Nấu ăn',
        'Vẽ',
        'Nhảy',
        'Hát',
        'Chụp ảnh',
        'Viết lách',
      ],
      suggestedColorPalette: ColorPalettes.paletteToJson([
        const Color(0xFFFFD700), // Gold
        const Color(0xFFFF8C00), // Orange
        const Color(0xFF9370DB), // Medium Purple
        const Color(0xFF00BFFF), // Deep Sky Blue
      ]),
    ),

    // Category: Công việc
    SpinTemplate(
      id: 'work_task',
      name: 'Làm việc gì trước?',
      category: 'Công việc',
      description: 'Sắp xếp công việc',
      icon: '💼',
      items: [
        'Email quan trọng',
        'Cuộc họp',
        'Báo cáo',
        'Thiết kế',
        'Code',
        'Review',
        'Testing',
        'Nghỉ giải lao',
      ],
      suggestedColorPalette: ColorPalettes.paletteToJson([
        const Color(0xFF1E40AF), // Blue 800
        const Color(0xFF3B82F6), // Blue 500
        const Color(0xFF0EA5E9), // Sky 500
        const Color(0xFF64748B), // Slate 500
      ]),
    ),
  ];

  /// Lấy danh sách categories duy nhất
  static List<String> get categories {
    final cats = allTemplates.map((t) => t.category).toSet().toList();
    cats.sort();
    return cats;
  }

  /// Lấy templates theo category
  static List<SpinTemplate> getTemplatesByCategory(String category) {
    return allTemplates.where((t) => t.category == category).toList();
  }

  /// Lấy template theo ID
  static SpinTemplate? getTemplateById(String id) {
    try {
      return allTemplates.firstWhere((t) => t.id == id);
    } catch (e) {
      return null;
    }
  }
}
