/// Entity đại diện cho một template vòng quay gợi ý
class SpinTemplate {
  final String id;
  final String name;
  final String category; // Ăn uống, Du lịch, Con vật...
  final String description;
  final List<String> items; // Danh sách items mẫu
  final String suggestedColorPalette; // JSON color palette
  final String icon; // Icon emoji hoặc tên icon

  const SpinTemplate({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.items,
    required this.suggestedColorPalette,
    this.icon = '🎰',
  });
}
