import '../models/chat_room_model.dart';
import '../models/message_model.dart';
import '../models/notification_model.dart';
import '../models/user_model.dart';

/// Mô phỏng REST API — trả về dữ liệu demo có sẵn sau một độ trễ mạng.
class ApiService {
  /// Dữ liệu demo các phòng chat.
  List<ChatRoomModel> get chatRooms => const [
        ChatRoomModel(id: '1', name: 'Quang Anh', lastMessage: 'Message 1', status: MessageStatus.unread),
        ChatRoomModel(id: '2', name: 'Nope', lastMessage: 'Message 2', status: MessageStatus.read),
        ChatRoomModel(id: '3', name: 'TKT', lastMessage: 'Message 3', status: MessageStatus.sending),
        ChatRoomModel(id: '4', name: 'Ramdom user', lastMessage: 'Message 4', status: MessageStatus.unread),
        ChatRoomModel(id: '5', name: 'Test', lastMessage: 'Message 5', status: MessageStatus.read),
        ChatRoomModel(id: '6', name: 'Test2', lastMessage: 'Message 5', status: MessageStatus.read),
        ChatRoomModel(id: '7', name: 'Test3', lastMessage: 'Message 5', status: MessageStatus.read),
        ChatRoomModel(id: '8', name: 'Test4', lastMessage: 'Message 5', status: MessageStatus.unread),
        ChatRoomModel(id: '9', name: 'Test5', lastMessage: 'Message 5', status: MessageStatus.read),
        ChatRoomModel(id: '10', name: 'Test6', lastMessage: 'Message 5', status: MessageStatus.sending),
        ChatRoomModel(id: '11', name: 'Test7', lastMessage: 'Message 5', status: MessageStatus.sending),
      ];

  /// Danh sách liên hệ demo.
  List<UserModel> get contacts => const [
        UserModel(id: '1', name: 'An Nguyễn', status: 'Online', isOnline: true),
        UserModel(id: '2', name: 'Bình Trần', status: 'Truy cập 5 phút trước', isOnline: false),
        UserModel(id: '3', name: 'Cường Lê', status: 'Online', isOnline: true),
        UserModel(id: '4', name: 'Dũng Phạm', status: 'Truy cập hôm qua', isOnline: false),
        UserModel(id: '5', name: 'Đạt Vũ', status: 'Online', isOnline: true),
        UserModel(id: '6', name: 'Hoàng Nam', status: 'Busy', isOnline: false),
        UserModel(id: '7', name: 'Quang Anh', status: 'Online', isOnline: true),
      ];

  /// Danh sách thông báo demo.
  List<NotificationItemModel> get notifications => const [
        NotificationItemModel(
          type: 'friend_request',
          title: 'Nguyễn Văn A',
          subtitle: 'Đã gửi lời mời kết bạn',
          time: '10p trước',
          avatar: 'A',
          isRead: false,
        ),
        NotificationItemModel(
          type: 'mention',
          title: 'Nhóm ABC ',
          subtitle: 'Trần B đã nhắc đến bạn trong một bình luận',
          time: '1h trước',
          avatar: 'F',
          isRead: true,
        ),
        NotificationItemModel(
          type: 'system',
          title: 'Cảnh báo bảo mật',
          subtitle: 'Đăng nhập mới từ thiết bị Android ở Hà Nội',
          time: 'Hôm qua',
          avatar: '🔒',
          isRead: false,
        ),
      ];

  /// Tin nhắn lịch sử của một phòng chat.
  Future<List<MessageModel>> fetchMessages(String roomId) async {
    await _simulateNetworkDelay();
    final now = DateTime.now();
    return [
      MessageModel(id: '1', senderId: 'user_01', text: 'Message 1', createdAt: now.subtract(const Duration(minutes: 10))),
      MessageModel(id: '2', senderId: 'my_ID', text: 'Message 2', createdAt: now.subtract(const Duration(minutes: 9))),
      MessageModel(id: '3', senderId: 'user_01', text: 'Test Message 3', createdAt: now.subtract(const Duration(minutes: 8))),
      MessageModel(id: '4', senderId: 'my_ID', text: 'Ahawdwadawdwad', createdAt: now.subtract(const Duration(minutes: 7))),
      MessageModel(id: '5', senderId: 'user_01', text: '👍👍👍👍👍👍👍👍👍', createdAt: now.subtract(const Duration(minutes: 6))),
    ];
  }

  Future<List<ChatRoomModel>> fetchChatRooms() async {
    await _simulateNetworkDelay();
    return chatRooms;
  }

  Future<List<UserModel>> fetchContacts() async {
    await _simulateNetworkDelay();
    return contacts;
  }

  Future<List<NotificationItemModel>> fetchNotifications() async {
    await _simulateNetworkDelay();
    return notifications;
  }

  Future<void> _simulateNetworkDelay() async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
  }
}
