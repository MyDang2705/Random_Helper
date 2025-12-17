class Spin {
  final int? id;
  final String name;
  final String? themeColor;
  final int createdAt;
  final int? spinDuration; // Thời gian quay tính bằng milliseconds
  final bool isFavorite; // Đánh dấu vòng quay yêu thích

  const Spin({
    this.id,
    required this.name,
    this.themeColor,
    required this.createdAt,
    this.spinDuration,
    this.isFavorite = false,
  });

  Spin copyWith({
    int? id,
    String? name,
    String? themeColor,
    int? createdAt,
    int? spinDuration,
    bool? isFavorite,
  }) =>
      Spin(
        id: id ?? this.id,
        name: name ?? this.name,
        themeColor: themeColor ?? this.themeColor,
        createdAt: createdAt ?? this.createdAt,
        spinDuration: spinDuration ?? this.spinDuration,
        isFavorite: isFavorite ?? this.isFavorite,
      );
}
