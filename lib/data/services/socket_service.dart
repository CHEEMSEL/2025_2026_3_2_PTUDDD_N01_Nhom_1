import 'dart:async';
import '../models/message_model.dart';

/// Mô phỏng kết nối WebSocket real-time cho việc nhận/gửi tin nhắn.
class SocketService {
  final StreamController<MessageModel> _messageController =
      StreamController<MessageModel>.broadcast();

  /// Luồng tin nhắn nhận được theo thời gian thực.
  Stream<MessageModel> get onMessageReceived => _messageController.stream;

  /// Gửi tin nhắn đi và mô phỏng phản hồi của đối phương sau đó.
  Future<void> sendMessage(MessageModel message) async {
    _messageController.add(message);

    // Demo: đối phương trả lời sau 1 giây.
    Timer(const Duration(seconds: 1), () {
      final reply = MessageModel(
        id: 'reply_${DateTime.now().millisecondsSinceEpoch}',
        senderId: 'user_01',
        text: 'Reply to: ${message.text}',
        createdAt: DateTime.now(),
      );
      if (!_messageController.isClosed) {
        _messageController.add(reply);
      }
    });
  }

  void dispose() {
    _messageController.close();
  }
}
