import 'package:flutter/material.dart';

/// Màu sắc chung cho toàn bộ ứng dụng.
abstract final class AppColors {
  /// Màu gốc dùng để sinh ra bảng màu Material 3.
  static const Color seed = Colors.blue;

  /// Các màu nhấn (accent) cho đoạn chat.
  static const List<Color> chatAccents = [
    Colors.blue,
    Colors.purple,
    Colors.teal,
    Colors.orange,
    Colors.pink,
    Colors.green,
  ];
}