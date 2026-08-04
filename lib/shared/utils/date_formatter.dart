/// Các hàm bổ trợ định dạng ngày giờ cho giao diện chat.
abstract final class DateFormatter {
  /// Định dạng giờ dạng 12 giờ, ví dụ: `10:30 AM`.
  static String formatTime(DateTime time) {
    final hour = time.hour % 12 == 0 ? 12 : time.hour % 12;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.hour >= 12 ? 'PM' : 'AM';
    return '$hour:$minute $period';
  }
}
