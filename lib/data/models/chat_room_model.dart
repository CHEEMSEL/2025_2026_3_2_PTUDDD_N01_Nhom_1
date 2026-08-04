/// Trạng thái của một tin nhắn trong danh sách chat.
enum MessageStatus { unread, read, sending }

/// Một phòng chat / hội thoại trong danh sách tin nhắn.
class ChatRoomModel {
  final String id;
  final String name;
  final String lastMessage;
  final MessageStatus status;

  const ChatRoomModel({
    required this.id,
    required this.name,
    required this.lastMessage,
    required this.status,
  });

  factory ChatRoomModel.fromMap(Map<String, dynamic> map) {
    return ChatRoomModel(
      id: map['id'] as String? ?? '',
      name: map['name'] as String? ?? '',
      lastMessage: map['message'] as String? ?? '',
      status: MessageStatus.values.firstWhere(
        (s) => s.name == map['state'],
        orElse: () => MessageStatus.read,
      ),
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'message': lastMessage,
        'state': status.name,
      };
}
