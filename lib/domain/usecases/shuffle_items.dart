import 'dart:math';
import '../repositories/spin_repository.dart';
import '../entities/item.dart';

/// Use case để trộn (shuffle) danh sách items trong một vòng quay
/// Sử dụng Fisher-Yates shuffle algorithm
class ShuffleItems {
  final SpinRepository repository;
  final Random _random;

  ShuffleItems(this.repository, [Random? random])
      : _random = random ?? Random();

  /// Trộn danh sách items của một spin
  /// Sẽ xóa tất cả items hiện tại và insert lại theo thứ tự mới
  Future<void> execute(int spinId) async {
    // Lấy danh sách items hiện tại
    final items = await repository.getItemsBySpinId(spinId);

    if (items.length <= 1) {
      return; // Không cần shuffle nếu <= 1 item
    }

    // Tạo bản sao của danh sách để shuffle
    final shuffledItems = List<Item>.from(items);

    // Fisher-Yates shuffle algorithm
    for (int i = shuffledItems.length - 1; i > 0; i--) {
      final j = _random.nextInt(i + 1);
      // Swap
      final temp = shuffledItems[i];
      shuffledItems[i] = shuffledItems[j];
      shuffledItems[j] = temp;
    }

    // Xóa tất cả items cũ và insert lại theo thứ tự mới
    await repository.replaceItems(spinId, shuffledItems);
  }
}
