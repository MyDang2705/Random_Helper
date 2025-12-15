import '../repositories/spin_repository.dart';
import '../entities/item.dart';

/// Use case để khôi phục lại các items đã bị xóa sau khi quay
/// Lấy từ lịch sử results và tạo lại items (với weight và color mặc định)
class RestoreItems {
  final SpinRepository repository;

  RestoreItems(this.repository);

  /// Khôi phục tất cả items đã quay từ lịch sử results
  /// Trả về số lượng items đã khôi phục
  Future<int> execute(int spinId) async {
    // Lấy tất cả results của spin này
    final results = await repository.getResultsBySpinId(spinId);

    if (results.isEmpty) {
      return 0; // Không có gì để khôi phục
    }

    // Lấy danh sách labels từ results (loại bỏ trùng lặp nếu có)
    final restoredLabels = <String>{};
    for (var result in results) {
      final label = result['item_label'] as String?;
      if (label != null && label.isNotEmpty) {
        restoredLabels.add(label);
      }
    }

    // Tạo lại items với weight=1 và color=null (mặc định)
    int restoredCount = 0;
    for (var label in restoredLabels) {
      final item = Item(
        label: label,
        weight: 1, // Mặc định
        color: null, // Không lưu color trong results nên để null
      );
      await repository.addItem(spinId, item);
      restoredCount++;
    }

    // Xóa tất cả results sau khi khôi phục (reset lịch sử)
    await repository.deleteResultsBySpinId(spinId);

    return restoredCount;
  }
}
