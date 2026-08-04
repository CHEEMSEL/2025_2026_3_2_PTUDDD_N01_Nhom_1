import '../../data/models/chat_room_model.dart';
import '../../data/models/message_model.dart';

/// Trạng thái tải dữ liệu của phòng chat.
enum ChatStatus { initial, loading, loaded, error }

/// Trạng thái quản lý luồng dữ liệu của phòng chat.
class ChatState {
  final ChatStatus status;
  final List<ChatRoomModel> rooms;
  final List<MessageModel> messages;
  final String? errorMessage;

  const ChatState({
    this.status = ChatStatus.initial,
    this.rooms = const [],
    this.messages = const [],
    this.errorMessage,
  });

  ChatState copyWith({
    ChatStatus? status,
    List<ChatRoomModel>? rooms,
    List<MessageModel>? messages,
    String? errorMessage,
  }) {
    return ChatState(
      status: status ?? this.status,
      rooms: rooms ?? this.rooms,
      messages: messages ?? this.messages,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
