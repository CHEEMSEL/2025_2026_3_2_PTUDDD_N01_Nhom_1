import 'dart:async';
import '../models/chat_room_model.dart';
import '../models/message_model.dart';
import '../models/notification_model.dart';
import '../models/user_model.dart';
import '../services/api_service.dart';
import '../services/socket_service.dart';
import '../../shared/constants/app_strings.dart';

/// Trung gian điều phối dữ liệu chat giữa API và Socket.
class ChatRepository {
  ChatRepository({ApiService? apiService, SocketService? socketService})
      : _apiService = apiService ?? ApiService(),
        _socketService = socketService ?? SocketService();

  final ApiService _apiService;
  final SocketService _socketService;

  /// Lấy danh sách phòng chat (lịch sử).
  Future<List<ChatRoomModel>> getChatRooms() => _apiService.fetchChatRooms();

  /// Lấy danh sách liên hệ.
  Future<List<UserModel>> getContacts() => _apiService.fetchContacts();

  /// Lấy danh sách thông báo.
  Future<List<NotificationItemModel>> getNotifications() =>
      _apiService.fetchNotifications();

  /// Lấy lịch sử tin nhắn của một phòng chat.
  Future<List<MessageModel>> getMessages(String roomId) =>
      _apiService.fetchMessages(roomId);

  /// Luồng tin nhắn real-time từ socket.
  Stream<MessageModel> get messageStream => _socketService.onMessageReceived;

  /// Gửi tin nhắn đi thông qua socket.
  Future<void> sendMessage(String text) async {
    final message = MessageModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      senderId: AppStrings.currentUserId,
      text: text,
      createdAt: DateTime.now(),
    );
    await _socketService.sendMessage(message);
  }

  void dispose() {
    _socketService.dispose();
  }
}