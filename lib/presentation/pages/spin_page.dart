// lib/presentation/pages/spin_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/wheel_view.dart';
import '../providers/spin_provider.dart';
import '../../domain/entities/item.dart';
import '../../core/utils/constants.dart';
import '../../core/utils/theme.dart';

class SpinPage extends StatefulWidget {
  final int spinId;
  final String spinName;
  final String? spinColor;
  final int? spinDuration;

  const SpinPage({
    super.key,
    required this.spinId,
    required this.spinName,
    this.spinColor,
    this.spinDuration,
  });

  @override
  _SpinPageState createState() => _SpinPageState();
}

class _SpinPageState extends State<SpinPage> {
  final GlobalKey<WheelViewState> _wheelKey = GlobalKey();
  List<Item> _items = [];
  bool _loading = true;
  String? _lastResult;
  bool _isRestoring = false;
  bool _isShuffling = false;
  bool _isSpinning = false;

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  Future<void> _loadItems() async {
    final prov = Provider.of<SpinProvider>(context, listen: false);
    final list = await prov.getItems(widget.spinId);
    if (mounted) {
      setState(() {
        _items = list;
        _loading = false;
      });
    }
  }

  Future<void> _onRestorePressed() async {
    final prov = Provider.of<SpinProvider>(context, listen: false);
    try {
      setState(() {
        _isRestoring = true;
      });

      final count = await prov.restoreItems(widget.spinId);

      if (mounted) {
        // Clear thông báo cũ trước
        ScaffoldMessenger.of(context).hideCurrentSnackBar();

        if (count > 0) {
          // Xóa kết quả hiển thị
          setState(() {
            _lastResult = null;
          });

          // Reload items để hiển thị lại
          await _loadItems();

          // Hiển thị thông báo thành công ngay
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Đã khôi phục $count mục'),
                backgroundColor: AppColors.success,
                duration: const Duration(seconds: 1),
              ),
            );
          }
        } else {
          // Không có gì để khôi phục
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Không có mục nào để khôi phục'),
                duration: Duration(seconds: 1),
              ),
            );
          }
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Lỗi: ${e.toString()}'),
            backgroundColor: AppColors.error,
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isRestoring = false;
        });
      }
    }
  }

  Future<void> _onShufflePressed() async {
    // Hiển thị thông báo ngay lập tức khi bấm
    if (mounted) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Đã trộn danh sách'),
          backgroundColor: AppColors.success,
          duration: Duration(seconds: 1),
        ),
      );
    }

    final prov = Provider.of<SpinProvider>(context, listen: false);
    try {
      setState(() {
        _isShuffling = true;
      });

      await prov.shuffleItems(widget.spinId);

      if (mounted) {
        // Reload items để hiển thị lại theo thứ tự mới
        await _loadItems();

        // Xóa kết quả hiển thị
        setState(() {
          _lastResult = null;
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Lỗi: ${e.toString()}'),
            backgroundColor: AppColors.error,
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isShuffling = false;
        });
      }
    }
  }

  Future<void> _onSpinPressed() async {
    if (_items.isEmpty) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Chưa có mục để quay')),
        );
      }
      return;
    }

    // Kiểm tra xem vòng quay có đang quay không
    if (_isSpinning || _wheelKey.currentState?.isSpinning() == true) {
      // Đang quay thì không làm gì cả
      return;
    }

    final prov = Provider.of<SpinProvider>(context, listen: false);
    try {
      // Đánh dấu đang quay
      setState(() {
        _isSpinning = true;
      });

      final chosen = await prov.spinOnce(widget.spinId);
      final idx = _items.indexWhere((e) => e.id == chosen.id);
      await _wheelKey.currentState?.spinToIndex(idx >= 0 ? idx : 0);

      // Đánh dấu quay xong
      if (mounted) {
        setState(() {
          _isSpinning = false;
        });
      }
      if (mounted) {
        setState(() {
          _lastResult = chosen.label;
        });

        // Xóa item đã quay được khỏi danh sách
        if (chosen.id != null) {
          await prov.deleteItem(chosen.id!);
          // Reload items để cập nhật danh sách
          await _loadItems();
        }

        if (!mounted) return;
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha:0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.celebration,
                    color: AppColors.primary,
                    size: 32,
                  ),
                ),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Kết quả',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    chosen.label,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Mục này đã được loại bỏ khỏi vòng quay',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.softText,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            actions: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Tiếp tục'),
                ),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      // Đánh dấu quay xong (hoặc lỗi)
      if (mounted) {
        setState(() {
          _isSpinning = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Lỗi khi quay: ${e.toString()}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        title: Text(
          widget.spinName,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
          ),
        ),
        centerTitle: false,
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 32),
                    // Hiển thị kết quả ở trên
                    if (_lastResult != null)
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 24),
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 32),
                        decoration: BoxDecoration(
                          color: AppColors.bgCard,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: AppColors.primary.withValues(alpha:0.3),
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withValues(alpha:0.15),
                              blurRadius: 16,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Text(
                          _lastResult!,
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                            letterSpacing: 0.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    else
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 24),
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 24),
                        child: Text(
                          'Chạm START để quay',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.softText,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    const SizedBox(height: 24),
                    // Mũi tên chỉ vào bánh xe
                    CustomPaint(
                      size: const Size(50, 40),
                      painter: _ArrowPainter(),
                    ),
                    const SizedBox(height: 12),
                    // Bánh xe với nút START ở giữa - căn giữa
                    Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          WheelView(
                            key: _wheelKey,
                            items: _items,
                            themeColor: widget.spinColor,
                            size: AppConstants.defaultWheelSize,
                            spinDuration: widget.spinDuration,
                            onSpinEnd: (index) {
                              // Callback khi quay xong
                            },
                          ),
                          // Nút START có thể click được
                          GestureDetector(
                            onTap: (_items.isEmpty || _isSpinning)
                                ? null
                                : _onSpinPressed,
                            child: Container(
                              width: AppConstants.defaultWheelSize * 0.25,
                              height: AppConstants.defaultWheelSize * 0.25,
                              decoration: BoxDecoration(
                                color: _isSpinning
                                    ? Colors.grey.shade300
                                    : Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha:0.2),
                                    blurRadius: 12,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  'START',
                                  style: TextStyle(
                                    fontSize:
                                        AppConstants.defaultWheelSize * 0.06,
                                    fontWeight: FontWeight.bold,
                                    color: _isSpinning
                                        ? Colors.grey.shade600
                                        : const Color(0xFF1E40AF),
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    // Hai nút Shuffle và Restart - gọn gàng, đẹp
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Nút Shuffle - trộn danh sách
                          _CompactActionButton(
                            icon: Icons.shuffle,
                            label: 'Trộn',
                            onPressed: _items.length > 1 &&
                                    !_isShuffling &&
                                    !_isRestoring
                                ? _onShufflePressed
                                : null,
                            isLoading: _isShuffling,
                            color: AppColors.primary,
                          ),
                          const SizedBox(width: 12),
                          // Nút Restart - khôi phục items
                          _CompactActionButton(
                            icon: Icons.refresh,
                            label: 'Khôi phục',
                            onPressed: !_isRestoring && !_isShuffling
                                ? _onRestorePressed
                                : null,
                            isLoading: _isRestoring,
                            color: AppColors.success,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
    );
  }
}

// Widget button gọn gàng, đẹp cho các action
class _CompactActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Color color;

  const _CompactActionButton({
    required this.icon,
    required this.label,
    this.onPressed,
    this.isLoading = false,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isLoading ? null : onPressed,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          decoration: BoxDecoration(
            color: isLoading ? color.withValues(alpha:0.5) : color,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: color.withValues(alpha:0.3),
              width: 1,
            ),
            boxShadow: isLoading
                ? []
                : [
                    BoxShadow(
                      color: color.withValues(alpha:0.25),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
          ),
          child: isLoading
              ? SizedBox(
                  height: 16,
                  width: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(icon, size: 18, color: Colors.white),
                    const SizedBox(width: 6),
                    Text(
                      label,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

// Custom painter cho mũi tên
class _ArrowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF1E40AF)
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final path = Path();
    // Vẽ mũi tên tam giác chỉ xuống - lớn hơn và rõ ràng hơn
    final arrowWidth = size.width * 0.8;
    final arrowHeight = size.height;
    final leftX = (size.width - arrowWidth) / 2;
    final rightX = leftX + arrowWidth;

    path.moveTo(size.width / 2, arrowHeight); // Điểm dưới (mũi tên)
    path.lineTo(leftX, 0); // Điểm trên trái
    path.lineTo(rightX, 0); // Điểm trên phải
    path.close();

    canvas.drawPath(path, paint);
    // Vẽ border trắng cho mũi tên
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
