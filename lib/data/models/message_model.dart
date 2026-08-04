import '../../shared/utils/date_formatter.dart';

/// Một tin nhắn trong phòng chat.
class MessageModel {
  final String id;
  final String senderId;
  final String text;
  final DateTime createdAt;

  const MessageModel({
    required this.id,
    required this.senderId,
    required this.text,
    required this.createdAt,
  });

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      id: map['id'] as String? ?? '',
      senderId: map['senderId'] as String? ?? '',
      text: map['text'] as String? ?? '',
      createdAt: DateTime.tryParse(map['createdAt'] as String? ?? '') ??
          DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'senderId': senderId,
        'text': text,
        'createdAt': createdAt.toIso8601String(),
      };

  /// Giờ hiển thị của tin nhắn.
  String get displayTime => DateFormatter.formatTime(createdAt);
}
